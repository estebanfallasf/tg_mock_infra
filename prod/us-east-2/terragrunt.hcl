remote_state {
  backend = "s3" 
  generate = {
    path = "backend.tf" 
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "tf-ejf-terraform-state"
    key            = "${path_relative_to_include()}/appserver.tfstate"
    region         = "us-east-2"
encrypt = true
    dynamodb_table = "ejf-terraform-state-table"
  }
}


