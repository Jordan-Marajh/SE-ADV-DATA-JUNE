from pathlib import Path

import boto3
from botocore.exceptions import BotoCoreError, ClientError

# Upload a file by specifying local file path, the bucket you want to upload it to, and the name of the object in that bucket
def upload_file(file_path, bucket_name, object_name):
    s3_client = boto3.client("s3")

    try:
        s3_client.upload_file(
            Filename=str(file_path),
            Bucket=bucket_name,
            Key=object_name
        )

        print(
            f"Uploaded '{file_path.name}' to "
            f"s3://{bucket_name}/{object_name}"
        )

    except (BotoCoreError, ClientError) as error:
        print(f"Could not upload the file: {error}")

# Executes on run to ask for input
def main():
    file_path = Path(
        input("Enter the path of the file to upload: ")
        .strip()
        .strip('"')
    )

    if not file_path.is_file():
        print(f"File not found: {file_path}")
        return

    bucket_name = input(
        "Enter the destination bucket name: "
    ).strip()

    object_name = input(
        f"Enter the S3 object name, or press Enter for '{file_path.name}': "
    ).strip()

    if not object_name:
        object_name = file_path.name

    upload_file(file_path, bucket_name, object_name)


if __name__ == "__main__":
    main()