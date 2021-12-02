resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.front-public-phone-book-1.id
  depends_on = [aws_internet_gateway.phonebook-gateway]
  tags = {
    Name = "private phonebook nat gateway 1"
  }
}


resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.front-public-phone-book-2.id
  depends_on = [aws_internet_gateway.phonebook-gateway]
  tags = {
    Name = "private phonebook nat gateway 2"
  }
}