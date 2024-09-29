##### SECURITY GROUP #####
resource "aws_security_group" "main" {
  name        = format("%s-main", var.project_name)
  description = "Security Group Main do Projeto"
  vpc_id      = local.vpc_parameters["vpc_id"]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-main", var.project_name)
  }
}

##### SECURITY GROUP RULES #####
resource "aws_security_group_rule" "main_subnet_ranges" {
  security_group_id = aws_security_group.main.id
  description       = "Permite trafego para a VPC"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["10.0.0.0/16"]
}
