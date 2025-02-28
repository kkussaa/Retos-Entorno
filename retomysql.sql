DROP DATABASE IF EXISTS GestionEventosSostenibles;
CREATE DATABASE GestionEventosSostenibles;
USE GestionEventosSostenibles;

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    correo VARCHAR(50) UNIQUE NOT NULL,
    contraseña VARCHAR(15) NOT NULL
);

CREATE TABLE Organizadores (
    id_organizador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    contacto VARCHAR(25) NOT NULL
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    fecha DATE NOT NULL,
    duracion INT NOT NULL,
    ubicacion VARCHAR(25) NOT NULL,
    id_categoria INT NOT NULL,
    id_organizador INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_organizador) REFERENCES Organizadores(id_organizador)
);

CREATE TABLE Inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_evento INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento)
);

CREATE TABLE Ubicaciones (
    id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('Online','Presencial') NOT NULL,
    direccion VARCHAR(25) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

#insert Tabla usuarios
insert Usuarios values(1,'Marcos','marcosvallezpardo217@gmail.com','12345');
insert Usuarios values(2,'Juanito','juanitoelmenol@gmail.com','123');

#insert Tabla Organizadores
insert Organizadores values(1,'Fourvenues','612345467');
insert Organizadores values(2,'Villazarcillo','infovillazarcillo@hotmail.com');

#insert Tabla Categorias
insert Categorias values(1,'Informatica');
insert Categorias values(2,'Fútbol');

#insert Tabla Eventos
insert Eventos values(1,'Partido King League','27/02/2025',3,'Ciudad Real',2,2);
insert Eventos values(2,'Ataque al Instituto Maestre','28/02/2025',10,'Ciudad Real',1,1);

#insert Tabla Inscripciones
insert Inscripciones values(1,1,1,'27/02/2025');
insert Inscripciones values(2,2,2,'25/02/2025');

#insert Tabla Ubicaciones
insert Ubicaciones values(1,'Online','Maestre de Calatrava',1);
insert Ubicaciones values(2,'Presencial','Huertezuelas',2);
