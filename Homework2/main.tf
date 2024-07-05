provider aws {
  region = "us-east-2"
}
# resource "aws_key_pair" "deployer" {
#   key_name   = "bastion-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }
# resource "aws_s3_bucket" "kaizen-aizat" {
#   bucket = "aizat1"
# }
# resource "aws_s3_bucket" "kaizen-on" {
#   bucket_prefix = "aizat2"
# }
# resource "aws_s3_bucket" "kaizenvkl" {
#   bucket = "aizat3manually"
# }
# #terraform import aws_s3_bucket.kaizenvkl aizat3mannually
# resource "aws_s3_bucket" "kaizenon" {
#   bucket = "aizat4manually"
# }
# #terraform import aws_s3_bucket.kaizenon aizat4mannually
