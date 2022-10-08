resource "aws_security_group" "blue_green_lb" {
  name   = "blue-gree-lb-sg"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    description = "HTTP connection into the server"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "blue-gree-lb-sg"
  }
}

resource "aws_security_group" "app_server" {
  name   = "asg-app-sg"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    description     = "HTTP connection into the server"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.blue_green_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "asg-app-sg"
  }
}


