resource "aws_iam_role" "chatbotrole" {
  name = "chatbotrole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "chatbot.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "AmazonQDeveloperChatbotRole"
  }
}

resource "aws_iam_role_policy" "chatbot_policy" {
  name   = "AmazonQDeveloperPolicy"
  role   = aws_iam_role.chatbotrole.id
  policy = file("${path.module}/policies/chatbot_policy.json")
}

resource "aws_iam_role" "ec2execution" {
  name = "ec2execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "chatbot.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "EC2ExecutionRoleForChatbot"
  }
}

resource "aws_iam_role_policy" "ec2_policy" {
  name   = "EC2StartStopPolicy"
  role   = aws_iam_role.ec2execution.id
  policy = file("${path.module}/policies/ec2_policy.json")
}
