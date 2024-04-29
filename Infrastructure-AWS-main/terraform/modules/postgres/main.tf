resource "aws_vpc" "main"{

  name                 = "demovpc"
  cidr                 = "10.0.0.0/16"
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

