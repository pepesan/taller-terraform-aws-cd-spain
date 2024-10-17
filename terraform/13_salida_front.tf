


output "service_instance_fqdn_front" {
  value = aws_lightsail_container_service.frontend_service.url
}
output "service_instance_dns_front" {
  value = aws_route53_record.db_record_front.name
}
output "container_demo_instance_endpoints_front" {
  value = aws_lightsail_container_service_deployment_version.example_front.public_endpoint
}
