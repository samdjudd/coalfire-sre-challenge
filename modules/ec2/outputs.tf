output "wpserver_ids" {
  value = [aws_instance.wp_server_1.id, aws_instance.wp_server_2.id]
}