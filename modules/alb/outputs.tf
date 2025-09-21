output "alb" {
    value = {
    alb_id   = aws_lb.alb.id
    alb_arn  = aws_lb.alb.arn
    alb_dns  = aws_lb.alb.dns_name
    alb_zone = aws_lb.alb.zone_id
    target_group_name = aws_lb_target_group.tg.name
    target_group_id  = aws_lb_target_group.tg.id
    target_group_arn = aws_lb_target_group.tg.arn
    alb_listener_id  = aws_lb_listener.forward.id
    alb_listener_arn = aws_lb_listener.forward.arn
    }
}