provider "aws" {
 region = var.region
}

resource "aws_vpc_endpoint" "privateendpoint" {
 vpc_id = var.vpc_id
 service_name = var.service_name_endpoint
 vpc_endpoint_type = "Interface"
 subnet_ids = var.subnet_ids_endpoint
 security_group_ids = var.security_group_ids_endpoints
}

