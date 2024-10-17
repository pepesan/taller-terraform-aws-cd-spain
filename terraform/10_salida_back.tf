output "service_instance_fqdn_back" {
  value = aws_lightsail_container_service.backend_service.url
}
output "service_instance_dns_back" {
  value = aws_route53_record.db_record_back.name
}
output "container_demo_instance_endpoints_back" {
  value = aws_lightsail_container_service_deployment_version.example.public_endpoint
}