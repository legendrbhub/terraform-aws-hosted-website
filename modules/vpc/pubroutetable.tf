# Public Route Table
resource "aws_route_table" "pub-routetable-00" {
    region = var.region
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "pub-routetable-00"
    }

    depends_on = [ aws_vpc.vpc,
                    aws_internet_gateway.igw ]
}

resource "aws_route_table_association" "pub-routetable-assoc-00" {
    region = var.region
    subnet_id      = aws_subnet.my-pub-subnet00.id
    route_table_id = aws_route_table.pub-routetable-00.id

    depends_on = [ aws_subnet.my-pub-subnet00 ]
}

resource "aws_route_table_association" "pub-routetable-assoc-02" {
    region = var.region
    subnet_id      = aws_subnet.my-pub-subnet02.id
    route_table_id = aws_route_table.pub-routetable-00.id
    depends_on = [ aws_subnet.my-pub-subnet02 ]
}

resource "aws_route_table_association" "pub-routetable-assoc-04" {
    region = var.region
    subnet_id      = aws_subnet.my-pub-subnet04.id
    route_table_id = aws_route_table.pub-routetable-00.id
    depends_on = [ aws_subnet.my-pub-subnet04 ]
}