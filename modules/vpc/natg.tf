resource "aws_nat_gateway" "natgw00" {
  allocation_id = aws_eip.nat-eip-00.id
  subnet_id     = aws_subnet.my-pub-subnet00.id
  connectivity_type = "public"
  region = var.region

  tags = {
    Name = "${var.project_name}-NATGW00"
  }

  depends_on = [aws_internet_gateway.igw,
                 aws_eip.nat-eip-00]
}

resource "aws_nat_gateway" "natgw02" {
  allocation_id = aws_eip.nat-eip-02.id
  subnet_id     = aws_subnet.my-pub-subnet02.id
  connectivity_type = "public"
  region = var.region

  tags = {
    Name = "${var.project_name}-NATGW02"
  }

  depends_on = [aws_internet_gateway.igw,
                 aws_eip.nat-eip-02]
}

resource "aws_nat_gateway" "natgw04" {
  allocation_id = aws_eip.nat-eip-04.id
  subnet_id     = aws_subnet.my-pub-subnet04.id
  connectivity_type = "public"
  region = var.region

  tags = {
    Name = "${var.project_name}-NATGW04"
  }

  depends_on = [aws_internet_gateway.igw,
                 aws_eip.nat-eip-04]
}