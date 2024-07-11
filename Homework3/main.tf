provider aws {
  region = "us-west-2"
}
resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
  # tags=local.common_tags
  
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web1" {
  
  ami  = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
user_data = file("apache.sh")
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = element (["us-west-2a","us-west-2b","us-west-2c"],count.index)
  count=3
  key_name = "${aws_key_pair.deployer.key_name}"
  
  tags={
    name= element(["Web1","Web2","Web3"],count.index)
  
  }
  
}

output web {
    value = aws_instance.web1[1].public_ip
    #sensitive = true
}
