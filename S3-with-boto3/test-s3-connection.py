import boto3

s3_resource = boto3.resource('s3')
s3_client = boto3.client('s3')

# Print out bucket names
for bucket in s3_resource.buckets.all():
    print(bucket.name)