# Create Networking Componentes
module "vpc" {
  source		= "./modules/networking"
 
  vpc_cidr		= var.vpc_cidr
  vpc_name		= var.vpc_name
  private_subnets	= var.private_subnets
  public_subnets	= var.public_subnets
  private_subnet_names	= var.private_subnet_names
  public_subnet_names	= var.public_subnet_names
  internet_gw_name	= var.internet_gw_name
  eip_name		= var.eip_name
  nat_gw_name		= var.nat_gw_name
  public_rt_name	= var.public_rt_name
  private_rt_name	= var.private_rt_name
}


# Create EC2 Instance
module "ec2" {
  source		= "./modules/ec2"

  create_key		= var.create_key
  key_name		= var.key_name
  vm_ssh_whitelist_ips	= var.vm_ssh_whitelist_ips
  vm_ami		= var.vm_ami
  vm_type		= var.vm_type
  vm_assign_public_ip	= var.vm_assign_public_ip
  vm_name		= var.vm_name
  #vm_availability_zone  = var.vm_availability_zone
  vpc_id		= module.vpc.vpc_id 
  subnet_id		= module.vpc.public_subnet_ids[0]
}



# Create Postgres RDS Instance
module "rds" {
  source		= "./modules/rds"

  db_instance_name	= var.db_instance_name
  db_instance_size	= var.db_instance_size
  db_instance_type	= var.db_instance_type
  db_instance_version	= var.db_instance_version
  db_username		= var.db_username
  db_password		= var.db_password
  subnet_ids		= module.vpc.private_subnet_ids
  vpc_id		= module.vpc.vpc_id 
  whitelist_sg_id	= [module.ec2.ec2_sg_id]
}

