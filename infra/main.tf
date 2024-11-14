provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-ads"           # Nome do bucket S3
    key            = "techshop/prod/terraform.tfstate" # Caminho no bucket (ambiente/projeto)
    region         = "us-east-1"                    # Região AWS
    encrypt        = true                           # Ativar criptografia
  }
}

resource "tls_private_key" "deployer_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.deployer_key.public_key_openssh
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"

  ingress {
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
}

# EC2 instance configuration
resource "aws_instance" "techshop_instance" {
  ami                    = "ami-0866a3c8686eaeeba" # AMI Ubuntu
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  security_groups        = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "TechShop-Instance"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.deployer_key.private_key_pem}' > private_key.pem && chmod 400 private_key.pem"
  }
}



