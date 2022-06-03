# Networking
vpc_cidr 		= "10.0.0.0/16"
vpc_name 		= "bv-demo-vpc"
private_subnets		= ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
public_subnets 		= ["10.0.11.0/24","10.0.22.0/24","10.0.33.0/24"]
private_subnet_names 	= ["bv-prv-subnet-1","bv-prv-subnet-2","bv-prv-subnet-3"]
public_subnet_names	= ["bv-pub-subnet-1","bv-pub-subnet-2","bv-pub-subnet-3"]
internet_gw_name	= "bv-demo-igw"
eip_name		= "bv-demo-natgw-eip"
nat_gw_name		= "bv-demo-natgw"
public_rt_name		= "bv-demo-pub-rt"
private_rt_name		= "bv-demo-prv-rt"


# EC2
create_key		= "true"
key_name		= "bv-demo-rsa-key"
vm_ssh_whitelist_ips	= ["0.0.0.0/0"]
vm_ami			= "ami-09d56f8956ab235b3"
vm_type			= "t2.micro"
vm_assign_public_ip	= "true"
vm_name			= "bv-demo-ec2"


# RDS
db_instance_name	= "bv-demo-postgres"
db_instance_size	= "20"
db_instance_type	= "db.t2.micro"
db_instance_version	= "11"
db_username		= "bvadmin"
db_password		= "qwertyadmin"
