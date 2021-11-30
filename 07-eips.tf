resource "aws_eip" "nat" {
  vpc = true
  depends_on = [aws_internet_gateway.phonebook-gateway]
  instance = aws_insrance
}