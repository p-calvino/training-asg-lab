resource "aws_launch_template" "green_template" {
  name                   = "green-template"
  image_id               = data.aws_ami.ubuntu_image.id
  instance_type          = "t2.small"
  key_name               = "talent-academy-ec2"
  vpc_security_group_ids = [aws_security_group.app_server.id]

  #user_data = filebase64("${path.module}/user-data.sh")
  user_data = base64encode(templatefile("${path.module}/user-data.sh.tpl", {
    version = "Green Website",
    color   = "green"
  }))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "green-server"
    }
  }
}

resource "aws_autoscaling_group" "green_asg" {
  #availability_zones = [data.aws_subnet.private2_subnet.availability_zone_id]
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = [data.aws_subnet.private2_subnet.id]

  launch_template {
    id      = aws_launch_template.green_template.id
    version = "$Latest"
  }
}




