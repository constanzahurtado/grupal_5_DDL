/* Parte 1: Crear entorno de trabajo
   Crear una base de datos */
CREATE SCHEMA bd_grupal_5 DEFAULT CHARACTER SET utf8 ;

/* Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.*/
CREATE USER 'user_grupal_5@localhost' IDENTIFIED BY '1234';
GRANT ALL ON bd_grupal_5_ddl.* TO 'user_grupal_5@localhost';

/*
Parte 2: Crear dos tablas.
- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria 
  (por defecto UTC-3), género y teléfono de contacto).*/
  
  CREATE TABLE usuarios (
  id_usuario TINYINT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  contrasena VARCHAR(15) NULL,
  zona_horaria VARCHAR(15) NULL DEFAULT 'UTC-3',
  genero VARCHAR(15) NULL,
  telefono VARCHAR(12) NOT NULL,
  PRIMARY KEY (telefono)
  );
  
  
  /*La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a 
  la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).*/
  
  CREATE TABLE informacion (
  id_ingreso TINYINT NOT NULL,
  id_usuario TINYINT NOT NULL,
  fecha_hora_ingreso DATETIME NULL,
  PRIMARY KEY (id_ingreso));
  
  /*Parte 3: Modificación de la tabla
Modifique el UTC por defecto.Desde UTC-3 a UTC-2.*/

ALTER TABLE usuarios MODIFY COLUMN zona_horaria VARCHAR(15) NULL DEFAULT 'UTC-2';
INSERT INTO usuarios (id_usuario, nombre, apellido, contrasena, genero, telefono) VALUES ('10', 'pablo', 'escobar', '1234', 'masculino', '85632548');
/*SI SE INSERTA ESTE NUEVO USUARIO, SE CAMBIA AUTOMATICAMENTE EL DEFAULT A UTC-2*/

/*Parte 4: Creación de registros.
- Para cada tabla crea 8 registros.*/
INSERT INTO usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono) 
VALUES (1, 'pablo', 'escobar', '1234', 'masculino', '85636547'),
(2, 'luis', 'perez', '1234', 'masculino', '84520236'),
(3, 'pedro', 'gonzalez', '1234', 'masculino', '85635475'),
(4, 'juan', 'cepeda', '1234', 'masculino', '95632587'),
(5, 'daniel', 'moron', '1234', 'masculino', '85478520'),
(6, 'tamara', 'leon', '1234', 'femenino', '98653201'),
(7, 'williams', 'maldonado', '1234', 'masculino', '85421536'),
(8, 'marcela', 'sandoval', '1234', 'femenino', '78451290');


INSERT INTO informacion(id_ingreso, id_usuario, fecha_hora_ingreso)
VALUES(1,1,'2021-10-11 09:23:15'),(2,2,'2021-10-17 10:23:15'),
(3,3,'2021-10-11 10:23:15'),(4,4,'2021-10-12 10:23:15'),
(5,5,'2021-10-13 10:23:15'),(6,6,'2021-10-14 10:23:15'),
(7,7,'2021-10-15 10:23:15'),(8,8,'2021-10-16 10:23:15');

INSERT INTO contactos(id_contacto, id_usuario, telefono, correo)
VALUES(1,1,'85636547','correo1@gmail.com'),(2,2,'84520236','correo2@gmail.com'),
(3,3,'85635475','correo3@gmail.com'),(4,4,'95632587','correo4@gmail.com'),
(5,5,'85478520','correo5@gmail.com'),(6,6,'98653201','correo6@gmail.com'),
(7,7,'85421536','correo7@gmail.com'),(8,8,'78451290','correo8@gmail.com');


/*Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?*/
/*

VARCHAR: fue implementado para los atributos NOMBRE, APELLIDO, CONTRASEÑA, ZONA_HORARIA, GENERO,TELEFONO
y asignamos una longitud correspondiente a los datos solicitados. Fue asignado porque son datos de tipo string,
y VARCHAR asegura que el espacio utilizado sea acorde a la longitud del texto, es decir, si la longitud asignada es 
de 15 caracteres, y se ocupan 10, VARCHAR indica que el espacio utilizado se ajuste a esos 10 caracteres.

TINYINT: fue implementado para los atributos id_usuario, id_informacion, ya que nuestra base de datos está
pensada para el ingreso de una cantidad limitada de registros (8 registros), ocupando menos memoria si utilizaramos INT.

DATETIME: fue implementado para el campo fecha_hora_ingreso porque se nos solicitaba informacion sobre hora y fecha
y este tipo de dato nos garantiza esta información.
*/

/*Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).*/

 CREATE TABLE contactos (
  id_contacto TINYINT NOT NULL,
  id_usuario TINYINT NOT NULL,
  telefono VARCHAR(12) NULL,
  correo VARCHAR(30) NULL,
  PRIMARY KEY (id_contacto),
  FOREIGN KEY (telefono) REFERENCES usuarios (telefono));

/*Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
El ejercicio debe ser subido a github y al Nodo Virtual.*/
/*COLUMNA MODIFICADA EN LOS EJERCICIOS ANTERIORES*/