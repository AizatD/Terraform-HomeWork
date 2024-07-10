provider aws {
    region = var.region
}


resource "aws_instance" "web" {
  ami           = var.id_ami
  instance_type = var.instance_type
 availability_zone = var.region
 
}
variable region,regionW1,regionE2 {}

variable id_ami {
  description = "Provide ami id"
  type = string  
  default = ""
}
#ami-06c68f701d8090592 VI

variable region {
  description = "Privide region"
  type=string
  default = ""
}
variable instance_type {
  description = "Provide instance type"
  type=string
  
}
# variable availabiliyu_zone {
#   type = string
#   description = ""
  
# }
