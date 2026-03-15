resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = local.vpc_final_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id  # it will associate(add) above created vpc to this IGW(internet gateway)

  tags = local.igw_final_tags
}

# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.main.id       # it will associate(add) above created vpc to this public subnets
#   cidr_block = var.public_subnet_cidrs
#   # availability_zone = data.aws_availability_zones.available.names[count.index]
#   #map_public_ip_on_launch = true

#   tags = 
# }