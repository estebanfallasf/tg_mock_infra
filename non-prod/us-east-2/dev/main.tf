# comment
terraform {
  backend "s3" {
    bucket         = "tf-ejf-terraform-state"
    key            = "tg_mock_infra/dev/appserver.tfstate"
    region         = "us-east-2"
    dynamodb_table = "ejf-terraform-state-table"
  }

  #  cloud {
  #    organization = "ejforg"
  #    workspaces {
  #      name = "learn-tfc-aws"
  #    }
  #  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "test_server" {
  ami           = "ami-02238ac43d6385ab3"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

