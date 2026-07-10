import boto3
import pprint as pp

s3_resource = boto3.resource('s3')
s3_client = boto3.client('s3')

# List all buckets
# bucket_list = s3_client.list_buckets()
# for bucket in bucket_list['Buckets']:
#     print(bucket['Name'])

# List all objects in a bucket
# bucket_name = 'se-jordan-test-bucket'
# bucket_contents = s3_client.list_objects_v2(
#     Bucket=bucket_name
# )

# for object in bucket_contents['Contents']:
#     print(object['Key'])

# Get objects contents from s3
# bucket_name = 'data-eng-resources'
# s3_object = s3_client.get_object(
#     Bucket=bucket_name,
#     Key='python/chatbot-intent.json'
# )

# pp.pprint(s3_object, sort_dicts=False)