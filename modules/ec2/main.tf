module "vpc" {
  source = "../vpc"
}

module "subnets" {
  source = "../subnets"
  vpc_id = module.vpc.vpc_id
}


resource "aws_instance" "bastion1" {
  ami                    = "ami-074792f462339b61d"
  instance_type          = "t3a.medium"
  subnet_id              = element(var.public_subnet_ids, 0) 
  associate_public_ip_address = true
  key_name      = "sam-key"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 50
  }

  tags = {
    Name     = "bastion1"
    Hostname = "bastion1"
  }
}

resource "aws_instance" "wp_server_1" {
  ami           = "ami-0fa0ed170a59f4917"
  instance_type = "t3a.micro"
  subnet_id     = element(var.wp_subnet_ids, 0)
  associate_public_ip_address = false
  key_name = "sam-key"

  root_block_device {
    volume_size           = 20
  }

  tags = {
    Name     = "wp_server_1"
    Hostname = "wp_server_1"
  }
}

resource "aws_instance" "wp_server_2" {
  ami           = "ami-0fa0ed170a59f4917"
  instance_type = "t3a.micro"
  subnet_id     = element(var.wp_subnet_ids, 1)
  key_name      = "sam-key"

  root_block_device {
    volume_size           = 20
  }

  tags = {
    Name     = "wp_server_2"
    Hostname = "wp_server_2"
  }

}
