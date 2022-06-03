variable "vpc_cidr" {
  description = "VPC CIDR with netmask e.g x.x.x.x/x"
  type = string
  default = "192.168.0.0/16" 
}

variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "demo-vpc" 
}

variable "private_subnets" {
  description = "List of Private Subnets"
  type = list(string)
  default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
}

variable "public_subnets" {
  description = "List of Public Subnets"
  type = list(string)
  default = ["192.168.101.0/24","192.168.102.0/24","192.168.103.0/24"]
}

variable "private_subnet_names" {
  description = "Names of the Private Subnet"
  type = list(string)
  default = ["prv-subnet-1","prv-subnet-2","prv-subnet-3"] 
}

variable "public_subnet_names" {
  description = "Names of the Public Subnet"
  type = list(string)
  default = ["pub-subnet-1","pub-subnet-2","pub-subnet-3"] 
}

variable "internet_gw_name" {
  description = "Name of the Internet Gateway"
  type = string
  default = "demo-igw" 
}

variable "eip_name" {
  description = "Name of the Elastic IP Address"
  type = string
  default = "demo-eip"
}

variable "nat_gw_name" {
  description = "Name of the Internet Gateway"
  type = string
  default = "demo-nat-gw"
}

variable "public_rt_name" {
  description = "Public Route Table Name"
  type = string
  default = "demo-pub-rt"
}

variable "private_rt_name" {
  description = "Private Route Table Name"
  type = string
  default = "demo-prv-rt"
}

