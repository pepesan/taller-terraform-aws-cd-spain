resource "aws_lightsail_certificate" "back_cert" {
  name         = "back-domain-cert-${var.project_name}"
  domain_name  = "back-${var.project_name}.buildconfes.click"
  subject_alternative_names = []
  depends_on = [aws_route53_record.db_record_back]
}
resource "aws_lightsail_certificate" "front_cert" {
  name         = "front-domain-cert-${var.project_name}"
  domain_name  = "www-${var.project_name}.buildconfes.click"
  subject_alternative_names = []
  depends_on = [aws_route53_record.db_record_front]
}

