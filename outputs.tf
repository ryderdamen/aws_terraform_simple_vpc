output "vpc" {
  value = aws_vpc.main_vpc
}

output "public_subnets" {
    value = aws_subnet.public_subnets
}

output "private_subnets" {
    value = aws_subnet.private_subnets
}
