# Consultar la zona hospedada por su nombre de dominio
data "aws_route53_zone" "my_zone" {
  name = "buildconfes.click"
}
# Crea un registro CNAME en Route 53 para apuntar al endpoint de la instancia RDS
resource "aws_route53_record" "db_record" {
  zone_id = data.aws_route53_zone.my_zone.zone_id
  name    = "db-${var.project_name}.buildconfes.click"
  type    = "CNAME"
  ttl     = 60

  records = [aws_lightsail_database.test.master_endpoint_address]  # Endpoint de la instancia BBDD
}