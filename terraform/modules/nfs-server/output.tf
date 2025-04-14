output "nfs_public_ip" {
  description = "Public IP of the Kubernetes master node"
  value       = aws_instance.nfs-server.public_ip
}

output "nfs_node_private_ip" {
  description = "Private IP of the Kubernetes master node"
  value       = aws_instance.nfs-server.private_ip
}
