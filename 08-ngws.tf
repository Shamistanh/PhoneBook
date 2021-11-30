resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.front-public-phone-book.id
  depends_on = [aws_internet_gateway.phonebook-gateway]
  tags = {
    Name = "private phonebook nat gateway"
  }
}