
-- CREATE AND USE DATABASE
CREATE DATABASE IF NOT EXISTS abogados;
USE abogados;

-- CREATE TABLES
CREATE TABLE IF NOT EXISTS procuradores(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255) NOT NULL,
    dni VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigo_postal INT (5),
    fecha_nacimiento DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS clientes(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255) NOT NULL,
    dni VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigo_postal INT (5),
    fecha_nacimiento DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS asuntos(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    id_cliente BIGINT NOT NULL,
    id_procurador BIGINT NOT NULL,
    fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fecha_finalizacion TIMESTAMP,
    estado ENUM('TRAMITE', 'ARCHIVADO', 'FINALIZADO'),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_procurador) REFERENCES procuradores (id)
);

CREATE TABLE IF NOT EXISTS procuradores_asuntos(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    id_procurador BIGINT,
    id_asunto BIGINT,
    FOREIGN KEY (id_procurador) REFERENCES procuradores (id),
    FOREIGN KEY (id_asunto) REFERENCES asuntos (id)
);

-- DATA INSERT IN procuradores
INSERT INTO procuradores (nombre, apellido1, apellido2, dni, direccion, codigo_postal, fecha_nacimiento)
VALUES 
('Elena', 'Garcia', 'Manchado', '56845971M', 'Calle de los peligros, 16', 08770, '1989-02-01'),
('Marcos', 'Pozuelo', 'Fernandez', '20564782N', 'Calle Antoni Fangos, 58', 03887, '1998-11-25'),
('Penelope', 'Cruz', 'Rodriguez', '30698745J', 'Avenida Carmen de Mairena, 56', 30998, '1970-06-08'),
('Ariadna', 'Giribet', 'Morillo', '53694857H', 'Calle falanquera, 389 BIS', 65889, '2001-03-08'),
('Jonathan', 'Joe', 'Mohand', '21045628U', 'Avenida Rosario Flores, 593', 08779, '1970-08-09');

-- DATA INSERT IN clientes
INSERT INTO clientes (nombre, apellido1, apellido2, dni, direccion, codigo_postal, fecha_nacimiento)
VALUES 
('Fernando', 'Fernardo', 'Martinez', '59874564I', 'Calle Isidoro Antillon, 34', 25889, '2001-01-03'),
('Manolo', 'Escobar', 'Martillo', '25896475V', 'Calle de los liantes, 33', 89774, '1998-12-09'),
('Mauricio', 'Colmenero', 'Asepe', '21447562K', 'Calle de alcala, 45', 33694, '1972-05-20'),
('Joan', 'Giribet', 'Morillo', '56987441O', 'Calle Roman rodrigo, 689', 59774, '1998-10-15'),
('Pepe', 'Pepito', 'Pelano', '56845963A', 'Calle Floreros de carmin, 82', 63559, '1985-11-17');

-- DATA INSERT IN asuntos
INSERT INTO asuntos (id_cliente, id_procurador, estado)
VALUES
(1, 2, 'TRAMITE'),
(2, 2, 'ARCHIVADO'),
(3, 1, 'FINALIZADO'),
(4, 1, 'ARCHIVADO'),
(5, 3, 'TRAMITE'),
(3, 4, 'TRAMITE'),
(2, 5, 'FINALIZADO');

-- DATA INSERT IN procuradores_asuntos
INSERT INTO procuradores_asuntos (id_asunto, id_procurador)
VALUES
(1, 2),
(2, 2),
(3, 1),
(4, 1),
(5, 3),
(6, 4),
(7, 5);