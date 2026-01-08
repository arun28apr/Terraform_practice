resource "aws_instance" "Ubuntu_OS" {
  ami = "ami-02b8269d5e85954ef"
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = var.ubuntu_subnet
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-05453214b489d08b0"]

tags = {
  Name = "Ubuntu_OS"
}
}

resource "aws_instance" "Aws_OS" {
  ami = "ami-0ced6a024bb18ff2e"
  instance_type = var.my_instance_type
  key_name = "Keypair"
  availability_zone = "ap-south-1a"
  subnet_id = var.aws_subnet
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-05453214b489d08b0"]

tags = {
  Name = "Aws_OS"
}
}

resource "aws_instance" "Redhat_OS" {
  ami = "ami-01ca13db604661046"
  instance_type = var.my_instance_type
  key_name = "Keypair"
  subnet_id = var.Redhat_subnet
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-05453214b489d08b0"]

tags = {
  Name = "Redhat_OS"
}  
}