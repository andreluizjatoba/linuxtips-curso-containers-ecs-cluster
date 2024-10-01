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

######## AMIs ECS OPTIMIZED ########
data "aws_ssm_parameter" "ami-amazon-linux-ecs-2023" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2023/recommended"
}
data "aws_ssm_parameter" "ami-amazon-linux-ecs-2" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/arm64/recommended"
}
locals {
  ami_amazon_linux_ecs_2023 = jsondecode(data.aws_ssm_parameter.ami-amazon-linux-ecs-2023.value)["image_id"]
  ami_amazon_linux_ecs_2    = jsondecode(data.aws_ssm_parameter.ami-amazon-linux-ecs-2.value)["image_id"]
}
