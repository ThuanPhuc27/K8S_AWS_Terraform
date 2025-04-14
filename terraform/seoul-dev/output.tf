################################################################################
# Network Module - Variables 
################################################################################

output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

################################################################################
# Security Module - Variables 
################################################################################

output "public_security_group_id" {
  value = module.security.public_security_group_id
}