# Deploying MongoDB on an AWS EC2 Instance

## Aim

The aim of this task was to deploy a MongoDB database server on an AWS EC2 instance, connect to it remotely, create a Star Wars collection and run test queries.

This involved:

- Creating or using an EC2 instance
- Connecting to the instance with SSH
- Installing MongoDB
- Starting the MongoDB server process
- Creating a database and collection
- Importing Star Wars character data
- Connecting from MongoDB Compass
- Running queries against the collection

---

## Step 1: EC2 Instance Running

I first created an EC2 instance on AWS. An EC2 instance is a cloud-hosted virtual machine. In this case, the instance was running Ubuntu.

AWS EC2 uses key pairs for secure SSH access. The private key is kept by the user, while the public key is stored on the EC2 instance. This allows the user to connect securely to the cloud server from their local machine.

![Screenshot of EC2 instance running in AWS console](images/ec2-instance-running.png)

---

## Step 2: Connect to the EC2 Instance Using SSH

From my local terminal, I connected to the EC2 instance using SSH:

```bash
ssh -i path/to/key.pem ubuntu@EC2_PUBLIC_IP
```

For example:

```bash
ssh -i my-key.pem ubuntu@3.8.123.45
```

Once connected, the terminal prompt changed to show that I was now inside the EC2 instance.

![Screenshot of terminal connected to EC2 instance over SSH](images/ssh-connected-to-ec2.png)

---

## Step 3: Install MongoDB

I installed MongoDB Community Edition on the Ubuntu EC2 instance.

First, I installed the required dependencies:

```bash
sudo apt update
sudo apt install -y gnupg curl
```

Then I added the MongoDB 7.0 public key:

```bash
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
```

Next I added the MongoDB 7.0 repository for Ubuntu 22.04 Jammy (warning why not most recent version later):

```bash
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
```

Update the package list:

```bash
sudo apt update
```

Finally I installed MongoDB:

```bash
sudo apt install -y mongodb-org
```

![Screenshot of MongoDB installation commands in EC2 terminal](images/mongodb-installation-terminal.png)

---

## Troubleshooting Note: MongoDB 8.0 Issue

During the setup, MongoDB initially failed to start.

I checked the MongoDB service status:

```bash
sudo systemctl status mongod --no-pager
```

Then I checked the logs:

```bash
sudo journalctl -u mongod -n 80 --no-pager
```

The logs showed that MongoDB was failing because of a known compatibility issue between MongoDB 8.0 or newer and newer Linux kernels. Because of this, I used MongoDB 7.0 instead.

![Screenshot of MongoDB error log showing service failure](images/mongodb-error-log.png)

---

## Step 4: Start MongoDB

After installing MongoDB, I started the MongoDB server process using:

```bash
sudo systemctl start mongod
sudo systemctl enable mongod
```

Then I checked the status:

```bash
sudo systemctl status mongod --no-pager
```

The desired output is:

```text
Active: active (running)
```

![Screenshot showing mongod active running](images/mongod-active-running.png)

---

## Step 5: Test MongoDB Locally on EC2

I tested the MongoDB server locally by opening the MongoDB shell:

```bash
mongosh
```

Inside `mongosh`, I checked the available databases:

```javascript
show dbs
```

This confirmed that the MongoDB server was running and accepting local connections.

![Screenshot showing mongosh connected successfully](images/mongosh-connected.png)

---

## Step 6: Create the Star Wars Database and Collection

Inside `mongosh`, I created a database called `starwars_db`:

```javascript
use starwars_db
```

Then I created a collection called `characters`:

```javascript
db.createCollection("characters")
```

MongoDB can also create collections automatically when documents are inserted, but I created it explicitly to make the process clear.

---

## Step 7: Insert or Import Star Wars Character Data

There are two ways to add Star Wars data.

---

### Option A: Insert Documents Manually with `insertMany`

The `insertMany()` method inserts multiple documents into a MongoDB collection from an array of documents.

Example:

```javascript
db.characters.insertMany([
  {
    name: "Luke Skywalker",
    species: "Human",
    homeworld: "Tatooine",
    height_cm: 172,
    affiliation: "Rebel Alliance",
    force_user: true
  },
  {
    name: "Darth Vader",
    species: "Human",
    homeworld: "Tatooine",
    height_cm: 202,
    affiliation: "Galactic Empire",
    force_user: true
  },
  {
    name: "Yoda",
    species: "Unknown",
    homeworld: "Dagobah",
    height_cm: 66,
    affiliation: "Jedi Order",
    force_user: true
  }
])
```

---

### Option B: Import Documents from a JSON File

If the Star Wars characters are stored in a JSON file, the better method is to use `mongoimport`. This is ultimately what I went with as this was the cleanest case.

First, the JSON file needs to be copied onto the EC2 instance. From the local machine, this can be done using `scp`:

```bash
scp -i path/to/key.pem starwars.json ubuntu@EC2_PUBLIC_IP:/home/ubuntu/
```

Then, on the EC2 instance, I checked that the file was present:

```bash
ls
```

If `mongoimport` is not available, install the MongoDB database tools:

```bash
sudo apt install -y mongodb-database-tools
```

If the JSON file is one big array, like this:

```json
[
  { "name": "Luke Skywalker", "species": "Human" },
  { "name": "Darth Vader", "species": "Human" }
]
```

then the import command needs the `--jsonArray` option:

```bash
mongoimport \
  --db starwars_db \
  --collection characters \
  --file /home/ubuntu/starwars.json \
  --jsonArray
```

If the file is one JSON document per line, like this:

```json
{ "name": "Luke Skywalker", "species": "Human" }
{ "name": "Darth Vader", "species": "Human" }
```

then the `--jsonArray` option is not needed:

```bash
mongoimport \
  --db starwars_db \
  --collection characters \
  --file /home/ubuntu/starwars.json
```

**Screenshot placeholder:**

![Screenshot showing mongoimport successfully importing Star Wars JSON data](images/mongoimport-starwars-json.png)

---

## Step 8: Check the Data Was Imported

Inside `mongosh`, I switched to the database:

```javascript
use starwars_db
```

Then I checked the number of documents:

```javascript
db.characters.countDocuments()
```

Then I viewed some of the documents:

```javascript
db.characters.find().limit(5).pretty()
```

![Screenshot showing Star Wars documents inside mongosh](images/starwars-documents-mongosh.png)

---

## Step 9: Run Queries in MongoDB

I ran several example queries to test the collection.

### Find all human characters

```javascript
db.characters.find({ species: "Human" }).pretty()
```

### Find characters taller than 180cm

```javascript
db.characters.find({ height_cm: { $gt: 180 } }).pretty()
```

### Find Rebel Alliance characters

```javascript
db.characters.find({ affiliation: "Rebel Alliance" }).pretty()
```

### Find Force users

```javascript
db.characters.find({ force_user: true }).pretty()
```

### Show only name and height

```javascript
db.characters.find(
  {},
  { _id: 0, name: 1, height_cm: 1 }
).pretty()
```

### Sort by height, tallest first

```javascript
db.characters.find(
  {},
  { _id: 0, name: 1, height_cm: 1 }
).sort({ height_cm: -1 }).pretty()
```

![Screenshot showing MongoDB query results for Star Wars characters](images/starwars-query-results.png)

---

## Connecting to the Database Using MongoDB Compass

After creating and testing the MongoDB database through the EC2 terminal, I also connected to it using MongoDB Compass. This gave me a graphical interface for viewing the same database and collection.

In Compass, I used a MongoDB URI with the EC2 instance’s public IPv4 address:

```text
mongodb://EC2_PUBLIC_IPV4:27017/starwars_db
```

For example:

```text
mongodb://3.8.123.45:27017/starwars_db
```

This connects Compass to the MongoDB server running on the EC2 instance. The database had already been created through the terminal, so Compass was mainly used to view the imported Star Wars character data and run queries in a cleaner interface.

![Screenshot of MongoDB Compass URI connection](images/compass-uri-connection.png)

Once connected, I opened:

```text
starwars_db -> characters
```

![Screenshot of Star Wars collection in MongoDB Compass](images/compass-starwars-collection.png)

## Sources

- AWS EC2 key pairs documentation: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html
- AWS security group rules documentation: https://docs.aws.amazon.com/vpc/latest/userguide/security-group-rules.html
- MongoDB 7.0 Ubuntu installation documentation: https://www.mongodb.com/docs/v7.0/tutorial/install-mongodb-on-ubuntu/
- MongoDB 8.0 release notes and kernel compatibility warning: https://www.mongodb.com/docs/v8.0/release-notes/8.0/
- MongoDB `insertMany` documentation: https://www.mongodb.com/docs/manual/reference/method/db.collection.insertMany/
- MongoDB `mongoimport` documentation: https://www.mongodb.com/docs/database-tools/mongoimport/
- MongoDB Compass SSH tunnel documentation: https://www.mongodb.com/docs/compass/connect/advanced-connection-options/ssh-connection/