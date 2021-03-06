resource "aws_dynamodb_table" "terraform_locks" {
	billing_mode	= "PAY_PER_REQUEST"
	hash_key 	= "LockID"
	name 		= "${var.APPLICATION_NAME}-terraform-state-locks"

	attribute {
		name 	= "LockID"
		type 	= "S"
	}
}

resource "aws_s3_bucket" "terraform_state" {
	bucket = "${var.APPLICATION_NAME}-terraform-state"

	versioning {
		enabled = true
	}

	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm = "AES256"
			}
		}
	}
}
