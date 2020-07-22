resource "aws_codepipeline" "codepipeline_master" {
  name = var.codepipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn
  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type = "S3"
  }
  stage {
    name = "Source"
    action {
      category = "Source"
      name = "Source"
      owner = "ThirdParty"
      provider = "GitHub"
      version = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner = var.github_owner
        Repo = var.github_repo
        Branch = var.github_branch
        OAuthToken = var.github_token
        PollForSourceChanges = "false"
      }
    }
  }

  stage {
    name = "Build"
    action {
      category = "Build"
      name = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      input_artifacts = ["source_output"]
      version = "1"
      region = var.region

      configuration = {
        ProjectName = aws_codebuild_project.codebuild_codepipeline.name
      }
    }
  }
}