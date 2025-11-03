output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instance.instance_id
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns_alerting.topic_arn
}

output "eventbridge_rule_name" {
  description = "Name of the EventBridge rule"
  value       = module.event_bridge.rule_name
}

output "chatbot_role_arn" {
  description = "ARN of the IAM role for Amazon Q Developer"
  value       = module.iam_roles.chatbot_role_arn
}

output "ec2_execution_role_arn" {
  description = "ARN of the IAM role for EC2 control"
  value       = module.iam_roles.ec2_execution_role_arn
}
