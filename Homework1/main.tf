resource "aws_iam_user" "jenny" {
  name = "jenny" 
}
resource "aws_iam_user" "rose" {
  name = "rose" 
}
resource "aws_iam_user" "lisa" {
  name = "lisa" 
}
resource "aws_iam_user" "jisoo" {
  name = "jisoo" 
}
resource "aws_iam_user" "sana" {
  name = "sana" 
}
resource "aws_iam_user" "momo" {
  name = "momo" 
}
resource "aws_iam_user" "dahyan" {
  name = "dahyan" 
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
  
}
resource "aws_iam_group_membership" "group1" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.jisoo.name,
    aws_iam_user.sana.name,
    aws_iam_user.momo.name,
    aws_iam_user.dahyan.name,
    aws_iam_user.miyeon.name,
  ]

  group = aws_iam_group.blackpink.name
}
resource "aws_iam_group" "twice" {
  name = "twice"
  
}
resource "aws_iam_group_membership" "group2" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.jenny.name,
    aws_iam_user.rose.name,
    aws_iam_user.lisa.name,
    aws_iam_user.jisoo.name,
    aws_iam_user.mina.name,
  ]

  group = aws_iam_group.twice.name
}

resource "aws_iam_user" "mina" {
  name = "mina" 
}
#terraform import aws_iam_user.mina mina

resource "aws_iam_user" "miyeon" {
  name = "miyeon" 
}

#terraform import aws_iam_user.miyeon miyeon