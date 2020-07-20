resource "aws_codebuild_webhook" "codebuild_pull_request_webhook" {
  project_name = aws_codebuild_project.codebuild_pull_request.name

  filter_group {
    filter {
      type = "EVENT"
      pattern = "PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED, PULL_REQUEST_REOPENED"
    }

    filter {
      type = "HEAD_REF"
      pattern = "^refs/heads/*"
    }
    filter {
      type = "BASE_REF"
      pattern = "^refs/heads/master$"
    }
  }
}
