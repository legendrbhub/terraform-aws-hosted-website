# ALB Security Group
resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_alb_rule_ipv4" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  depends_on = [ aws_security_group.alb-sg ]
}

resource "aws_vpc_security_group_egress_rule" "allow_alb_rule_ipv4" {
    security_group_id = aws_security_group.alb-sg.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 0
    ip_protocol       = "-1"
    to_port           = 0

    depends_on = [ aws_security_group.alb-sg ]
}

# WEB Security Group
resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "web-sg"
  }

  depends_on = [ aws_security_group.alb-sg, aws_vpc_security_group_ingress_rule.allow_alb_rule_ipv4 ]
}

resource "aws_vpc_security_group_ingress_rule" "allow_web_rule_ipv4" {
    security_group_id = aws_security_group.web-sg.id
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    referenced_security_group_id = aws_security_group.alb-sg.id

    depends_on = [ aws_security_group.web-sg ]
}

resource "aws_vpc_security_group_egress_rule" "allow_web_rule_ipv4" {
    security_group_id = aws_security_group.web-sg.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 0
    ip_protocol       = "-1"
    to_port           = 0

    depends_on = [ aws_security_group.web-sg ]
}