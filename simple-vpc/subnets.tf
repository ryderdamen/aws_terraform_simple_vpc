resource "aws_subnet" "public_subnets" {
  count = length(local.public_cidrs)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.public_cidrs[count.index]
  availability_zone = random_shuffle.public_availability_zones.result[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.public_subnet_tags, {
    Name        = "${var.environment}-public-${count.index + 1}"
    Public      = "true"
    Environment = var.environment
    AvailabilityZone = "${random_shuffle.public_availability_zones.result[count.index]}"
    CIDR = "${local.public_cidrs[count.index]}"
  })
}

resource "aws_subnet" "private_subnets" {
  count = length(local.private_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.private_cidrs[count.index]
  availability_zone = random_shuffle.private_availability_zones.result[count.index]

  tags = merge(var.private_subnet_tags, {
    Name        = "${var.environment}-private-${count.index + 1}"
    Public      = "false"
    Environment = var.environment
    AvailabilityZone = "${random_shuffle.public_availability_zones.result[count.index]}"
    CIDR = "${local.public_cidrs[count.index]}"
  })
}
