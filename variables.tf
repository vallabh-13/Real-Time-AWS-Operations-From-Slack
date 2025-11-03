variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "public_subnet_id" {
  description = "ID of the public subnet to launch EC2 instance"
  type        = string
}

variable "alert_email" {
  description = "Email address to subscribe to SNS alerts"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID for EC2 security group"
  type        = string
}
