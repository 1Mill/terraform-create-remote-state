provider "aws" {
	profile			= var.aws_profile
	region 			= var.aws_region
	shared_credentials_file	= "/root/.aws"
	version 		= "~> 2.57"
}
