# Private Route Table
resource "aws_route_table" "pri-routetable-01" {
    region = var.region
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw00.id
    }

    tags = {
        Name = "pri-routetable-01"
    }

    depends_on = [ aws_vpc.vpc,
                    aws_nat_gateway.natgw00 ]
}

resource "aws_route_table_association" "pri-routetable-assoc-01" {
    region = var.region
    subnet_id      = aws_subnet.my-pri-subnet01.id
    route_table_id = aws_route_table.pri-routetable-01.id

    depends_on = [ aws_subnet.my-pri-subnet01 ]
}

resource "aws_route_table" "pri-routetable-03" {
    region = var.region
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw02.id
    }

    tags = {
        Name = "pri-routetable-03"
    }

    depends_on = [ aws_vpc.vpc,
                    aws_nat_gateway.natgw02 ]
}

resource "aws_route_table_association" "pri-routetable-assoc-03" {
    region = var.region
    subnet_id      = aws_subnet.my-pri-subnet03.id
    route_table_id = aws_route_table.pri-routetable-03.id

    depends_on = [ aws_subnet.my-pri-subnet03 ]
}

resource "aws_route_table" "pri-routetable-05" {
    region = var.region
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw04.id
    }

    tags = {
        Name = "pri-routetable-05"
    }

    depends_on = [ aws_vpc.vpc,
                    aws_nat_gateway.natgw04 ]
}

resource "aws_route_table_association" "pri-routetable-assoc-05" {
    region = var.region
    subnet_id      = aws_subnet.my-pri-subnet05.id
    route_table_id = aws_route_table.pri-routetable-05.id

    depends_on = [ aws_subnet.my-pri-subnet05 ]
}