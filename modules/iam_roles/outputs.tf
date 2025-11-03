output "chatbot_role_arn" {
  description = "ARN of the IAM role for Amazon Q Developer"
  value       = aws_iam_role.chatbotrole.arn
}

output "ec2_execution_role_arn" {
  description = "ARN of the IAM role for EC2 control"
  value       = aws_iam_role.ec2execution.arn
}
