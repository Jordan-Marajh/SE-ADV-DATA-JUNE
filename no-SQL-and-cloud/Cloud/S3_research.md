# Amazon S3 Research

## What is S3? What does it stand for?

Amazon S3 stands for **Amazon Simple Storage Service**.

It is a cloud storage service provided by Amazon Web Services (AWS). S3 allows users and organisations to store large amounts of data without needing to manage physical storage hardware.

S3 is designed to be scalable, durable, secure and accessible over the internet.

## How does S3 work? What type of storage is it?

S3 is an **object storage** service.

Object storage stores data as individual objects rather than using the folder structure of traditional file storage or the fixed blocks used by block storage.

Each object contains:

- The data itself
- A unique object key
- Metadata describing the object
- Optional tags
- Optional version information

The basic process is:

1. Create an S3 bucket.
2. Upload objects into the bucket.
3. Configure permissions.
4. Access, process, copy, archive or delete the objects when required.

Applications can interact with S3 through the AWS Management Console, the AWS Command Line Interface, software development kits or APIs.

## What are buckets? How do they work?

A **bucket** is a container used to store objects in S3.

Every object must be stored inside a bucket. When creating a bucket, the user chooses:

- A bucket name
- An AWS Region
- Security and access settings
- Optional features such as encryption and versioning

Bucket names must be globally unique within the relevant AWS environment.

An S3 object can be referred to using the bucket name and object key.

For example:

    s3://company-data/sales/2026/january.csv

In this example:

- `company-data` is the bucket
- `sales/2026/january.csv` is the object key

Buckets are private by default. Access can be managed using:

- AWS Identity and Access Management policies
- Bucket policies
- S3 Access Points
- Block Public Access settings
- Access control lists

## How does S3's flat namespace work?

Standard S3 buckets use a **flat namespace**.

This means that objects are not physically stored inside folders and subfolders. Instead, every object has a unique key.

For example:

    raw/customers/customers.csv
    raw/orders/orders.csv
    processed/orders/orders.parquet

The forward slashes are part of the object keys. The AWS interface displays them like folders to make the data easier to organise.

The section before the file name can be treated as a prefix.

For example:

    raw/customers/

Prefixes can be used to:

- Organise objects
- Filter object listings
- Apply lifecycle policies
- Restrict permissions
- Partition data for analytics

However, these are not real folders. Renaming a folder-like prefix usually requires copying the objects to new keys and deleting the originals.

## What are the main use cases for S3?

### Data lakes

S3 can store raw, cleaned and processed data from many sources. Analytics tools can then process the data directly from S3.

### Backup and disaster recovery

S3 can store backups, database exports and system snapshots. Versioning, replication and archive storage classes can improve resilience.

### Data archiving

Data that is rarely accessed can be moved to lower-cost S3 Glacier storage classes.

### Static website hosting

S3 can host static files such as:

- HTML
- CSS
- JavaScript
- Images

S3 does not directly run server-side code such as Python, PHP or Node.js.

### Application storage

Applications can store uploaded documents, images, videos and other files in S3.

### Media storage and distribution

S3 is commonly used to store images, audio and video. It can be combined with Amazon CloudFront for faster global distribution.

### Log storage

Application logs, server logs and AWS service logs can be stored centrally in S3.

### Machine learning and analytics

S3 can store:

- Training datasets
- Model outputs
- Processed data
- Notebooks
- Model artefacts

## What storage classes are available in S3?

A storage class determines how data is stored, how quickly it can be retrieved and how much it costs.

### S3 Standard

S3 Standard is designed for frequently accessed data.

Common uses include:

- Websites
- Applications
- Frequently queried data
- Media files
- General-purpose storage

It provides low-latency access and stores data across multiple Availability Zones.

### S3 Intelligent-Tiering

S3 Intelligent-Tiering is designed for data with unknown or changing access patterns.

S3 monitors object usage and automatically moves objects between access tiers. This can reduce storage costs without requiring the user to manually predict how often the data will be accessed.

A monitoring charge applies for eligible objects.

### S3 Standard-Infrequent Access

S3 Standard-Infrequent Access, usually called **S3 Standard-IA**, is designed for data that is not accessed often but still needs to be retrieved quickly.

Common uses include:

- Backups
- Disaster recovery data
- Older project files
- Long-lived data

Storage costs are lower than S3 Standard, but retrieval charges and minimum storage duration charges may apply.

### S3 One Zone-Infrequent Access

S3 One Zone-Infrequent Access stores data in one Availability Zone rather than across multiple zones.

It is cheaper than Standard-IA, but it is less resilient.

It is suitable for:

- Re-creatable data
- Secondary backups
- Temporary datasets
- Replicated copies

### S3 Express One Zone

S3 Express One Zone is designed for high-performance workloads requiring very low latency.

It stores data in one Availability Zone and uses directory buckets.

Common uses include:

- Machine learning training
- High-performance analytics
- Frequently accessed small objects
- Performance-sensitive applications

### S3 Glacier Instant Retrieval

This class is designed for archived data that is rarely accessed but must be available immediately when requested.

Common uses include:

- Medical images
- Historical records
- Media archives
- Long-term data requiring fast retrieval

### S3 Glacier Flexible Retrieval

This class is designed for archive data where retrieval can take several minutes or hours.

It is suitable for:

- Backups
- Disaster recovery
- Long-term archives

### S3 Glacier Deep Archive

S3 Glacier Deep Archive is designed for data retained for many years and accessed extremely rarely.

It has very low storage costs, but retrieval can take several hours.

Common uses include:

- Regulatory records
- Financial records
- Legal archives
- Long-term backups

### S3 on Outposts

S3 on Outposts provides object storage on AWS hardware installed at an organisation's own site.

It is used where organisations need:

- Local data processing
- Low latency
- Data residency
- Integration with on-premises systems

## What file formats are most suited to being uploaded to S3?

S3 can store almost any type of file because it treats data as objects.

However, some formats are better suited to particular workloads.

### CSV

CSV is simple, human-readable and widely supported.

It is useful for:

- Small datasets
- Data exchange
- Initial ingestion
- Manual inspection

However, CSV does not preserve data types well and can be inefficient for large analytical workloads.

### JSON

JSON is suitable for semi-structured and nested data.

It is commonly used for:

- API responses
- Application events
- Logs
- NoSQL exports

JSON is flexible but can require more storage and processing than columnar formats.

### Apache Parquet

Parquet is one of the best formats for large-scale analytics.

It is a columnar format, meaning values from the same column are stored together.

Benefits include:

- Efficient compression
- Faster analytical queries
- Preservation of schemas and data types
- Reduced data scanning

Parquet is commonly used in data lakes.

### Apache ORC

ORC is another columnar format designed for analytical processing.

It provides:

- Compression
- Schema support
- Efficient column selection
- Fast analytical queries

### Apache Avro

Avro is a row-based binary format that stores schema information.

It is useful for:

- Streaming data
- Data exchange
- Processing complete records

### Media and document formats

S3 is also suitable for files such as:

- JPEG
- PNG
- MP4
- MP3
- WAV
- PDF
- ZIP

A common data lake structure is to keep original files in a raw area and convert processed analytical data into Parquet or ORC.

## What data lake tooling can be added on top of S3?

S3 provides the storage layer of a data lake. Other AWS services can provide ETL, querying, governance and analytics.

### AWS Glue

AWS Glue is a serverless data integration and ETL service.

It can:

- Discover datasets
- Infer schemas
- Clean and transform data
- Run Apache Spark jobs
- Read data from S3
- Write processed data back to S3
- Convert files into formats such as Parquet

### AWS Glue Data Catalog

The Glue Data Catalog stores metadata about datasets.

It can record:

- Database names
- Table names
- Column names
- Data types
- File formats
- S3 locations
- Partition information

This allows services to interpret files in S3 as structured tables.

### Amazon Athena

Amazon Athena is a serverless SQL query service.

It allows users to query data stored directly in S3 using SQL.

Athena supports formats such as:

- CSV
- JSON
- Parquet
- ORC
- Avro

Users do not need to manage a database server.

### AWS Lake Formation

AWS Lake Formation provides centralised data lake governance.

It can manage access at the following levels:

- Database
- Table
- Column
- Row

Lake Formation works with S3 and the Glue Data Catalog.

### Amazon EMR

Amazon EMR provides managed big-data tools such as Apache Spark and Hadoop.

It can be used for:

- ETL
- Batch processing
- Machine learning
- Distributed analytics

EMR can read data from S3 and write results back to S3.

### Amazon Redshift Spectrum

Redshift Spectrum allows Amazon Redshift to query external data stored in S3.

The data does not need to be fully loaded into Redshift first.

### Amazon SageMaker AI

SageMaker AI can use S3 for:

- Training datasets
- Model artefacts
- Model evaluation
- Batch inference
- Feature engineering

### Amazon QuickSight

QuickSight can create dashboards and visualisations from data queried through services such as Athena and Redshift.

### Amazon Data Firehose

Amazon Data Firehose can deliver streaming data into S3.

It can also convert JSON data into formats such as Parquet or ORC before storing it.

A simple data lake flow could look like this:

    Data sources
        ↓
    Data Firehose, database exports or application uploads
        ↓
    S3 raw zone
        ↓
    AWS Glue ETL
        ↓
    S3 processed zone
        ↓
    Glue Data Catalog
        ↓
    Athena, Redshift, SageMaker or QuickSight

## What features does S3 provide for versioning and replication?

### S3 Versioning

S3 Versioning allows multiple versions of the same object to be stored under one object key.

For example, uploading a new version of:

    reports/monthly-report.csv

does not have to permanently overwrite the previous version.

Each version receives a unique version ID.

Versioning can help with:

- Recovering overwritten files
- Recovering deleted files
- Maintaining a change history
- Auditing
- Data protection

In a versioned bucket, deleting an object usually adds a delete marker rather than immediately deleting every version.

Versioning is disabled by default.

Once enabled, it can be suspended, but the bucket does not return to a completely unversioned state.

Each version is stored as a complete object, so old versions contribute to storage costs.

### S3 Replication

S3 Replication automatically copies objects between buckets.

The main types include:

- Same-Region Replication
- Cross-Region Replication
- Two-way replication
- S3 Batch Replication

Replication can be used for:

- Disaster recovery
- Compliance
- Data sovereignty
- Geographic availability
- Separating production and analytics environments
- Maintaining copies in different AWS accounts

Live replication is asynchronous and usually applies to objects created after the replication rule is enabled.

Batch Replication can be used for existing objects.

Versioning normally needs to be enabled on both the source and destination buckets.

## What do users pay for when using S3?

S3 uses a pay-as-you-go pricing model.

Users mainly pay for the following.

### Storage

Users pay for the amount of data stored.

The cost depends on:

- AWS Region
- Storage class
- Amount of data
- Storage duration

### Requests

Charges may apply to operations such as:

- PUT
- COPY
- POST
- LIST
- GET
- Lifecycle transitions

### Data retrieval

Lower-cost storage classes may charge users when data is retrieved.

This applies particularly to:

- Standard-IA
- One Zone-IA
- Glacier storage classes

### Data transfer

Uploading data from the internet into S3 is generally free.

Charges may apply when data is transferred:

- From S3 to the internet
- Between AWS Regions
- Through certain network services
- To some other AWS locations

### Lifecycle transitions

Charges may apply when lifecycle rules move objects between storage classes.

### Minimum storage durations

Some storage classes have minimum storage periods.

Deleting an object before the minimum period ends may result in an early deletion charge.

### Minimum billable object sizes

Some storage classes apply a minimum billable object size.

This means that very small objects may be charged as though they were larger.

### Management and analytics features

Additional charges may apply for:

- S3 Inventory
- Object tagging
- Storage Class Analysis
- S3 Storage Lens
- Intelligent-Tiering monitoring
- Replication
- Batch Operations

The total cost can be represented as:

    Total S3 cost =
        storage cost
        + request cost
        + retrieval cost
        + data transfer cost
        + management charges
        + possible early deletion charges

The cheapest storage class is not always the cheapest overall. The best choice depends on how often the data is accessed, how quickly it must be retrieved and how long it will be stored.
