-- CREACION DE LA BASE DE DATOS video_club
CREATE DATABASE IF NOT EXISTS video_club;
USE video_club;

-- CREACION TABLA director
CREATE TABLE IF NOT EXISTS directores(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);

-- CREACION TABLA actor
CREATE TABLE IF NOT EXISTS actores(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);

-- CREACION DE LA TABLA DE generos
CREATE TABLE IF NOT EXISTS generos(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(60) NOT NULL
);

-- CREACION DE LA TABLA socio
CREATE TABLE IF NOT EXISTS socios (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    director_fav BIGINT NOT NULL,
    actor_fav BIGINT NOT NULL,
    genero_fav BIGINT NOT NULL,
    codigo_postal INT (5),
    telefono INT(18),
    activo BOOLEAN NOT NULL,

    FOREIGN KEY (director_fav) REFERENCES directores(id),
    FOREIGN KEY (actor_fav) REFERENCES actores(id),
    FOREIGN KEY (genero_fav) REFERENCES generos(id)
);

-- CREACION DE LA TABLA pelicula
CREATE TABLE IF NOT EXISTS peliculas (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(60),
    genero BIGINT NOT NULL,
    director BIGINT NOT NULL,

    FOREIGN KEY (genero) REFERENCES generos (id),
    FOREIGN KEY (director) REFERENCES directores (id)
);

-- CREACION TABLA peliculas_actores
CREATE TABLE IF NOT EXISTS peliculas_actores (
    id_pelicula BIGINT NOT NULL,
    id_actor BIGINT NOT NULL,

    FOREIGN KEY (id_pelicula) REFERENCES peliculas (id),
    FOREIGN KEY (id_actor) REFERENCES actores (id)
);

-- CREACION TABLA pelicula_cinta
CREATE TABLE IF NOT EXISTS pelicula_cintas(
    id_cinta BIGINT PRIMARY KEY AUTO_INCREMENT,
    id_pelicula BIGINT NOT NULL,

    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

-- CREACION TABLA lista_espera
CREATE TABLE IF NOT EXISTS lista_espera(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    pelicula BIGINT NOT NULL,
    socio BIGINT NOT NULL,

    FOREIGN KEY (pelicula) REFERENCES peliculas (id),
    FOREIGN KEY (socio) REFERENCES socios (id)
);

-- CREACION TABLA prestamo
CREATE TABLE IF NOT EXISTS prestamos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    socio BIGINT NOT NULL,
    pelicula BIGINT NOT NULL,
    num_cinta BIGINT NOT NULL,
    fecha DATE NOT NULL,
    devuelta BOOLEAN NOT NULL DEFAULT 0,

    FOREIGN KEY (socio) REFERENCES socios(id),
    FOREIGN KEY (pelicula) REFERENCES peliculas(id),
    FOREIGN KEY (num_cinta) REFERENCES pelicula_cintas(id_cinta)
);

-- TRANSACCIONES
CREATE PROCEDURE InsertAll
AS

INSERT INTO directores(nombre)
VALUES 
('Steven Spielberg'),
('Peter Jackson'),
('Martin Scorsese'),
('Steven Soderbergh'),
('Ridley Scott'),
('Quentin Tarantino'),
('Michael Mann'),
('James Cameron'),
('Joel and Ethan Coen'),
('Guillermo del Toro'),
('David Fincher'),
('Tim Burton');

INSERT INTO actores(nombre)
VALUES
('Scarlett Johansson'),
('Will Smith'),
('Johnny Depp'),
('Adam Sandler'),
('Vin Diesel'),
('Jackie Chan'),
('Morgan Freeman'),
('Brad Pitt'),
('Angelina Jolie'),
('Leonardo Dicaprio'),
('Robin Williams');

INSERT INTO generos(genero)
VALUES
("Terror"),
("Ficcion"),
("Fantasía"),
("Suspense"),
("Comedia"),
("Musical"),
("Bélicas"),
("Infantiles"),
("Aventuras"),
("Adultos");

INSERT INTO socios(nombre, apellido1, apellido2, direccion, director_fav, actor_fav, genero_fav, codigo_postal, telefono, activo)
VALUES
("Pepe", "Pelicano", "Porrales", "Calle del estartit", 1, 2, 2, 08770, 636987456, 1),
("Antonio", "Roberto", "Matasuegras", "Calle del perro malo", 8, 4, 5, 06992, 418963258, 0),
("Ari", "Giribet", "Morillo", "Carrer de l'estartit, 614", 4, 2, 6, 02336, 515585468, 0),
("Juanjo", "Martínez", "Canovas", "Carrer de l'emperador, 214", 6, 8, 9, 63651, 125987465, 1),
("Eduardo", "Romero", "Canilo", "Carrer de l'estel, 236", 6, 4, 10, 63984, 44596258, 0),
("Rodolfo", "Rosale", "Tale", "Calle de la paradoja, 120", 2, 1, 6, 85562, 15636874, 1),
("Filiberto", "Adolfo", "Gonzalez", "Calle Augutsto Tercero, 240", 9, 7, 4, 20214, 158963478, 1),
("Maria Salud", "Gómez", "Herrero", "Calle Romesco, 158", 10, 8, 3, 46581, 789635482, 0),
("Francisco", "Jiménez", "Gomez", "Avinguda Catalunya, 567", 9, 3, 6, 45264, 023154763, 1),
("Joan", "Giribet", "Morillo", "Avinguda Catalunya, 567", 4, 3, 3, 45258, 158974635, 0),
("Monica", "Rodriguez", "Vandile", "Calle Penedes, 315", 3, 5, 7, 15847, 589423168, 1);

INSERT INTO peliculas(titulo, genero, director)
VALUES 
('Harry Potter y la Piedra Filosofal', 3, 4),
('Avatar', 9, 8),
('Titanic', 8, 7),
('Los Vengadores', 5, 10),
('Harry Potter y las Reliquias de la Muerte', 4, 10),
('Transformers: Dark of the Moon', 1, 11),
('Toy Story 3', 5, 2),
('Piratas del Caribe: En mareas misteriosas', 6, 5),
('El caballero oscuro', 5, 3),
('Joker', 6, 2);

INSERT INTO peliculas_actores(id_pelicula, id_actor)
VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 4),
(2, 8),
(2, 5),
(2, 7),
(2, 10),
(3, 10),
(3, 6),
(3, 2),
(3, 1),
(3, 3),
(3, 4),
(3, 11),
(4, 2),
(4, 3),
(4, 5),
(4, 8),
(4, 6),
(4, 9),
(5, 5),
(5, 6),
(5, 4),
(5, 2),
(5, 9),
(5, 11),
(5, 10),
(5, 7),
(5, 1);

INSERT INTO pelicula_cintas(id_pelicula)
VALUES
(2),
(2),
(5),
(4),
(4),
(3),
(4),
(4),
(6),
(7),
(6),
(7),
(2),
(3),
(9),
(1),
(1),
(6),
(6),
(3),
(7),
(8),
(8),
(8),
(3),
(2),
(1),
(6),
(10);

INSERT INTO lista_espera(pelicula, socio)
VALUES
(10, 1),
(2, 3),
(3, 3),
(4, 5),
(5, 5),
(6, 4),
(6, 4),
(6, 4),
(6, 4),
(6, 4),
(8, 6);


-- ERROR EN ESTA TABLA FON LOS FK!!!!!
INSERT INTO prestamos(socio, pelicula, num_cinta, fecha, devuelta)
VALUES
(1, 2, 1, '2001-02-02', 0),
(3, 2, 2, '2020-10-05', 1),
(4, 7, 4, '2020-10-05', 1),
(2, 6, 1, '2020-10-05', 0),
(3, 4, 6, '2020-10-05', 1),
(3, 8, 4, '2020-10-05', 0),
(3, 2, 5, '2020-10-05', 0);
GO;