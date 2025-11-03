resource "aws_cloudwatch_event_rule" "ec2_stopped_rule" {
  name        = "ec2-instance-stopped"
  description = "Triggers when EC2 instance changes state to stopped"
  event_pattern = jsonencode({
    source = ["aws.ec2"],
    "detail-type" = ["EC2 Instance State-change Notification"],
    detail = {
      state = ["stopped"]
    }
  })
}

resource "aws_cloudwatch_event_target" "sns_target" {
  rule      = aws_cloudwatch_event_rule.ec2_stopped_rule.name
  arn       = var.sns_topic_arn
  target_id = "SendToSNS"
}

# Allow EventBridge to publish to SNS
resource "aws_iam_role" "eventbridge_invoke_sns" {
  name = "eventbridge-invoke-sns"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "events.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "sns_publish_policy" {
  name = "AllowSNSPublish"
  role = aws_iam_role.eventbridge_invoke_sns.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["sns:Publish"],
        Resource = var.sns_topic_arn
      }
    ]
  })
}

# Attach role to EventBridge target
resource "aws_cloudwatch_event_target" "sns_target_with_role" {
  rule      = aws_cloudwatch_event_rule.ec2_stopped_rule.name
  arn       = var.sns_topic_arn
  role_arn  = aws_iam_role.eventbridge_invoke_sns.arn
  target_id = "SendToSNSWithRole"
}
