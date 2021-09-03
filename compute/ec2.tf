resource "aws_instance" "db" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]


  subnet_id = var.pubsub_id_var_in_compute_module

  tags = {
    "Name" = "db_server"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]

    subnet_id = var.pubsub_id_var_in_compute_module

  tags          = var.webserver_tags
  depends_on    = [aws_instance.db]
}


resource "aws_instance" "ec2" {
  ami           = var.ami

    subnet_id = var.pubsub_id_var_in_compute_module

  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
  instance_type = var.instance_type
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}


resource "aws_instance" "ec2_02" {
  ami             = var.ami
  instance_type   = var.instance_type

   subnet_id = var.pubsub_id_var_in_compute_module

  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
}

resource "aws_instance" "web_02" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = var.ec2_count

    subnet_id = var.pubsub_id_var_in_compute_module

  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
  tags          = var.webserver_tags
}

