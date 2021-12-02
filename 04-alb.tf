resource "aws_lb" "pubic_alb" {
  name               = "public-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups    = [
    aws_security_group.web.id
  ]

  subnets = [
    aws_subnet.back-private-phone-book-1.id,
    aws_subnet.back-private-phone-book-2.id,
    aws_subnet.front-public-phone-book-1.id,
    aws_subnet.front-public-phone-book-2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name        = "alb-app"
    Environment = "production"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.pubic_alb.arn
  port = 80

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "There's nothing here"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "my_app" {
  listener_arn = aws_lb_listener.http.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }

  condition {
    host_header {
      values = ["myapp.example.com"]
    }
  }
}

resource "aws_lb_target_group" "app" {
  vpc_id = aws_vpc.main.id
  name     = "tg-app"
  port     = 80
  protocol = "HTTP"
}