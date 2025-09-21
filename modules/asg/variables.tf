variable "project_name" {}
variable "region" {}
variable "image_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "web_security_group_id" {}
variable "private_subnet_ids" { type = list(string)}
variable "target_group_arns" { type = list(string) }