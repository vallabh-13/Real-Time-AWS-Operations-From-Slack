terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Include IAM roles
module "iam_roles" {
  source = "./modules/iam_roles"
}

# Include EC2 instance
module "ec2_instance" {
  source    = "./modules/ec2_instance"
  subnet_id = var.public_subnet_id
  vpc_id    = var.vpc_id
}


# Include SNS topic and subscriptions
module "sns_alerting" {
  source = "./modules/sns_alerting"
  email_address = var.alert_email
  chatbot_role_arn = module.iam_roles.chatbot_role_arn
}

# Include EventBridge rule for EC2 stopped state
module "event_bridge" {
  source = "./modules/event_bridge"
  sns_topic_arn = module.sns_alerting.topic_arn
}

# Include Amazon Q Developer channel config (placeholder for future automation)
module "q_developer" {
  source = "./modules/q_developer"
  chatbot_role_arn = module.iam_roles.chatbot_role_arn
  ec2_execution_role_arn = module.iam_roles.ec2_execution_role_arn
}
