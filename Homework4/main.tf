provider aws {
    region = var.region
}


resource "aws_instance" "HW4" {
  ami = var.id_ami
  instance_type = var.instance_type
 availability_zone = var.availability_zone
 count = var.instance_count
 key_name = var.key_name
 vpc_security_group_ids = [aws_security_group.allow_tls.id]

}


variable id_ami {
  description = "Provide ami id"
  type = string  
  default = ""
}
#ami-06c68f701d8090592 VI

variable region {
  description = "Provide region"
  type=string
  default = ""
}
variable instance_type {
  description = "Provide instance type"
  type=string
  default = ""
}
variable availability_zone {
  type = string
  description = "Provide availability zone"
  default = ""
}
variable key_name {
  description = "The name of the key pair"
  type = string
  default = ""
}

variable instance_count {
  description = "Provide the number of instances to create"
  type = number
  default = 1
}
