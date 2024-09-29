locals {
  parameter_prefix = format("/%s/%s", var.project_name, var.environment)
}

######## LOAD BALANCER ########
resource "aws_ssm_parameter" "load_balancer_arn" {
  count = var.enabled_ssm_parameters ? 1 : 0

  name  = "${local.parameter_prefix}/load_balancer/id"
  type  = "String"
  value = aws_lb.main.arn
}

resource "aws_ssm_parameter" "load_balancer_listener" {
  count = var.enabled_ssm_parameters ? 1 : 0

  name  = "${local.parameter_prefix}/load_balancer/listener"
  type  = "String"
  value = aws_lb_listener.main.arn
}

