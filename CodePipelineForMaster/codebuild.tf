resource "aws_codebuild_project" "codebuild_codepipeline" {
  name = var.codebuild_master_project_name
  service_role = aws_iam_role.codebuild_master_role.arn
  artifacts {
    type = "CODEPIPELINE"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:4.0"
    type = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

  }
  source {
    type = "CODEPIPELINE"
    buildspec = "buildspec-master.yaml"
  }
}