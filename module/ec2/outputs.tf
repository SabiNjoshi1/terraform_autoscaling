output "security_groups_id" {
  value = aws_security_group.webserver-sg.id
}

output "public_webserver_id_1" {
  value = aws_instance.webserver1.id
}

output "public_webserver_id_2" {
  value = aws_instance.webserver2.id
}

