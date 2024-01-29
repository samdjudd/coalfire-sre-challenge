terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source   = "./modules/vpc"
  region   = "us-west-1"
  vpc_cidr = "10.1.0.0/16"
}

module "subnets" {
  source               = "./modules/subnets"
  vpc_id               = module.vpc.vpc_id
  availability_zones   = ["us-west-1a", "us-west-1c"]
}

module "ec2" {
  source            = "./modules/ec2"
  public_subnet_ids = module.subnets.public_subnet_ids
  wp_subnet_ids     = module.subnets.wp_subnet_ids
}

module "alb" {
  source = "./modules/alb"
}