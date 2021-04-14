-- CREACION BASE DE DATOS zoos
CREATE DATABASE IF NOT EXISTS zoos;
USE zoos;

-- CREAR TABLA zoo
CREATE TABLE IF NOT EXISTS zoo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL,
    tamaño INT NOT NULL,
    presupuesto_anual INT NOT NULL
);

-- CREAR TABLA especie_animal
CREATE TABLE IF NOT EXISTS especie_animal (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre_vulgar VARCHAR(255) NOT NULL,
    nombre_cientifico VARCHAR(255) NOT NULL,
    familia VARCHAR(255) NOT NULL,
    peligro_extincion TINYINT NOT NULL
);

-- CREAR TABLA animal
CREATE TABLE IF NOT EXISTS animal (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    num_id_unico INT NOT NULL,
    especie BIGINT NOT NULL,
    sexo ENUM('F','M') NOT NULL,
    ano_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(255) NOT NULL,
    continente VARCHAR(255) NOT NULL,
    zoo BIGINT NOT NULL,
    FOREIGN KEY (zoo) REFERENCES zoo (id),
    FOREIGN KEY (especie) REFERENCES especie_animal (id)
);

-- INSERT TABLA zoo
INSERT INTO zoo (nombre, ciudad, pais, tamaño, presupuesto_anual)
VALUES 
('animal city', 'New York', 'UUEE', 3056, 28000),
('zoo de barcelona', 'Barcelona', 'espana', 14000, 70000),
('Zoológico de Artis', 'Artis', 'Holanda', 500000, 28000000),
('Zoológico de Londres', 'Londres', 'Reino Unido', 600000, 6320000),
('Zoológico de Berlín', 'Berlín', 'Reino Unido', 85622, 962426684),
('Zoológico de Bronx', 'Bronx', 'NuwYork', 60000, 1200000);

-- INSERT TABLA especie_animal
INSERT INTO especie_animal (nombre_vulgar, nombre_cientifico, familia, peligro_extincion)
VALUES
('Panda gigante', 'Ailuropoda melanoleuca', 'Ursidae', 0),
('Oso de anteojos', 'Tremarctos ornatus', 'Ursidae', 0),
('Cabra Alpina Francesa', 'Cabra alpina', 'Bovidae', 1),
('Cabra Alpina Española', 'Cabra alpina', 'Bovidae', 1),
('Aligator', 'Cocodrilia Aligatoridae', 'Cocodrillia', 1),
('Chimpance', 'micus', 'macus', 0),
('Arce Irlandes', 'Arcius Irlandisius', 'Ckmdsnfoeue', 1),
('Mono Africano', 'Micus', 'Monus Macus', 0),
('Mono Culo Rojo', 'Micus', 'Micus Rojus', 1),
('Piton', 'Serpentius', 'Serpientus Pyton', 0),
('Elefante Africano', 'Elephantidae Proboscidea', 'Elephantidae ', 1);

-- INSERT TABLA animal
INSERT INTO animal (num_id_unico, especie, sexo, ano_nacimiento, pais_origen, continente, zoo)
VALUES
(23513215, 1, 'M', '2020-02-09', 'Xina', 'Asia', 1),
(65435168, 3, 'F', '1998-07-01', 'Asturias','Europa', 1),
(6546843, 9, 'M', '2011-02-08', 'Selva del Congo', 'Calasmxpaksm', 1),
(316843, 4, 'M', '1978-05-23', 'Pantano De las losanas', 'Valencia', 1);