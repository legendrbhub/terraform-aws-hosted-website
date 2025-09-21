resource "aws_vpc" "vpc" {

    region  = var.region
    cidr_block  = var.cidr
    instance_tenancy = "default"
    enable_dns_hostnames    = true
    enable_dns_support =  true

    tags = {
        Name = "${var.project_name}-VPC"
    }
}
