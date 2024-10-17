output "db_instance_fqdn" {
  value = aws_lightsail_database.test.master_endpoint_address
}
output "db_instance_port" {
  value = aws_lightsail_database.test.master_endpoint_port
}