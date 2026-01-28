variable "client_name" {
    default = "default"
}

variable "Managed_by" {
    default = "default"
}

variable "ubuntu_os" {
    description = "Ubuntu OS for the instance"
    default = "ami-02b8269d5e85954ef"
    type = string
}

variable "my_instance_type" {
    description = "Free tier instance"
    type = string
    default = "t2.micro"
}