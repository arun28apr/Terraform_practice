resource "aws_instance" "web1" {
  ami = "ami-00ca570c1b6d79f36"
  instance_type = "t2.micro"
  key_name = "Keypair"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [ "sg-05453214b489d08b0" ]

tags = {
  Name = "Web1"
}
  
}