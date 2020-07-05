
# Manage terraform remote state on AWS

## Overview

1. Create secret .env file; see `example.env`
1. Run `docker-compose build`
1. Run `docker-cmpose run create sh` to interact with the docker container
1. Inside the docker container, run `terraform init && terraform apply`: this will generate an output.
1. Review the output and type `yes` to create the remote state
1. Once terraform is finished, you should see your S3 bucket created in AWS
1. If you do not want to keep this S3 bucket, run `terraform destroy` to delete everything

## Access your remote state in your projects

    ```javascript
    // main.tf
    terraform {
      backend "s3" {
        // https://www.terraform.io/docs/backends/types/s3.html#configuration-variables
        // access_key = ENVIRONMENT AWS_ACCESS_KEY_ID
        // profile = ENVIRONMENT AWS_PROFILE
        // region = ENVIRONMENT AWS_DEFAULT_REGION
        // secret_key = ENVIRONMENT AWS_SECRET_ACCESS_KEY

        bucket = "my-application-name-terraform-state"
        dynamodb_table = "my-application-name-terraform-state-locks"
        encrypt = true
        key = "terraform.tfstate"
      }
    }
    ```
