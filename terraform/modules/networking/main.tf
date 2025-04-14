module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "petclinic-project"
  cidr = var.cidr_block

  azs             = var.availability_zones
  public_subnets  = var.public_subnet_ips
  map_public_ip_on_launch = true

  enable_nat_gateway = false
  enable_vpn_gateway = false
  tags = {
    Name = "petclinic-project"
  }
}