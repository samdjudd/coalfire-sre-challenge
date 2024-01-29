output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "wp_subnet_ids" {
  value = [aws_subnet.wp_subnet_1.id, aws_subnet.wp_subnet_2.id]
}

# output "subnet_group" {
#   value = aws_db_subnet_group.db_subnet_group.id
# }