# terraform-aws-vpc

## Overview

This Terraform module cretes an AWS VPC with a given CIDR
blocks. It also create multiple subnets (public and private),
and for public subnets, it sets up an Internet Gateway (IGW) 
and appropriate route tables.

## Features

- Creates a VPC with specified CIDR block
- Create public and private subnets
- Create an Internet Gateway (IGW) for public subnets
- sets up route tables for public subnets

## Usage
```
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc_name"
  }
  
  subnet_config = {
    public_subnet_1={
        cidr_block = "10.0.0.0/24"
        az = "us-east-2a"
        #To set the subnet as public, default is private
        public= true
    }

    private_subnet={
        cidr_block = "10.0.1.0/24"
        az = "us-east-2b"
    }
  }
}
```