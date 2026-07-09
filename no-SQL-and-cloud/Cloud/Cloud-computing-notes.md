# Cloud Computing Research Notes

## What is Cloud Computing?

Cloud computing is a way of accessing computing resources over the internet instead of owning and maintaining all of the physical hardware yourself. These resources can include servers, storage, databases, networking, software, analytics tools and application platforms.

A standard definition comes from NIST, which describes cloud computing as on-demand network access to a shared pool of configurable computing resources that can be quickly provided and released with minimal management effort. NIST also describes cloud computing using five essential characteristics, three service models and four deployment models.

In simple terms, cloud computing means renting computing power from a provider such as AWS, Microsoft Azure or Google Cloud instead of buying and managing physical servers yourself.

![Diagram showing cloud computing resources such as servers, storage, databases and users connecting over the internet](images/cloud-computing-overview.png)

---

## Advantages of Cloud Computing

Cloud computing has several major advantages.

### Lower upfront cost

Organisations do not need to buy expensive physical servers before starting a project. Instead, they can rent resources and pay for what they use.

### Scalability

Cloud resources can be increased or decreased depending on demand. This is useful for websites, applications and databases where traffic may change over time.

### Flexibility

Developers can create servers, databases, storage buckets and networking resources quickly. This makes experimentation and deployment much faster.

### Broad network access

Cloud services can be accessed over the internet from different devices and locations, provided the correct permissions and security rules are in place.

### Managed infrastructure

The cloud provider handles much of the physical infrastructure, including data centres, hardware, networking and power. This allows users to focus more on building and running applications.

### Measured usage

Cloud platforms usually monitor usage and charge based on consumption. This means organisations can track how much resource they are using.

![Diagram showing benefits of cloud computing such as scalability, flexibility, lower upfront cost and remote access](images/cloud-computing-advantages.png)

---

## The Four Main Cloud Deployment Models

The four main cloud deployment models are:

1. Public cloud
2. Private cloud
3. Community cloud
4. Hybrid cloud

### 1. Public Cloud

A public cloud is cloud infrastructure made available for general public use. It is usually owned and operated by a cloud provider such as AWS, Microsoft Azure or Google Cloud.

Examples include:

- Hosting a website on AWS EC2
- Using Google Cloud Storage
- Running a database on Microsoft Azure

### 2. Private Cloud

A private cloud is cloud infrastructure used exclusively by one organisation. It may be managed by the organisation itself or by a third party, and it may be hosted on-premises or externally.

Example:

- A bank running its own internal cloud infrastructure for security and compliance reasons.

### 3. Community Cloud

A community cloud is shared by several organisations with similar requirements, such as security, compliance or policy concerns.

Example:

- Several healthcare organisations sharing cloud infrastructure designed around medical data regulations.

### 4. Hybrid Cloud

A hybrid cloud combines two or more separate cloud infrastructures, such as private and public clouds, while allowing data and applications to move between them.

Example:

- A company keeping sensitive data in a private cloud while using AWS or Azure for public-facing applications.

![Diagram comparing public, private, community and hybrid cloud deployment models](images/cloud-deployment-models.png)

---

## The Three Main Cloud Service Types

The three main cloud service models are:

1. IaaS: Infrastructure as a Service
2. PaaS: Platform as a Service
3. SaaS: Software as a Service

### 1. IaaS: Infrastructure as a Service

Infrastructure as a Service gives users access to fundamental computing resources such as virtual machines, storage and networking.

The user usually manages:

- The operating system
- Applications
- Runtime
- Some security configuration

The provider usually manages:

- Physical servers
- Data centres
- Hardware
- Core networking

Example:

- An AWS EC2 instance running Ubuntu and MongoDB.

### 2. PaaS: Platform as a Service

Platform as a Service gives developers a platform to build, deploy and run applications without managing the underlying infrastructure.

The user usually manages:

- Application code
- Application data
- Some configuration

The provider usually manages:

- Servers
- Operating system
- Runtime
- Scaling infrastructure

Examples include:

- Google App Engine
- Azure App Service
- Heroku

### 3. SaaS: Software as a Service

Software as a Service provides complete software applications over the internet. The user simply accesses the software, usually through a browser.

The user usually manages:

- Their own account
- Data entered into the application
- Some settings

The provider usually manages:

- The application
- Servers
- Storage
- Security updates
- Infrastructure

Examples include:

- Gmail
- Microsoft 365
- Dropbox
- Salesforce

![Cloud service model showing IaaS on the left, PaaS in the middle and SaaS on the right](images/cloud-service-models.png)

---

## Current Cloud Computing Market Share in 2026

As of Q1 2026, the cloud infrastructure services market was still dominated by the “big three” cloud providers: Amazon Web Services, Microsoft Azure and Google Cloud.

According to Synergy Research Group data, Q1 2026 enterprise spending on cloud infrastructure services reached approximately **$129 billion**. The reported worldwide market shares were approximately:

| Provider | Approximate Q1 2026 Market Share |
|---|---:|
| Amazon Web Services | 28% |
| Microsoft Azure | 21% |
| Google Cloud | 14% |

Together, these three providers account for a very large share of the global cloud infrastructure market.

![Bar chart showing Q1 2026 cloud market share: AWS 28%, Azure 21%, Google Cloud 14%](images/cloud-market-share-2026.png)

---

## What Are the “Big Three” Cloud Providers Known For?

### Amazon Web Services: AWS

AWS is known for being the market leader in cloud infrastructure and for having a very broad range of services. AWS offers services for compute, storage, databases, analytics, networking, developer tools, security, IoT and enterprise applications.

AWS is especially associated with:

- EC2 for virtual servers
- S3 for object storage
- RDS and DynamoDB for databases
- Lambda for serverless computing
- Large global infrastructure

In this task, I used AWS EC2 as an Infrastructure as a Service platform to host a MongoDB database server.

### Microsoft Azure

Microsoft Azure is known for strong integration with Microsoft’s wider enterprise ecosystem. This includes Microsoft 365, Microsoft Entra ID, Active Directory integration, Windows Server, SQL Server and enterprise identity management.

Azure is especially associated with:

- Enterprise cloud adoption
- Microsoft 365 integration
- Windows and SQL Server workloads
- Microsoft Entra ID
- Hybrid cloud through Azure Arc

### Google Cloud

Google Cloud is known for data analytics, AI, machine learning and container technologies.

Google Cloud is especially associated with:

- BigQuery for data analytics
- Vertex AI and machine learning tools
- Google Kubernetes Engine
- Data engineering and large-scale analytics
- Strong developer and AI tooling

---

## Sources

- NIST, The NIST Definition of Cloud Computing: https://csrc.nist.gov/pubs/sp/800/145/final
- Synergy Research Group, Q1 2026 cloud infrastructure market reporting: https://www.srgresearch.com/articles/cloud-market-annual-revenue-run-rate-topped-half-a-trillion-dollars-in-q1-as-growth-surge-continues
- Data Center Dynamics summary of Synergy Research Q1 2026 cloud market share: https://www.datacenterdynamics.com/en/news/synergy-research-cloud-spending-hits-129bn-in-q1-2026-ninth-consecutive-quarter-of-growth/
- AWS overview documentation: https://docs.aws.amazon.com/whitepapers/latest/aws-overview/introduction.html
- Microsoft Azure documentation: https://learn.microsoft.com/en-us/azure/
- Google Cloud documentation: https://cloud.google.com/docs/