resource "aws_lightsail_container_service" "frontend_service" {
  name = "front-service-${var.project_name}"
  power        = "micro"
  scale        = 1  # Número de contenedores
  tags = {
    app = "front"
    project = var.project_name
  }
  # public_domain_names {
  #   certificate {
  #     certificate_name = aws_lightsail_certificate.front_cert.name # Use the certificate name if created in Terraform
  #     domain_names = [
  #       "www-${var.project_name}.buildconfes.click",  # Optional SAN for www subdomain
  #     ]
  #   }
  # }
  is_disabled = false
  depends_on = [aws_lightsail_container_service_deployment_version.example]
}

resource "aws_lightsail_container_service_deployment_version" "example_front" {
  container {
    container_name = "hello-world"
    image          = "pepesan/awscds_frontend:latest"

    command = []

    environment = {
      BACK_URL= aws_lightsail_container_service.backend_service.url
    }

    ports = {
      80 = "HTTP"
    }
  }

  public_endpoint {
    container_name = "hello-world"
    container_port = 80
    health_check {
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout_seconds     = 2
      interval_seconds    = 5
      path                = "/"
      success_codes       = "200-499"
    }
  }
  service_name = aws_lightsail_container_service.frontend_service.name
}