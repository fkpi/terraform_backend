resource "aws_codebuild_source_credential" "codebuild_github_credential" {
  auth_type = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token = var.codebuild_github_token
}