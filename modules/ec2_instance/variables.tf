variable "subnet_id" {
  description = "Public subnet ID to launch EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}
