# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-IGW"
  }

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}