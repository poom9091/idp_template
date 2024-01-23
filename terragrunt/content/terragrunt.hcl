remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${{ values.env }}-${{ values.project_name }}-terraform-state"
    key            = "${{ values.env }}-state/${path_relative_to_include()}-state.tfsate"
    dynamodb_table = "dynamo-db-terraform-state-lock"
    region         = "${{ values.aws_region }}"
  }
}

generate "provider"{
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "${{ values.aws_region }}"
  default_tags {
    tags = {
      Environment   = "${{ values.env }}"
      Owner         = "terraform"
      Project       = "${{ values.project_name }}"
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
  project_name = "${{ values.project_name }}" 
  environment  = "${{ values.env }}" 
  region       = "${{ values.aws_region }}" 
}
