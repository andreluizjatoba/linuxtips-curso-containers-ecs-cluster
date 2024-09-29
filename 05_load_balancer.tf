##### SECURITY GROUP #####
resource "aws_security_group" "load_balancer" {
  name        = format("%s-load-balancer", var.project_name)
  description = "Security Group para o Load Balancer"
  vpc_id      = local.vpc_parameters["vpc_id"]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-load-balancer", var.project_name)
  }
}

##### SECURITY GROUP RULES #####
resource "aws_security_group_rule" "load_balancer_ingress_80" {
  security_group_id = aws_security_group.load_balancer.id
  description       = "Permite trafego na porta tcp 80"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "load_balancer_ingress_443" {
  security_group_id = aws_security_group.load_balancer.id
  description       = "Permite trafego na porta tcp 443"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

######## LOAD BALANCER ########
resource "aws_lb" "main" {
  name               = format("%s-ingress", var.project_name)
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type

  subnets = [
    local.vpc_parameters["public-subnet-us-east-1a"],
    local.vpc_parameters["public-subnet-us-east-1b"],
    local.vpc_parameters["public-subnet-us-east-1c"]
  ]

  security_groups = [
    aws_security_group.load_balancer.id
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false
}

######## LOAD BALANCER LISTENER ########
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "LinuxTips"
      status_code  = "200"
    }
  }
}
