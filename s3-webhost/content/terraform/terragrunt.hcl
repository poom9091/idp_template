include "root" {
  path = find_in_parent_folders()
}

terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply", "destroy", "import"] 
  }
}

locals { 
  environment    = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).inputs.environment 
  service_config = yamldecode(templatefile("${get_terragrunt_dir()}/../../config/prod/flutter-app/config.yaml", {}))
}

inputs = {  
  bucket_name = local.service_config.bucket_name
}
