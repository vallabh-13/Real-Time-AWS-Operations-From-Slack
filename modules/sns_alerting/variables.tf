variable "email_address" {
  description = "Email address to receive EC2 alerts"
  type        = string
}

variable "chatbot_role_arn" {
  description = "ARN of the chatbot IAM role (used for placeholder subscription)"
  type        = string
}
