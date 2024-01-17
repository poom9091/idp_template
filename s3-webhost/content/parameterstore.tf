resource "aws_ssm_parameter" "cloudfront_id" {
  name  = "CLOUDFRONT_ID"
  type  = "SecureString"
  value = module.s3_webhost.cloudfront_id
}

resource "aws_ssm_parameter" "s3_bucket" {
  name  = "WEB_BUCKET"
  type  = "SecureString"
  value = "s3://${var.bucket_name}"
}
