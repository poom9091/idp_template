remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "prod-kyozo-terraform-state"
    key            = "prod-state/${path_relative_to_include()}-state.tfsate"
    dynamodb_table = "dynamo-db-terraform-state-lock"
    region         = "ap-northeast-1"
  }
}

generate "provider"{
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      Environment   = "prod"
      Owner         = "terraform"
      Project       = "kyozo"
      Orgranization = "mohara"
      Automate      = "true"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


data "aws_caller_identity" "current" {}
EOF
}

inputs = {
  project_name = "kyozo" 
  environment  = "prod" 
  region       = "ap-northeast-1" 
}
