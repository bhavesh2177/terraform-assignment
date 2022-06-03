variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "create_key" {
  type = bool
  default = false
}

variable "key_name" {
  type = string
  default = "rsa_keypair" 
}

variable "vm_ssh_whitelist_ips" {
  type = list(string)
  default = []
}

variable "vm_ami" {
  type = string
  default = ""
}

variable "vm_type" {
  type = string
  default = "t2.micro"
}

variable "vm_assign_public_ip" {
  type = bool
  default = false
}

variable "vm_name" {
  type = string
  default = "deo_vm" 
}

