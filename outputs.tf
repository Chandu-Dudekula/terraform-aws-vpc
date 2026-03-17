output "az_info" {
  value = data.aws_availability_zones.available  # data source query use chesi availability zones yenni unnayi anni telusukoni ekkada output loki tesukunam
}

output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet_ids" {
    value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
    value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
    value = aws_subnet.database[*].id
}