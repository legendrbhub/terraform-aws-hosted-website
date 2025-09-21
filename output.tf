output "Infra" {
  value = {
    VPC = module.vpc.vpc
    SG  = module.sg.sg
    ALB = module.alb.alb
    ASG = module.asg.asg
  }
}
