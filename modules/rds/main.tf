# module "vpc" {
#   source = "../vpc"
# }

# module "subnets" {
#   source = "../subnets"
#   vpc_id = module.vpc.vpc_id
# }

# resource "aws_db_instance" "default" {
#   identifier             = "rds1"
#   allocated_storage      = 10
#   db_name                = "mydb"
#   engine                 = "mysql"
#   engine_version         = "5.7"
#   instance_class         = "db.t3.micro"
#   username               = "admin"
#   password               = "password"
#   publicly_accessible    = false
#   db_subnet_group_name   = var.subnet_group
#   availability_zone      = "us-west-1c"
#   skip_final_snapshot    = true

#   tags = {
#     Name = "RDS1"
#   }
# }
