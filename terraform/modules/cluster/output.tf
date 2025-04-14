output "master_node_public_ip" {
  description = "Public IP of the Kubernetes master node"
  value       = aws_instance.master-node.public_ip
}

output "master_node_private_ip" {
  description = "Private IP of the Kubernetes master node"
  value       = aws_instance.master-node.private_ip
}

output "worker_node1_public_ip" {
  description = "Public IP of the first worker node"
  value       = aws_instance.worker-node-1.public_ip
}

output "worker_node1_private_ip" {
  description = "Private IP of the first worker node"
  value       = aws_instance.worker-node-1.private_ip
}

output "worker_node2_public_ip" {
  description = "Public IP of the second worker node"
  value       = aws_instance.worker-node-2.public_ip
}

output "worker_node2_private_ip" {
  description = "Private IP of the second worker node"
  value       = aws_instance.worker-node-2.private_ip
}
