variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type = string
  sensitive = true
}

variable "server_type" {
  description = "Server Type"
  type = string
  default = "cx23"
}

variable "locaion" {
  description = "Data Center Location"
  type = string
  default = "sin"
}

variable "ssh_public_key_path" {
  description = "Path to your local SSH public key"
  type = string
  default = "~/.ssh/id_rsa.pub"
}