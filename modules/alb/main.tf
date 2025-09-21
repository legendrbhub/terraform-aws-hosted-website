resource "aws_lb" "alb" {
  name               = "${var.project_name}-alb"
  region             = var.region
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  timeouts {
    create = "15m"
    delete = "15m"
    update = "15m"
  }

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.project_name}-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  ip_address_type = "ipv4"

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-499"
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_lb_listener" "forward" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  depends_on = [ aws_lb_target_group.tg ]
}