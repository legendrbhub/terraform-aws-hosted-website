output "asg" {
    value = {
        launch_template_name = aws_launch_template.alb-web-launch-template.name
        launch_template_id = aws_launch_template.alb-web-launch-template.id
        launch_template_arn = aws_launch_template.alb-web-launch-template.arn
        asg_name = aws_autoscaling_group.alb-web-asg.name
        asg_id = aws_autoscaling_group.alb-web-asg.id
        asg_arn = aws_autoscaling_group.alb-web-asg.arn
    }
}