output "public_security_group_id" {
  value = aws_security_group.public_security_group.id
}

output "nfs_security_group_id" {
  value = aws_security_group.nfs_security_group.id
}
