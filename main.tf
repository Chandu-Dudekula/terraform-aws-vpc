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

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id       # it will associate(add) above created vpc to this public subnets
  count = len(var.public_subnet_cidrs)  # ekkada roboshop project lo 2 public subnets kavali anduku count ni len function use chesi we are getting the 2 value
  cidr_block = var.public_subnet_cidrs[count.index] # ekkada oko subnet ki cidr variables lo list use chesi declare chesam akkada nunchi count.index ane function use chesi we are getting the cidr block for each subnet anna mata
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  # roboshop-dev-public-us-east-1a
  tags = merge(local.common_tags, {Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"}, var.public_subnet_tags )

}