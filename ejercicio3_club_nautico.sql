-- CREACION DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS club_nautico;
USE club_nautico;

-- CREACION TABLA socio
CREATE TABLE IF NOT EXISTS socio (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255) NOT NULL,
    dni VARCHAR(9) UNIQUE NOT NULL ,
    email VARCHAR(255) UNIQUE NOT NULL ,
    codigo_postal VARCHAR(5) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(90) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    telefono INT NOT NULL,
    activo BOOL NOT NULL
);

-- CREACION TABLA patron
CREATE TABLE IF NOT EXISTS patron(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido1 VARCHAR(255) NOT NULL,
    apellido2 VARCHAR(255) NOT NULL,
    dni VARCHAR(9) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono INT NOT NULL
);

-- CREACION TABLA barco
CREATE TABLE IF NOT EXISTS barco(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    num_matricula VARCHAR(18) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    numero_amarre INT NOT NULL,
    cuota FLOAT NOT NULL,
    socio BIGINT NOT NULL,
    patron BIGINT NOT NULL,

    FOREIGN KEY (socio) REFERENCES socio (id),
    FOREIGN KEY (patron) REFERENCES patron (id)
);

-- CREACION TABLA salidas
CREATE TABLE IF NOT EXISTS salida(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    barco BIGINT NOT NULL,
    patron BIGINT NOT NULL,
    fecha DATE NOT NULL,
    destino VARCHAR(255) NOT NULL,

    FOREIGN KEY (barco) REFERENCES barco (id),
    FOREIGN KEY (patron) REFERENCES patron (id)
);

-- TRANSACCIONES
BEGIN;
-- INSERTS EN LA TABLA socio
INSERT INTO socio (nombre, apellido1, apellido2, dni, email, codigo_postal, direccion, ciudad, pais, telefono, activo)
VALUES
('Manolo', 'Garcia', 'Bronchales', '21041746H', 'manolo.garcia@gmail.com', 59987, 'Avenida de los cangrejos', 'Barcelona', 'España', 636478266, 1),
('Maria', 'Teresa', 'De Calcuta', '56954782L', 'mria.teresa@gmail.com', 56512, 'Calle de alcala', 'Madrid', 'España', 658941123, 1),
('Jhon', 'Doe', 'Jhonson', '89641584Y', 'jhon.doe@gmail.com', 51325, 'Avenida los morrones', 'Madrid', 'España', 658941123, 1),
('Margaret', 'Willer', 'Pantien', '96541292T', 'margaret.willer@gmail.com', 51325, 'Rue des pigeons', 'Tolouse', 'Francia', 611522158, 1),
('Fernandito', 'Costa', 'Yatusabeh', '89542624L', 'fernandito.costa@gmail.com', 51558, 'Calle Cristo segundo', 'Georgia', 'UUEE', 968451688, 0),
('Melanie', 'Fernandez', 'Rodriguez', '20154763B', 'melanie.fenandez@gmail.com', 54114, 'Calle de los antonios', 'Sant Sadurní', 'España', 636658945, 1);


-- INSERTS EN LA TABLA patron
INSERT INTO patron (nombre, apellido1, apellido2, dni, email, telefono)
VALUES
('Mauricio', 'Colmenero', 'Martinez', '21659874T', 'mauricio.colmenero@gmail.com', 636541255),
('Nia', 'Targare', 'Chokov', '67883263E', 'nia.targare@gmail.com', 589471566),
('Pepe', 'Hifking', 'Palnet', '69471532D', 'pepe.hifking@gmail.com', 636478922),
('Ganer', 'Patrick', 'Junior', '54123698K', 'ganer.patrick@gmail.com', 698745699),
('Albert', 'Jhonson', 'Rodriguez', '87569412D', 'albert.jhonson@gmail.com', 549853622),
('Jordi', 'Evole', 'Inventado', '65471567S', 'jordi.evole@gmail.com', 635894566);
SAVEPOINT;

-- INSERTS EN LA TABLA barco
INSERT INTO barco (num_matricula, nombre, numero_amarre, cuota, socio, patron)
VALUES
('IIUSDH38402', 'Liberty', 56, 163, 13, 2),
('ODJFJ387483', 'Remolquer', 1, 2200, 15, 3),
('SDJSJDE2321', 'Cabrio Fantasy', 47, 3052, 16, 4),
('HBDFAB23432', 'Candela Surker', 20, 250, 18, 1),
('DJFSDJNF869', 'Ganer Rander', 246, 74432, 17, 3),
('SFBJS347238', 'Furius Rider', 745, 451258, 14, 5);

INSERT INTO salida(barco, patron, fecha, destino)
VALUES
(13, 2, '2001-06-12', 'VALENCIA'),
(18, 2, '2006-09-17', 'PALMA DE MALLORCA'),
(13, 3, '2007-12-25', 'MENORCA'),
(14, 2, '2006-09-17', 'BARCELONA');

COMMIT;