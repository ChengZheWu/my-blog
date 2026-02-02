output "server_ip" {
  description = "Public IP address of the server"
  value = hcloud_server.k3s_node.ipv4_address
}

output "ssh_command" {
  description = "Command to SSH into the server"
  value = "ssh root@${hcloud_server.k3s_node.ipv4_address}"
}