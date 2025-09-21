output "sg" {
  value = {
    alb_sg_name = aws_security_group.alb-sg.name
    alb_sg_id = aws_security_group.alb-sg.id
    web_sg_name = aws_security_group.web-sg.name
    web_sg_id = aws_security_group.web-sg.id
  }
}