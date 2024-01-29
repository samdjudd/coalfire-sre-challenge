module "vpc" {
  source = "../vpc"
}

module "subnets" {
  source = "../subnets"
  vpc_id = module.vpc.vpc_id
}


module "ec2" {
  source = "../ec2"
  public_subnet_ids = module.subnets.public_subnet_ids
  wp_subnet_ids = module.subnets.wp_subnet_ids
}

resource "aws_lb" "proxy" {
  name               = "lb-web-proxy"
  internal           = true
  load_balancer_type = "application"
  subnets            = module.subnets.public_subnet_ids
  enable_deletion_protection = false
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.proxy.id
  port              = 443
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instance.arn
  }
#   ssl_policy = "ELBSecurityPolicy-2016-08"
#   certificate_arn = "arn:aws:acm:us-west-1:975049900959:certificate/47627c36-6ef8-488a-aa9c-afc1ed72aa16"
}

resource "aws_lb_target_group" "instance" {
  name        = "wp-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "instance"

  health_check {
    path     = "/"
    protocol = "HTTP"
    port     = 80
  }
}


resource "aws_lb_target_group_attachment" "target" {
  target_group_arn =  aws_lb_target_group.instance.arn
  target_id        =  element(module.ec2.wpserver_ids, 0)
}