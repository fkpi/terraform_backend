module "CodeBuildForPullRequests" {
  source                    = "./CodeBuild"
  buildspec_filename_path   = "buildspec-test.yaml"
  codebuild_github_location = "https://github.com/fkpi/terraform_training.git"
  codebuild_github_token    = "b74f720da271d8f3b85dab230f44adcddcbc2554"
  codebuild_project_name    = "fkpi-tf-codebuild"
  region                    = "eu-central-1"
}

module "CodePipelineForMaster" {
  source                        = "./CodePipelineForMaster"
  codebuild_master_project_name = "fkpi-build-master-terraform"
  buildspec_name                = "buildspec-master.yaml"
  codepipeline_name             = "fkpi-build-master-terraform"
  codepipeline_role_name        = "fkpi-build-master-terraform-role"
  codepipeline_s3_name          = "fkpi-codepipeline-terraform"
  github_branch                 = "master"
  github_owner                  = "fkpi"
  github_repo                   = "terraform_training"
  github_token                  = "b74f720da271d8f3b85dab230f44adcddcbc2554"
  github_webhook_secret         = "61JXvQZ11Cr9ClPaMuUd"
  region                        = "eu-central-1"
}

