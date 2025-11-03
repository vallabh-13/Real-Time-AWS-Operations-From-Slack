variable "chatbot_role_arn" {
  description = "IAM role ARN for Amazon Q Developer backend"
  type        = string
}

variable "ec2_execution_role_arn" {
  description = "IAM role ARN for EC2 control"
  type        = string
}
