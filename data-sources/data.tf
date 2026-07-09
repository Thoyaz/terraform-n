data "aws_instance" "mandodb-server-pip" {
  instance_id = "i-088c51226a7db69fd"

  filter {
    name   = "image-id"
    values = ["ami-0220d79f3f480ecf5"]
  }

  filter {
    name   = "tag:Name"
    values = ["mongodb"]
  }
}