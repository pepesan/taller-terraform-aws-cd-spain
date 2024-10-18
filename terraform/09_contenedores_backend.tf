resource "aws_lightsail_container_service" "backend_service" {
  name = "backend-service-${var.project_name}"
  power        = "micro"
  scale        = 1  # Número de contenedores
  tags = {
    app = "node"
    project = var.project_name
  }
  # public_domain_names {
  #   certificate {
  #     certificate_name = aws_lightsail_certificate.back_cert.name  # Use the certificate name if created in Terraform
  #     domain_names = [
  #       "back-${var.project_name}.buildconfes.click",  # Optional SAN for www subdomain
  #     ]
  #   }
  # }
  is_disabled = false
  depends_on = [aws_lightsail_database.test]
}

resource "aws_lightsail_container_service_deployment_version" "example" {
  container {
    container_name = "hello-back"
    image          = "pepesan/awscds_backend:latest"

    command = []

    environment = {
      MY_ENVIRONMENT_VARIABLE = "my_value"
      DB_HOST                 = aws_lightsail_database.test.master_endpoint_address
      DB_PORT                 = "3306"
      DB_USER                 = var.db_user
      DB_PASSWORD             = var.db_password
      DB_NAME                 = var.db_name
    }

    ports = {
      3000 = "HTTP"
    }
  }

  public_endpoint {
    container_name = "hello-back"
    container_port = 3000

    health_check {
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout_seconds     = 2
      interval_seconds    = 5
      path                = "/"
      success_codes       = "200-499"
    }
  }

  service_name = aws_lightsail_container_service.backend_service.name
}