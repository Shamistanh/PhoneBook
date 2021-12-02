resource "aws_route_table" "front-public" {
  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.phonebook-gateway.id
  }
}
resource "aws_route_table" "back-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw1.id
  }

}

resource "aws_route_table_association" "public1" {

  subnet_id = aws_subnet.front-public-phone-book-1.id
  route_table_id = aws_route_table.front-public.id
}

resource "aws_route_table_association" "public2" {

  subnet_id = aws_subnet.front-public-phone-book-2.id
  route_table_id = aws_route_table.front-public.id
}


resource "aws_route_table_association" "private1" {

  subnet_id = aws_subnet.back-private-phone-book-1.id
  route_table_id = aws_route_table.back-private.id
}

resource "aws_route_table_association" "private2" {

  subnet_id = aws_subnet.back-private-phone-book-2.id
  route_table_id = aws_route_table.back-private.id
}