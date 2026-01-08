resource "aws_instance" "Ubuntu_OS" {
  ami = "ami-02b8269d5e85954ef"
  instance_type = "t2.micro"
  key_name = "Keypair"
  subnet_id = "subnet-0900d66437acb58ea"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-05453214b489d08b0"]

tags = {
  Name = "Ubuntu_OS"
}
}

resource "aws_instance" "Aws_OS" {
  ami = "ami-0ced6a024bb18ff2e"
  instance_type = "t2.micro"
  key_name = "Keypair"
  availability_zone = "ap-south-1a"
  subnet_id = "subnet-05bb039beb76b1835"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-05453214b489d08b0"]

tags = {
  Name = "Aws_OS"
}
}

resource "aws_instance" "Redhat_OS" {
  ami = "ami-01ca13db604661046"
  instance_type = "t2.micro"
  key_name = "Keypair"
  subnet_id = "subnet-05bb039beb76b1835"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-05453214b489d08b0"]

tags = {
  Name = "Redhat_OS"
}  
}