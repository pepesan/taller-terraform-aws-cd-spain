# Usa la imagen base de Node.js
FROM node:22

# Crea el directorio de la aplicación en el contenedor
WORKDIR /usr/src/app

# Copia los archivos de la aplicación al contenedor
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el código de la aplicación
COPY . .

# Establece las variables de entorno para la base de datos
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_NAME=${DB_NAME}

# Exponemos el puerto que utilizará el servidor
EXPOSE 3000

# Comando para correr la aplicación
CMD [ "npm", "start" ]
