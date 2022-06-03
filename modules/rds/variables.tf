variable "db_instance_name" {
  type = string
  default = "demo-postgres" 
}

variable "db_instance_size" {
  type = string
  default = "20"
}

variable "db_instance_type" {
  type = string
  default = "db.t2.micro"
}

variable "db_instance_version" {
  type = string
  default = "13" 
}

variable "db_username" {
  type = string
  default = "admin"
}

variable "db_password" {
  type = string
  default = "a@dmin@123"
}

variable "subnet_ids" {
  type = list(string)
}

variable "whitelist_sg_id" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
