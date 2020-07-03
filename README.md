
# Manage terraform remote state on AWS

## Overview

1. Create .env with `HOST_AWS_CREDENTIALS_PATH`; see `example.env`
2. Run `docker-compose build`
3. Run `docker-compose run store sh`
4. Inside the container, run `terraform init`
5. Run `terraform apply` and answer the prompts
6. Review the output and type `yes` to create the remote state
7. Your S3 bucket should be created
8. Before existing the container, run `terraform destroy` to delete everything
    * If you leave the container, the local terraform state is lost

## Access your remote state in your projects

    ```javascript
    // main.tf
    terraform {
      backend "s3" {
        bucket                  = "my-unique-project-name-terraform-state"
        dynamodb_table          = "my-unique-project-name-terraform-state-locks"
        profile                 = "my-aws-profile"
        region                  = "my-aws-region"

        encrypt                 = true
        key                     = "terraform.tfstate"
        shared_credentials_file = "/root/.aws"
      }
    }
    ```
