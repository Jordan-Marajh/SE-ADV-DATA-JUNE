from pathlib import Path

import boto3
from botocore.exceptions import BotoCoreError, ClientError

# Upload files by specifying their local file paths and the bucket you want to upload them to
def upload_multiple_files(folder_path, bucket_name, s3_folder=""):
    s3_client = boto3.client("s3")

    files = [
        file_path
        for file_path in folder_path.iterdir()
        if file_path.is_file()
    ]

    if not files:
        print("No files were found in that folder.")
        return

    uploaded_count = 0

    for file_path in files:
        if s3_folder:
            object_name = f"{s3_folder.rstrip('/')}/{file_path.name}"
        else:
            object_name = file_path.name

        try:
            s3_client.upload_file(
                Filename=str(file_path),
                Bucket=bucket_name,
                Key=object_name
            )

            print(f"Uploaded: {file_path.name}")
            uploaded_count += 1

        except (BotoCoreError, ClientError) as error:
            print(f"Could not upload {file_path.name}: {error}")

    print(
        f"\nFinished: uploaded {uploaded_count} "
        f"of {len(files)} files."
    )

# Executes on run to ask for input
def main():
    folder_path = Path(
        input("Enter the path of the folder containing the files: ")
        .strip()
        .strip('"')
    )

    if not folder_path.is_dir():
        print(f"Folder not found: {folder_path}")
        return

    bucket_name = input(
        "Enter the destination bucket name: "
    ).strip()

    s3_folder = input(
        "Enter an S3 folder name, or press Enter for none: "
    ).strip()

    upload_multiple_files(
        folder_path,
        bucket_name,
        s3_folder
    )


if __name__ == "__main__":
    main()