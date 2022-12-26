DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE tienda (
  email VARCHAR(30) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  registro DATE
);
CREATE TABLE trabajador (
  nif INT UNSIGNED PRIMARY KEY,
  direccion VARCHAR(100) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  puesto ENUM("C","R"),
  telefono INT,
  email_tienda VARCHAR(30),
  FOREIGN KEY (email_tienda) REFERENCES tienda(email)
);

CREATE TABLE cliente (
  email VARCHAR(30) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  registro DATE
);
CREATE TABLE pizza_cat (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  descripcion VARCHAR(100)
);
CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  categoria ENUM("bebida","hamburguesa","pizza"),
  cat_Pizza INT UNSIGNED,
  descripcion VARCHAR(100),
  imagen BLOB,
  precio INT,
  FOREIGN KEY (cat_Pizza) REFERENCES pizza_cat(codigo)
);
CREATE TABLE comanda (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  hora DATETIME,
  email_C VARCHAR(30),
  email_tienda VARCHAR(30),
  cantidad_p INT NOT NULL,
  precio DOUBLE NOT NULL,
  reparto ENUM("SI","NO"),
  FOREIGN KEY (email_C) REFERENCES cliente(email),
  FOREIGN KEY (email_tienda) REFERENCES tienda(email)
);

CREATE TABLE comanda_detalle (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cod_com INT UNSIGNED,
  cod_prod INT UNSIGNED,
  hora DATETIME,
  precio DOUBLE NOT NULL,
  FOREIGN KEY (cod_com) REFERENCES comanda(codigo),
  FOREIGN KEY (cod_prod) REFERENCES producto(codigo)
);

