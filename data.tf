data "aws_availability_zones" "available" {
    state = "available"
}

resource "random_shuffle" "public_availability_zones" {
    input = data.aws_availability_zones.available.names
    result_count = var.public_subnet_count
}

resource "random_shuffle" "private_availability_zones" {
    input = data.aws_availability_zones.available.names
    result_count = var.private_subnet_count
}
