#provider variables
variable "region" {
  type = string
  description = "Region in which the infrastructure will be build"
}


#codebuild variables
variable "codebuild_project_name" {
  type = string
  description = "CodeBuild Project name"
}

variable "codebuild_github_location" {
  type = string
  description = "URL of source GitHub repository (the address should end with .git)"
}

variable "codebuild_github_token" {
  type = string
  description = "Personal Access Token for GitHub Account"
}

variable "buildspec_filename_path" {
  type = string
  description = <<EOF
  path to buildspec file, which CodeBuild will use to build the project.
  If the file is in root folder of the repository, only filename needs to be provided.
  If it's in any other folder, full path needs to be provided
EOF
}

