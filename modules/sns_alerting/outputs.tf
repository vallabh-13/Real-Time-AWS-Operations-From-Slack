output "topic_arn" {
  description = "ARN of the SNS topic for EC2 alerts"
  value       = aws_sns_topic.ec2_alert_topic.arn
}
