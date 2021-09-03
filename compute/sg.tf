resource "aws_security_group" "webtraffic" {
  name = var.allowHTTPS

  ingress {
    from_port   = var.HTTPS
    to_port     = var.HTTPS
    protocol    = var.protocol
    cidr_blocks = [var.sg_cidr]
  }

  egress {
    from_port   = var.HTTPS
    to_port     = var.HTTPS
    protocol    = var.protocol
    cidr_blocks = [var.sg_cidr]
  }
}

resource "aws_security_group" "ssh-allowed" {
   vpc_id = var.vpc_id_var_in_compute_module 

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = [var.sg_cidr]
  }
  ingress {
    from_port = var.SSH
    to_port   = var.SSH
    protocol  = var.protocol
    // This means, all ip address are allowed to ssh ! 
    // Do not do it in the production. 
    // Put your office or home address in it!
    cidr_blocks = [var.myIP]
  }
  //If you do not add this rule, you can not reach the NGIX  
  ingress {
    from_port   = var.HTTP
    to_port     = var.HTTP
    protocol    = var.protocol
    cidr_blocks = [var.sg_cidr]
  }
  tags = var.mySG_tags
}