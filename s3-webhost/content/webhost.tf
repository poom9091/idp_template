module "s3_webhost" {
  source      = "git@github.com:poom9091/terraform_s3_webhost_module.git"
  bucket_name = var.bucket_name
  environment = var.environment
}
