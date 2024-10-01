import boto3
import pytest
import unittest
import sys
from moto import mock_s3
from unittest.mock import patch

def list_s3_files(bucket_name):
    """Lists files in an S3 bucket."""
    try:

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

    except:
        print("An exception occurred")


def list_ecs_task(family):
    """List the revisions of a given ECS task definition family."""
    try:
        ecs_client = boto3.client('ecs')

        response = ecs_client.list_task_definitions(
            familyPrefix=family
        )

        revisions = []
        for arn in response['taskDefinitionArns']:
            revision = int(arn.split(':')[-1])
            revisions.append(revision)

        return revisions
    
    except:
            print("An exception occurred")

if __name__ == '__main__':
    unittest2.main()
    family = sys.argv[1]
    bucket_name = sys.argv[2]




class TestListEcsTaskDefinitionRevisions(unittest.TestCase):

    @patch('boto3.client')
    def test_list_ecs_task_definition_revisions(self, mock_client):
        # Create a mock ECS client
        mock_ecs = mock_client.return_value

        # Set up mock response data
        mock_response = {
            'taskDefinitionArns': [
                'arn:aws:ecs:us-east-1:123456789012:task-definition/my-task-family:1',
                'arn:aws:ecs:us-east-1:123456789012:task-definition/my-task-family:2',
                'arn:aws:ecs:us-east-1:123456789012:task-definition/my-task-family:3'
            ]
        }
        mock_ecs.list_task_definitions.return_value = mock_response

        # Call the function to list revisions
        revisions = list_ecs_task_definition_revisions('my-task-family')

        # Assert that the function returns the expected revisions
        self.assertEqual(revisions, [1, 2, 3])



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


