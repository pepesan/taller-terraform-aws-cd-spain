

# Crea un registro CNAME en Route 53 para apuntar al endpoint del servicio de front
resource "aws_route53_record" "db_record_front" {
  zone_id = data.aws_route53_zone.my_zone.zone_id
  name    = "www-${var.project_name}.buildconfes.click"
  type    = "CNAME"
  ttl     = 60

  records = [aws_lightsail_container_service.frontend_service.url]  # Endpoint de la instancia BBDD
}