resource "aws_instance" "web1" {
  ami = var.aws_os_2023
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = var.aws_subnet
  associate_public_ip_address = true
  vpc_security_group_ids = [ "sg-05453214b489d08b0" ]
tags = {
  Name = "AWS_OS"
}
}

resource "aws_instance" "web2" {
  ami = var.ubuntu_os
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = var.aws_subnet
  associate_public_ip_address = true
  vpc_security_group_ids = [ "sg-05453214b489d08b0" ]
tags = {
  Name = "Ubuntu_OS"
}
  
}

resource "aws_instance" "web3" {
  ami = var.Redhat_os
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = var.Redhat_subnet
  associate_public_ip_address = true
  vpc_security_group_ids = [ "sg-05453214b489d08b0" ]
tags = {
  Name = "Redhat_OS"
}
}