import boto3
import pytest
from moto import mock_s3

def list_s3_files(bucket_name, prefix=None):
    """Lists files in an S3 bucket."""

    s3 = boto3.client('s3')
    paginator = s3.get_paginator('list_objects_v2')

    kwargs = {'Bucket': bucket_name}
    if prefix:
        kwargs['Prefix'] = prefix

    page_iterator = paginator.paginate(**kwargs)

    files = []
    for page in page_iterator:
        if 'Contents' in page:
            for obj in page['Contents']:
                files.append(obj['Key'])

    return files

@mock_s3
def test_list_s3_files():
    """Tests the list_s3_files function."""

    # Create a mock S3 bucket
    s3 = boto3.client('s3')
    s3.create_bucket(Bucket='test-bucket')

    # Upload some test files
    s3.put_object(Bucket='test-bucket', Key='file1.txt', Body='test file 1')
    s3.put_object(Bucket='test-bucket', Key='folder1/file2.txt', Body='test file 2')

    # Test listing all files
    files = list_s3_files('test-bucket')
    assert files == ['file1.txt', 'folder1/file2.txt']

    # Test listing files with a prefix
    files = list_s3_files('test-bucket', prefix='folder1/')
    assert files == ['folder1/file2.txt']