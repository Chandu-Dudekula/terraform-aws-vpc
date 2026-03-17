# Availability Zones
data "aws_availability_zones" "available" {
  state = "available"  # yenni availability zones unnai anni telusukuneki data source use chesi query chesinam
}

# # default Peer VPC ID
# data "aws_vpc" "default" {
#    default = true
# }


# data "aws_route_table" "default" {
#   vpc_id = data.aws_vpc.default.id
#   filter {
#     name   = "association.main"
#     values = ["true"]
#   }
# }