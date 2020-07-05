provider "aws" {
	access_key = var.AWS_ACCESS_KEY_ID
	region = var.AWS_REGION
	secret_key = var.AWS_SECRET_ACCESS_KEY
	version = "~> 2.69"
}
