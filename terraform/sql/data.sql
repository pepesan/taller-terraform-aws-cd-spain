-- Usuario Admin
INSERT INTO users (nombre_usuario, correo_electronico, contrasena, nombre_completo, rol)
VALUES ('admin_user', 'admin@example.com', 'adminpassword', 'Admin User', 'admin');

-- Usuario Regular
INSERT INTO users (nombre_usuario, correo_electronico, contrasena, nombre_completo, rol)
VALUES ('regular_user', 'user@example.com', 'userpassword', 'Regular User', 'usuario');
