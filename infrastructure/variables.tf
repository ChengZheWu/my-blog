variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type = string
  sensitive = true
}

variable "server_type" {
  description = "Server Type"
  type = string
  default = "cx33"
}

variable "location" {
  description = "Data Center Location"
  type = string
  default = "hel1"
}

variable "ssh_public_key_path" {
  description = "Path to your local SSH public key"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type = string
  sensitive = true
}