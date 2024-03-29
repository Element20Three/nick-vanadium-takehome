terraform {

  backend "remote" {}

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = ">= 0.14"
}

/*
Run the following to start...

terraform init \
-backend-config="bucket=bucketname" \
-backend-config="key=/path/to/key" \
-backend-config="region=us-east-1"

*/
