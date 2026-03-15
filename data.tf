# Availability Zones
data "aws_availability_zones" "available" {
  state = "available"  # yenni availability zones unnai anni telusukuneki data source use chesi query chesinam
}
