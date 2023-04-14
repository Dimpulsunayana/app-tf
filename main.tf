resource "aws_security_group" "alb" {
  name        = "${var.env}-${var.component}-alb_segrp"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.main_vpc

  ingress {
    description      = "alb"
    from_port        = var.app_port
    to_port          = var.app_port
    protocol         = "tcp"
    cidr_blocks      = var.allow_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags       = merge(
    local.common_tags,
    { Name = "${var.env}-alb-${var.component}-segrp" }
  )
}


