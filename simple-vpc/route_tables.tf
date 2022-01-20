resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name        = "${var.environment}-public-route-table"
    Environment = var.environment
    Public      = "true"
  }
  depends_on = [
    aws_subnet.public_subnets
  ]
}

resource "aws_route_table" "private_route_tables" {
  count = length(local.private_cidrs)
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name             = "${var.environment}-private-${count.index + 1}-route-table"
    Environment      = var.environment
    Public           = "false"
    CIDRAssociation = "${local.private_cidrs[count.index]}"
  }
  depends_on = [
    aws_subnet.private_subnets
  ]
}

resource "aws_route_table_association" "public_route_table_subnet_associations" {
  count = length(local.public_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_subnet_associations" {
  count = length(local.private_cidrs)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_tables[count.index].id
}

resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.main_vpc.default_route_table_id

  tags = {
    Name = "${var.environment}-default-route-table"
    Environment = var.environment
    Public      = "false"
  }
}
