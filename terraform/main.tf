resource "aws_key_pair" "math-keypair" {
  key_name   = "math-key"
  public_key = file("${var.key_path}")
}

resource "aws_instance" "math_server" {
  ami                    = var.ami_id
  instance_type          = var.type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.math_sg.id]
  key_name               = aws_key_pair.math-keypair.key_name
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }
  tags = {
    Name = "math-server"
  }
}


resource "aws_ebs_volume" "math-external-volume" {
  availability_zone = aws_instance.math_server.availability_zone
  size              = var.external_volume_size
  type              = var.external_volume_type
  tags = {
    Name = "swvl-test-external-vol"
  }
}

resource "aws_volume_attachment" "math-external-volume-attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.math-external-volume.id
  instance_id = aws_instance.math_server.id
}