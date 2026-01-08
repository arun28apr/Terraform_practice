variable "my_instance_type" {
    description = "Free tier t2.micro"
    type = string
    default = "t2.micro"  
}
variable "ubuntu_subnet" {
    description = "subnet id for ubuntu"
    type = string
    default = "subnet-0900d66437acb58ea"
  
}
variable "aws_subnet" {
    description = "subnet id for aws"
    type = string
    default = "subnet-05bb039beb76b1835"
  
}
variable "Redhat_subnet" {
    description = "subnet id for redhat"
    type = string
    default = "subnet-05bb039beb76b1835"
  }