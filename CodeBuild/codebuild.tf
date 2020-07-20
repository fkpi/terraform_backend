resource "aws_codebuild_project" "codebuild_pull_request" {
  name = var.codebuild_project_name
  service_role = aws_iam_role.codebuild_pr_role.arn
  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:4.0"
    type = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

  }
  source {
    type = "GITHUB"
    location = var.codebuild_github_location
    git_clone_depth = 1

    auth {
      type = "OAUTH"
      resource = aws_codebuild_source_credential.codebuild_github_credential.arn
    }


    git_submodules_config {
      fetch_submodules = true
    }

    report_build_status = true
  }

  tags = {
    Environment = "test"
  }


}
