variable "db_name" {
  description = "El nombre de la base de datos"
  type        = string
  default     = "mydatabase"
}

variable "db_user" {
  description = "El nombre de usuario para la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "La contraseña para la base de datos"
  type        = string
  sensitive   = true
  default     = "mypassword"
}