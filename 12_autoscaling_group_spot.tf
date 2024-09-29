######## AUTOSCALING GROUP ########
resource "aws_autoscaling_group" "spot" {
  name_prefix = format("%s-spot", var.project_name)

  vpc_zone_identifier = [
    local.vpc_parameters["private-subnet-us-east-1a"],
    local.vpc_parameters["private-subnet-us-east-1b"],
    local.vpc_parameters["private-subnet-us-east-1c"],
  ]

  desired_capacity = var.cluster_spot_desired_size
  max_size         = var.cluster_spot_max_size
  min_size         = var.cluster_spot_min_size

  launch_template {
    id      = aws_launch_template.spot.id
    version = aws_launch_template.spot.latest_version
  }

  tag {
    key                 = "Name"
    value               = format("%s-spot", var.project_name)
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}

######## CAPACITY PROVIDER ########
resource "aws_ecs_capacity_provider" "spot" {
  name = format("%s-spot", var.project_name)

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.spot.arn

    managed_scaling {
      maximum_scaling_step_size = 10
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 90
    }
  }
}
