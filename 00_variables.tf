######## General Configs ########
variable "project_name" {
  description = "Nome do projeto"
  type        = string
}
variable "environment" {
  description = "Ambiente default para deploy"
  type        = string
  default     = "dev"
}
variable "region" {
  description = "Regiao da AWS"
  type        = string
  default     = "us-east-1"
}
variable "enabled_ssm_parameters" {
  description = "Habilitar ou desabilitar a criação dos parametros no SSM"
  type        = bool
  default     = true
}

######## SSM VPC Parameters ########
variable "ssm_vpc_path" {
  description = "Path dos parametros da VPC no SSM"
  type        = string
}

##### Balancer ##########
variable "load_balancer_internal" {
  description = "Definir se o Load Balancer é Interno ou Externo"
  type        = bool
}
variable "load_balancer_type" {
  description = "Tipo do Load Balancer"
  type        = string
}

######## ECS ON DEMAND  ########
variable "node_ami" {
  description = "IAM ID para instância EC2 On Demand (nodes)"
  type        = string

}
variable "node_instance_type" {
  description = "Tipo da instância EC2 On Demand"
  type        = string
}
variable "node_volume_size" {
  description = "Tamanho do volume EBS da instância EC2 On Demand"
  type        = string
}
variable "node_volume_type" {
  description = "Tipo do volume EBS da instância EC2 On Demand"
  type        = string
}

variable "cluster_on_demand_min_size" {
  description = "Número mínimo de instâncias EC2 On Demand (nodes)"
  type        = number

}

variable "cluster_on_demand_max_size" {
  description = "Número máximo de instâncias EC2 (nodes)"
  type        = number
}

variable "cluster_on_demand_desired_size" {
  description = "Número desejado de instâncias EC2 (nodes)"
  type        = number
}

######## ECS SPOT  ########
variable "cluster_spot_min_size" {
  description = "Número mínimo de instâncias Spot (nodes)"
  type        = number

}

variable "cluster_spot_max_size" {
  description = "Número máximo de instâncias Spot (nodes)"
  type        = number
}

variable "cluster_spot_desired_size" {
  description = "Número desejado de instâncias Spot (nodes)"
  type        = number
}
