resource "aws_instance" "slackops_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  tags = {
    Name = "SlackOpsInstance"
    Project = "Real-Time-AWS-Operations-From-Slack"
  }

  # Optional: Add security group if needed
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

# Lookup latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Basic security group for public access (SSH only)
resource "aws_security_group" "allow_ssh" {
  name        = "slackops-ec2-sg"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SlackOpsEC2SG"
  }
}
