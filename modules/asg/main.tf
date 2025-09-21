resource "aws_launch_template" "alb-web-launch-template" {
    region = var.region
    name_prefix   = "${var.project_name}-launch-template"
    image_id      = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    
    vpc_security_group_ids = [var.web_security_group_id]

    user_data = base64encode(file("${path.module}/userdata.sh"))

    tag_specifications {
        resource_type = "instance"

        tags = {
            Name = "${var.project_name}-web-server"
        }
    }
    
    lifecycle {
        create_before_destroy = true
    } 
}

resource "aws_autoscaling_group" "alb-web-asg" {
    region = var.region
    name                      = "${var.project_name}-web-asg"
    max_size                  = 9
    min_size                  = 3
    desired_capacity          = 3
    launch_template {
        id      = aws_launch_template.alb-web-launch-template.id
        version = "$Latest"
    }
    vpc_zone_identifier       = var.private_subnet_ids
    target_group_arns         = var.target_group_arns
    health_check_type         = "EC2"
    health_check_grace_period = 300
    force_delete              = true

    tag {
        key                 = "Name"
        value               = "${var.project_name}-web-server"
        propagate_at_launch = true
    }

    lifecycle {
        create_before_destroy = true
    }

    depends_on = [ aws_launch_template.alb-web-launch-template ]
}