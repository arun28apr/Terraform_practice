variable "aws_os_2023" {
    description = "AWS OS for the server"
    type = string
    default = "ami-0ced6a024bb18ff2e"
}

variable "my_instance_type" {
    description = "Free tier instance"
    type = string
    default = "t2.micro"
}

variable "aws_subnet" {
    description = "Subnet id for aws os"
    type = string
    default = "subnet-0900d66437acb58ea"
    
}

variable "ubuntu_os" {
    description = "Ubuntu OS for the instance"
    default = "ami-02b8269d5e85954ef"
    type = string
}

variable "Redhat_os" {
    description = "Redhat OS for instance"
    default = "ami-0e57fa2ecfa799574"
    type = string
}

variable "Redhat_subnet" {
    description = "Subent id for Redhat"
    default = "subnet-05bb039beb76b1835"
    type = string
}