resource "aws_internet_gateway" "phonebook-gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "phonebook-internet gateway"
  }
}
