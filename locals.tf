locals {
    public_cidrs = slice([for i in range(2, 255, 2) : cidrsubnet(var.vpc_cidr_block, 8, i)], 0, var.public_subnet_count)
    private_cidrs = slice([for i in range(1, 255, 2) : cidrsubnet(var.vpc_cidr_block, 8, i)], 0, var.private_subnet_count)
}
