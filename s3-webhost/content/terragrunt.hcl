include "root" {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
}


terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply", "destroy", "import"] 
  }
}

locals { # Automatically load environment-level variables
  environment        = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).inputs.environment 
  service_config = yamldecode(templatefile("${get_terragrunt_dir()}/../../config/prod/flutter-app/config.yaml", {}))
}

inputs = {  
  # Web host
  bucket_name = local.service_config.bucket_name
}
