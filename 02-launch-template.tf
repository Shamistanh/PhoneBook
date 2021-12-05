resource "aws_launch_template" "app_node" {
  name = "phone-book-app"



  instance_type = "t2.micro"

  image_id = "ami-01cc34ab2709337aa"

  instance_initiated_shutdown_behavior = "terminate"

  update_default_version = true

  key_name = "phone-app-key"

  network_interfaces {
    associate_public_ip_address = true

    security_groups = [
      aws_security_group.web.id,
      aws_security_group.ssh.id
    ]
  }

  placement {
    availability_zone = "us-east-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "phone-book-app"
    }
  }

  user_data = templatefile("files/user_data.sh",
  {
    backend_url = aws_lb_listener.http.arn, db_url = "jdbc:mysql://${aws_db_instance.phone_book-app-db.address}:${aws_db_instance.phone_book-app-db.port}/${aws_db_instance.phone_book-app-db.name}",
  db_username = aws_db_instance.phone_book-app-db.username, db_password = aws_db_instance.phone_book-app-db.password
  }
  )
}