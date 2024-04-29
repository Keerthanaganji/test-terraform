resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}
module "subnets" {
  source             = "./modules/subnet"
  vpc_id             = aws_vpc.main.id
  count              = 3
  cidr_blocks        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["us-west-1a", "us-west-1b", "us-west-1c"]
}
