resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public_gateway.id
  depends_on = [
    aws_route_table.public_route_table,
  ]
}


resource "aws_route" "private_internet_route" {
  count                  = length(local.private_cidrs)
  route_table_id         = aws_route_table.private_route_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.private.id
  depends_on = [
    aws_route_table.private_route_tables,
    aws_nat_gateway.private,
  ]
}
