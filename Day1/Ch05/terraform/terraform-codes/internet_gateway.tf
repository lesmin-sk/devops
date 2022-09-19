resource "aws_internet_gateway" "skt-user05-internet-gateway" {

  depends_on = [
    aws_vpc.skt-user05-vpc
  ]

  vpc_id = aws_vpc.skt-user05-vpc.id
}
