resource "hcloud_ssh_key" "default" {
  name = "k3s-ssh-key"
  public_key = file(var.ssh_public_key_path)
}

resource "hcloud_server" "k3s_node" {
  name = "k3s-server"
  image = "ubuntu-24.04"
  server_type = var.server_type
  location = var.location
  ssh_keys = [hcloud_ssh_key.default.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  user_data = templatefile("${path.module}/install_k3s.tftpl", {
    k8s_yaml_content = join("\n---\n", [
        file("${path.module}/k8s/deployment.yaml"),
        file("${path.module}/k8s/service.yaml"),
        file("${path.module}/k8s/ingress.yaml")
    ])
  })
}

resource "cloudflare_dns_record" "root" {
  zone_id = var.cloudflare_zone_id
  name = "@"
  ttl = 1
  content = hcloud_server.k3s_node.ipv4_address
  type = "A"
  proxied = true
}

resource "hcloud_firewall" "k3s_firewall" {
  name = "k3s-security-group"

  # SSH
  rule {
    direction = "in"
    protocol = "tcp"
    port = "22"
    source_ips = [
      "0.0.0.0/0", # 開發中，之後再改為我的IP
      "::/0"
    ]
  }

  # HTTP
  rule {
    direction = "in"
    protocol = "tcp"
    port = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # HTTPS
  rule {
    direction = "in"
    protocol = "tcp"
    port = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_firewall_attachment" "main" {
  firewall_id = hcloud_firewall.k3s_firewall.id
  server_ids = [hcloud_server.k3s_node.id]
}