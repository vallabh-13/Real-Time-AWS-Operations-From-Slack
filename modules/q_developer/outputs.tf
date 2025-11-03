output "chatbot_role_arn" {
  description = "IAM role ARN for Amazon Q Developer backend"
  value       = var.chatbot_role_arn
}

output "ec2_execution_role_arn" {
  description = "IAM role ARN for EC2 control"
  value       = var.ec2_execution_role_arn
}
