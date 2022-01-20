resource "aws_nat_gateway" "private" {
  subnet_id         = aws_subnet.private_subnets[0].id
  allocation_id     = aws_eip.nat_gateway.id
  connectivity_type = "public"
  depends_on = [
    aws_internet_gateway.public_gateway,
  ]
  tags = {
    Name        = "${var.environment}-nat-gateway-private"
    Environment = var.environment
  }
}

resource "aws_eip" "nat_gateway" {
  vpc = true
  tags = {
    Name        = "${var.environment}-private-nat-gateway-elastic-ip"
    Environment = var.environment
  }
}
