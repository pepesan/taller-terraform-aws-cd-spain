// Importamos los módulos necesarios
const express = require('express');
const mysql = require('mysql2');

// Creamos una instancia de Express
const app = express();

// Obtenemos las variables de entorno
const dbHost = process.env.DB_HOST;
const dbPort = process.env.DB_PORT;
const dbUser = process.env.DB_USER;
const dbPassword = process.env.DB_PASSWORD;
const dbName = process.env.DB_NAME;

// Creamos la conexión a la base de datos MySQL
const connection = mysql.createConnection({
  host: dbHost,
  port: dbPort,
  user: dbUser,
  password: dbPassword,
  database: dbName
});

// Conectamos a la base de datos
connection.connect(error => {
  if (error) {
    console.error('Error connecting to the database:', error);
    process.exit(1);
  } else {
    console.log('Connected to the MySQL database!');
  }
});

// Definimos una ruta básica para verificar que el backend funciona
app.get('/', (req, res) => {
  res.send('Backend is working and connected to the database!');
});

// Definimos una ruta para obtener datos de la base de datos
app.get('/users', (req, res) => {
  const query = 'SELECT * FROM users';  // Asumiendo que hay una tabla `users`
  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error fetching data from the database:', error);
      res.status(500).send('Error fetching data from the database');
    } else {
      res.json(results);
    }
  });
});

// Definimos una ruta para verificar la salud del contenedor
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Iniciamos el servidor en el puerto 3000
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Backend is running on port ${port}`);
});

