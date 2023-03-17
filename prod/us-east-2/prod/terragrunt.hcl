include "root" {
  path = find_in_parent_folders()
}

locals {
  instance_name = "PRODUCTION"
}

# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=4.3.0"
}

# Indicate what region to deploy the resources into
#generate "provider" {
#  path = "provider.tf"
#  if_exists = "overwrite_terragrunt"
#  contents = <<EOF
#provider "aws" {
#  region = "us-east-2"
#}
#EOF
#}

# Indicate the input values to use for the variables of the module.
inputs = {
  ami           = "ami-02238ac43d6385ab3"
  instance_type = "t2.micro"

  tags = {
    Name = local.instance_name
  }
}

