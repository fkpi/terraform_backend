resource "aws_codepipeline_webhook" "codepipeline_webhook" {
  authentication = "GITHUB_HMAC"
  name = "codepipeline-webhook-master"
  target_action = "Source"
  target_pipeline = aws_codepipeline.codepipeline_master.name

  authentication_configuration {
    secret_token = "secret"
  }

  filter {
    json_path = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
}

resource "github_repository_webhook" "github_webhook" {
  events = ["push"]
  repository = var.github_repo

  configuration {
    url = aws_codepipeline_webhook.codepipeline_webhook.url
    content_type = "json"
    secret = "secret"
    
  }
}