resource "aws_route_table" "front-public" {
  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.phonebook-gateway.id
  }
}
resource "aws_route_table" "back-private" {
  vpc_id = aws_vpc.main.id
  nat_gateway_id = aws_nat_gateway.ngw1.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw1.id
  }

}

resource "aws_route_table_association" "public" {

  subnet_id = aws_subnet.front-public-phone-book.id
  route_table_id = aws_route_table.front-public.id
}

resource "aws_route_table_association" "private" {

  subnet_id = aws_subnet.back-private-phone-book.id
  route_table_id = aws_route_table.back-private.id
}