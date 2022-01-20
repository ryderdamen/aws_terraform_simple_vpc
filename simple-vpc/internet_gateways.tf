resource "aws_internet_gateway" "public_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name        = "${var.environment}-internet-gateway"
    Environment = var.environment
  }
}
