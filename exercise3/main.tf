resource "aws_security_group" "awsfw" {
  name = "aws-fw"
  vpc_id = aws_vpc.tfvpc.id
  dynamic "ingress" {
    for_each = toset([80, 53, 443, 22, 21])
    content {
      protocol = "tcp"
      to_port = ingress.value
      from_port = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
