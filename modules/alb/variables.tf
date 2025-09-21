variable "project_name" {}
variable "region" {}
variable "cidr" {}
variable "alb_security_group_id" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}