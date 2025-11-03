resource "aws_sns_topic" "ec2_alert_topic" {
  name = "ec2-alert-topic"
}

# Email subscription
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.ec2_alert_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}

