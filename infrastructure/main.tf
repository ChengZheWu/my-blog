resource "hcloud_ssh_key" "default" {
  name = "k3s-ssh-key"
  public_key = file(var.ssh_public_key_path)
}

resource "hcloud_server" "k3s_node" {
  name = "k3s-server"
  image = "ubuntu-24.04"
  server_type = var.server_type
  location = var.locaion
  ssh_keys = [hcloud_ssh_key.default.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  user_data = templatefile("${path.module}/install_k3s.tftpl", {
    k8s_yaml_content = join("\n---\n", [
        file("${path.module}/k8s/deployment.yaml"),
        file("${path.module}/k8s/service.yaml")
    ])
  })
}