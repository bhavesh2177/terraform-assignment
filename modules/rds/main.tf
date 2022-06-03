# Create Subnet Groups
resource "aws_db_subnet_group" "postgres" {
  name       		= "postgres"
  subnet_ids 		= var.subnet_ids

  tags = {
    Name = "postgres-subnet-group"
  }
}


# Create Security Group
resource "aws_security_group" "rds" {
  name                  = "rds_sg"
  description           = "Control RDS traffic"
  vpc_id                = "${var.vpc_id}"

  ingress {
    description      = "Allow 5432"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    security_groups  = var.whitelist_sg_id
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}

# Create RDS Postgres instance
resource "aws_db_instance" "postgres" {
  allocated_storage    	= "${var.db_instance_size}"
  engine               	= "postgres"
  identifier           	= "${var.db_instance_name}"
  engine_version       	= "${var.db_instance_version}"
  instance_class       	= "${var.db_instance_type}"
  username             	= "${var.db_username}"
  password             	= "${var.db_password}"
  db_subnet_group_name 	= "postgres"
  publicly_accessible  	= "false"
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
}
