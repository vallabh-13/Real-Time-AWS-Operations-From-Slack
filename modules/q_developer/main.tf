# This module doesn't create resources directly.
# It passes IAM role ARNs to be used when configuring the Amazon Q Developer channel manually.

locals {
  chatbot_role_arn       = var.chatbot_role_arn
  ec2_execution_role_arn = var.ec2_execution_role_arn
}
