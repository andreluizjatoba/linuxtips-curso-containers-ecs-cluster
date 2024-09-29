######## Project General ########
project_name           = "linuxtips-ecs-cluster"
environment            = "dev"
region                 = "us-east-1"
ssm_vpc_path           = "/linuxtips-vpc/dev"
enabled_ssm_parameters = true

######## Balancer #######
load_balancer_internal = false
load_balancer_type     = "application"

######## ECS On Demand ########
# Comando aws cli para obter o id ad AMI da útima versão otimizada para Worker ECS:
#
# aws --profile andre-labs-dev --region us-east-1 ssm get-parameters \
#     --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended \
#     --query "Parameters[0].Value" --output text | jq -r '.image_id'
#
# aws --profile andre-labs-dev --region us-east-1 ssm get-parameters \
#     --names /aws/service/ecs/optimized-ami/amazon-linux-2023/recommended \
#     --query "Parameters[0].Value" --output text | jq -r '.image_id'
#
node_ami           = "ami-01efd9ed777fe2e7f"
node_instance_type = "t3a.large"
node_volume_size   = "50"
node_volume_type   = "gp3"

cluster_on_demand_min_size     = 2
cluster_on_demand_max_size     = 4
cluster_on_demand_desired_size = 3

######## ECS Spot ########
cluster_spot_min_size     = 2
cluster_spot_max_size     = 4
cluster_spot_desired_size = 3
