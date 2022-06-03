variable "vpc_cidr" {
  description = "VPC CIDR with netmask e.g x.x.x.x/x"
  type = string
}

variable "vpc_name" {
  description = "VPC Name"
  type = string
}

variable "private_subnets" {
  description = "List of Private Subnets"
  type = list(string)
}

variable "public_subnets" {
  description = "List of Public Subnets"
  type = list(string)
}

variable "private_subnet_names" {
  description = "Names of the Private Subnet"
  type = list(string)
}

variable "public_subnet_names" {
  description = "Names of the Public Subnet"
  type = list(string)
}

variable "internet_gw_name" {
  description = "Name of the Internet Gateway"
  type = string
}

variable "eip_name" {
  description = "Name of the Elastic IP Address"
  type = string
}

variable "nat_gw_name" {
  description = "Name of the Internet Gateway"
  type = string
}

variable "public_rt_name" {
  description = "Public Route Table Name"
  type = string
}

variable "private_rt_name" {
  description = "Private Route Table Name"
  type = string
}

variable "create_key" {
  description = "Create RSA Key Pair true/false"
  type = bool
}

variable "key_name" {
  description = "RSA Keypair Name"
  type = string
}

variable "vm_ssh_whitelist_ips" {
  description = "Allowed SSH IPs"
  type = list(string)
}

variable "vm_ami" {
  description = "EC2 instance AMI id"
  type = string
}

variable "vm_type" {
  description = "EC2 instance type"
  type = string
}

variable "vm_assign_public_ip" {
  description = "Attach Public IP to EC2 instance true/false"
  type = bool
}

variable "vm_name" {
  description = "Name of the EC2 instance"
  type = string
}

variable "db_instance_name" {
  description = "RDS instance name"
  type = string
}

variable "db_instance_size" {
  description = "RDS instance size"
  type = string
}

variable "db_instance_type" {
  description = "RSS instance type"
  type = string
}

variable "db_instance_version" {
  description = "RDS version"
  type = string
}

variable "db_username" {
  description = "DB username"
  type = string
}

variable "db_password" {
  description = "DB password"
  type = string
}

