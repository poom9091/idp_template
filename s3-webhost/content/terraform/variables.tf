variable "bucket_name" {
  type    = string
  default = "kyozo-flutter-app"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "ger"
}

variable "wait_for_steady_state" {
  type    = bool
  default = false
}

variable "service" {
  type = string
}

variable "application_port" {
  type = number
}

variable "health_check_path" {
  type = string
}

variable "logs_retention_in_days" {
  type = number
}

variable "service_domain_name" {
  type    = string
  default = null
}

variable "region" {
  type    = string
  default = null
}

variable "ecs_cluster_id" {
  type    = string
  default = null
}

variable "ecs_cluster_name" {
  type    = string
  default = null
}

variable "ecs_service" {
  type    = string
  default = null
}

variable "ecr_url" {
  type    = string
  default = null
}

variable "public_subnet_id" {
  default = null
}

variable "public_subnets_id" {
  type    = list(string)
  default = null
}

variable "private_subnet_id" {
  type    = string
  default = null
}

variable "alb_arn" {
  type    = string
  default = null
}

variable "alb_listener_main_arn" {
  type    = string
  default = null
}

variable "alb_listener_test_arn" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}

variable "chatbot_arn" {
  type    = string
  default = null
}

variable "security_group_id" {
  type    = string
  default = null
}
variable "default_security_group_id" {}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

variable "pipeline_compute" {
  type    = string
  default = "BUILD_GENERAL1_SMALL"
}

variable "load_balance_arn" {}
variable "cloudmap_id" {}
variable "app_mesh_id" {}
