######## VPC PARAMETERS (Settings) ########
data "aws_ssm_parameters_by_path" "vpc" {
  path            = var.ssm_vpc_path
  recursive       = true
  with_decryption = false
}

locals {
  vpc_parameters = {
    for p, name in data.aws_ssm_parameters_by_path.vpc.names :
    replace(trimspace(replace(name, "${var.ssm_vpc_path}", "")), "/", "") => data.aws_ssm_parameters_by_path.vpc.values[p]
  }
}
