provider aws {
  region = "us-west-2"
}
resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_instance" "web1" {
  ami  = "ami-0604d81f2fd264c7b"
  instance_type = "t2.micro"
user_data = file("apache.sh")
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #availability_zone = "us-west-2a"
  subnet_id="subnet-0bf72d49e092aac21"
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "Web1"
  }
}

resource "aws_instance" "web2" {
  ami  = "ami-0604d81f2fd264c7b"
  instance_type = "t2.micro"
#availability_zone = "us-west-2b"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
 
  subnet_id = "subnet-08372e509725d6afd"
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "Web2"
  }
}

resource "aws_instance" "web3" {
  ami  = "ami-0604d81f2fd264c7b"
  instance_type = "t2.micro"
  #availability_zone = "us-west-2c"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  subnet_id = "subnet-02209ad9318e6652b"
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "Web3"
  }
}
output ec1 {
    value = aws_instance.web1.public_ip
    #sensitive = true
}
output ec2 {
    value = aws_instance.web2.public_ip
    #sensitive = true
}
output ec3 {
    value = aws_instance.web3.public_ip
    #sensitive = true
}