locals {
common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"
  }

  vpc_final_tags = merge(local.common_tags,{Name = "${var.project}-${var.environment}"}, var.vpc_tags)

  igw_final_tags = merge(local.common_tags,{Name = "${var.project}-${var.environment}"}, var.igw_tags)

  az_names= slice(data.aws_availability_zones.available.names, 0, 2) # slice function use chesi we are taking first 2 availability_zones [ "us-east-1a", "us-east-1b"] to az_names loki. 

}