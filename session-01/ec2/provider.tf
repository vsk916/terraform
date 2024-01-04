terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"  #This is aws provider version, not terraform
    }
  }
}

provider "aws" {

    
  region = "us-east-1"
  
}