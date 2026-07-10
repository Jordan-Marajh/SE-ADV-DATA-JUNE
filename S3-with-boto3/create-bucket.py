import boto3
from botocore.exceptions import ClientError

# Create a bucket with a given name
def create_bucket(bucket_name):
    region = "eu-central-1" # fixed region for use on the course

    s3_client = boto3.client("s3",region_name=region)

    try: # try to create a bucket with given bucket name and fixed region
        s3_client.create_bucket(
            Bucket=bucket_name,
            CreateBucketConfiguration={
                "LocationConstraint": region
            }
        )

        print(f"Created bucket: {bucket_name}")

    except ClientError as error: # if it fails, tell me why
        print(f"Could not create bucket: {error}")


# Executes on run to ask for input
def main():
    bucket_name = input(
        "Enter the bucket name (using the se-yourname- convention): "
    ).strip()

    create_bucket(bucket_name)


if __name__ == "__main__":
    main()