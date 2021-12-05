resource "aws_db_instance" "phone_book-app-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "test_phonebook_username"
  password             = "test_phonebook_password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
user_data = templatefile("files/user_data.sh",{ db_url = "jdbc:mysql://${aws_db_instance.phone_book-app-db.address}:${aws_db_instance.phone_book-app-db.port}/${aws_db_instance.phone_book-app-db.name}",
  db_username = aws_db_instance.phone_book-app-db.username, db_password = aws_db_instance.phone_book-app-db.password })