resource "aws_eip" "nat-eip-00" {
    region = var.region
    domain = "vpc"

    tags = {
        Name = "${var.project_name}-NAT-EIP-00"
    }
    depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_eip" "nat-eip-02" {
    region = var.region
    domain = "vpc"

    tags = {
        Name = "${var.project_name}-NAT-EIP-02"
    }
    depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_eip" "nat-eip-04" {
    region = var.region
    domain = "vpc"

    tags = {
        Name = "${var.project_name}-NAT-EIP-04"
    }
    depends_on = [ aws_internet_gateway.igw ]
}
