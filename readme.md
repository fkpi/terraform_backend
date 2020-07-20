This module creates a basic CodeBuild project, which triggers a build every time a Pull Request is opened, modified or reopened on target GitHub repository.

State of this infrastructure is stored in S3 bucket, with locking via DynamoDB.
Backend variables 