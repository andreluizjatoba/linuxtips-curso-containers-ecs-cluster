######## VPC ########
#output "vpc_raw_output" {
#  value = data.aws_ssm_parameters_by_path.vpc
#  sensitive = true
#}
#
#output "vpc_parameters_output" {
#  value     = local.vpc_parameters
#  sensitive = true
#}

####### LOAD BALANCER ########
output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}
output "ssm_load_balancer_arn" {
  value = aws_ssm_parameter.load_balancer_arn[0].id
}
output "ssm_load_balancer_listener" {
  value = aws_ssm_parameter.load_balancer_listener[0].id
}