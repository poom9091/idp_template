output "bucket_id" {
  value = module.s3_webhost.bucket_id
}

output "cloudfront_domain" {
  value = module.s3_webhost.cloudfront_domain
}

output "ecr_repository_url" {
  value = module.ecr.url
}
