
data "aws_availability_zones" "available" {
    state = "available"
}

# PUB SUB
resource "aws_subnet" "my-pub-subnet00" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.Pubsub00
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[0]
    tags = {
        Name = "my-pub-subnet00"
    }
}

resource "aws_subnet" "my-pub-subnet02" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.Pubsub02
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        Name = "my-pub-subnet02"
    }
}

resource "aws_subnet" "my-pub-subnet04" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.Pubsub04
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[2]
    tags = {
        Name = "my-pub-subnet04"
    }
}

# PRI SUB
resource "aws_subnet" "my-pri-subnet01" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.Prisub01
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available.names[0]
    tags = {
        Name = "my-pri-subnet01"
    }
}

resource "aws_subnet" "my-pri-subnet03" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.Prisub03
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        Name = "my-pri-subnet03"
    }
}

resource "aws_subnet" "my-pri-subnet05" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.Prisub05
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available.names[2]
    tags = {
        Name = "my-pri-subnet05"
    }
}
