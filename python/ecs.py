import boto3
import unittest
from unittest.mock import patch

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

def list_ecs_task_definition_revisions(family):
    """List the revisions of a given ECS task definition family."""
    ecs_client = boto3.client('ecs')

    response = ecs_client.list_task_definitions(
        familyPrefix=family
    )

    revisions = []
    for arn in response['taskDefinitionArns']:
        revision = int(arn.split(':')[-1])
        revisions.append(revision)

    return revisions

if __name__ == '__main__':
    unittest.main()