resource "aws_route_table_association" "skt-user05-route-association-pub-sub1" {
  route_table_id = aws_route_table.skt-user05-route-table-pub-sub1.id
  subnet_id      = aws_subnet.skt-user05-public-subnet1.id
}

resource "aws_route_table_association" "skt-user05-route-association-pub-sub3" {
  route_table_id = aws_route_table.skt-user05-route-table-pub-sub3.id
  subnet_id      = aws_subnet.skt-user05-public-subnet3.id
}
