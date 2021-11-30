resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.front-public-phone-book.id
}