DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

CREATE TABLE proveedor (
  nif VARCHAR(9) PRIMARY KEY,
  direccion VARCHAR(100) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  telefono INT
);

CREATE TABLE clientes (
  email VARCHAR(30) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  registro DATE,
  recomendado VARCHAR(20)
);
CREATE TABLE marca (
  nombre VARCHAR(30) PRIMARY KEY,
  nif VARCHAR(9),
  FOREIGN KEY (nif) REFERENCES proveedor(nif)
);

CREATE TABLE gafas (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(30),
  email_C VARCHAR(30),
  graduacionD INT NOT NULL,
  graduacionI INT NOT NULL,
  precio DOUBLE NOT NULL,
  tipoMontura ENUM ("flotante","pasta","metalica"),
  colorVd VARCHAR(20),
  colorVi VARCHAR(20),
  empleado INT,
  FOREIGN KEY (email_C) REFERENCES clientes(email),
  FOREIGN KEY (marca) REFERENCES marca(nombre)
);

