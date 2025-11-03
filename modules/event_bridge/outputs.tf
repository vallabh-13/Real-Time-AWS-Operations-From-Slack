output "rule_name" {
  description = "Name of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.ec2_stopped_rule.name
}
