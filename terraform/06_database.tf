resource "random_string" "snapshot_name" {
  length  = 8
  special = false
}

resource "aws_lightsail_database" "test" {
  relational_database_name  = var.db_name
  availability_zone         = "eu-west-3a"
  master_database_name      = var.db_name
  master_password           = var.db_password
  master_username           = var.db_user
  # aws lightsail get-relational-database-blueprints
  blueprint_id              = "mysql_8_0"
  # aws lightsail get-relational-database-bundles
  bundle_id                 = "micro_2_0"
  publicly_accessible       = true
  # Esto nos sirve para el taller pero en producción no deberíamos ponerlo
  skip_final_snapshot = true
  # en producción deberíamos crear una snapshot antes de borrar la bbdd
  final_snapshot_name = "${var.db_name}-snap-${random_string.snapshot_name.result}"
}