import boto3
from botocore.exceptions import ClientError

# Delete a bucket by giving its name
def delete_bucket(bucket_name):
    s3_client = boto3.client("s3")

    try:
        s3_client.delete_bucket(Bucket=bucket_name)
        print(f"Deleted bucket: {bucket_name}")

    except ClientError as error:
        print(f"Could not delete bucket: {error.response['Error']['Message']}")

# Executes on run to ask for input
def main():
    bucket_name = input(
        "Enter the name of the bucket to delete: "
    ).strip()

    confirmation = input(
        f"Type '{bucket_name}' again to confirm deletion: "
    ).strip()

    if confirmation != bucket_name:
        print("Bucket deletion cancelled.")
        return

    delete_bucket(bucket_name)


if __name__ == "__main__":
    main()