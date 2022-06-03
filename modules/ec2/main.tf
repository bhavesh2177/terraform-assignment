# Create Key Pair
resource "tls_private_key" "key" {
  count			= var.create_key ? 1 : 0
  algorithm 		= "RSA"
  rsa_bits  		= "4096"
}

resource "aws_key_pair" "key" {
  count			= var.create_key ? 1 : 0
  key_name   		= "${var.key_name}"
  public_key 		= "${tls_private_key.key[0].public_key_openssh}"

  tags = {
    Name = "vm_key_pair"
  }
}


# Create PEM file locally
resource "local_file" "pemkey" {
  count			= var.create_key ? 1 : 0
  filename		= "./keypair.pem"
  content		= tls_private_key.key[0].private_key_pem
}

# Create Security Group
resource "aws_security_group" "vm" {
  name        		= "vm_sg"
  description 		= "Control VM traffic"
  vpc_id      		= "${var.vpc_id}"

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.vm_ssh_whitelist_ips
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vm_sg"
  }
}



# Create EC2 Instance
resource "aws_instance" "vm" {
  ami 			= "${var.vm_ami}"
  instance_type 	= "${var.vm_type}"
  key_name 		= var.create_key ? aws_key_pair.key[0].key_name : var.key_name
  vpc_security_group_ids = ["${aws_security_group.vm.id}"]
  subnet_id 		= "${var.subnet_id}"
  associate_public_ip_address = "${var.vm_assign_public_ip}"
  #availability_zone	= "${var.vm_availability_zone}"

  tags = {
    Name = "${var.vm_name}"
  }
}


