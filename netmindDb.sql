CREATE DATABASE IF NOT EXISTS netmind;

USE netmind;

CREATE TABLE MyGuests (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    email VARCHAR(50)
);

INSERT INTO MyGuests (firstname, lastname, email)
VALUES (
    'Casandra',
    'Rodriguez',
    'fjimenezjob@gmail.com'
  );
-- ***********************************************************************************
-- TABLA PARA PRACTICAS DE JOIN
CREATE TABLE IF NOT EXISTS `user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)
  )
ENGINE = InnoDB
AUTO_INCREMENT = 2;

CREATE TABLE IF NOT EXISTS `user_detail` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `postal_code` VARCHAR(20) NULL DEFAULT NULL,
  `city` VARCHAR(100) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_detail_user`
    FOREIGN KEY (`id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- ***********************************************************************************
CREATE TABLE t (id binary(16) PRIMARY KEY);
INSERT INTO t VALUES (UUID_TO_BIN(UUID()));
SELECT * FROM t;
SELECT BIN_TO_UUID(id) id from t;
-- ***********************************************************************************
use netmind;

CREATE TABLE artist (artist_id INT NOT NULL PRIMARY KEY, artist_name VARCHAR(50)); 
 
CREATE TABLE song (song_id INT NOT NULL PRIMARY KEY, 
artist_id INT, song_name VARCHAR(50)); 

ALTER TABLE song
ADD FOREIGN KEY (artist_id) REFERENCES artist(artist_id);
 
 
INSERT INTO artist VALUES (1, 'Ellie Goulding');
INSERT INTO artist VALUES (2, 'Florence + The Machine');
INSERT INTO artist VALUES (3, 'Ed Sheeran');

INSERT INTO song VALUES (1,3,'Bloodstream');
INSERT INTO song VALUES (2,3,"Don't");

INSERT INTO song VALUES (3,2,'Drumming Song');
INSERT INTO song VALUES (4,2,'Blinding');

INSERT INTO song VALUES (5,1,'Lights - Single Version');
INSERT INTO song VALUES (6,1,'Starry Eyed');

CREATE VIEW artist_songs_view
AS 
select song.song_id, artist.artist_id, song_name, artist_name from song, artist
where song.artist_id=artist.artist_id;

-- ***********************************************************************************

CREATE TABLE estudiantes(
    id bigint unsigned not null primary key auto_increment,
    nombre varchar(255) not null,
    grupo varchar(255) not null
);

CREATE TABLE materias(
    id bigint unsigned not null primary key auto_increment,
    nombre varchar(255) not null
);


CREATE TABLE notas_estudiantes_materias(
    id bigint unsigned not null primary key auto_increment,
    id_estudiante bigint unsigned not null,
    id_materia bigint unsigned not null,
    puntaje decimal(9,2) not null,
    foreign key (id_estudiante) references estudiantes(id) on delete cascade on update cascade,
    foreign key (id_materia) references materias(id) on delete cascade on update cascade
);

insert into estudiantes values(100, "migue" "gonzales", "grupo A" );
insert into estudiantes values(200, "alonso" "perez", "grupo A" );
insert into estudiantes values(300, "chema" "garcia", "grupo B" );
insert into estudiantes values(400, "mauro" "bertran", "grupo B" );
insert into estudiantes values(500, "pineda" "murillo", "grupo A" );

insert into materias values (123, "matematicas");
insert into materias values (153, "historia");
insert into materias values (173, "sociologia");
insert into materias values (324, "fisica");
insert into materias values (232, "astronomia");
insert into materias values (242, "informatica");
insert into materias values (255, "robotica");
insert into materias values (165, "artes");
insert into materias values (54, "literatura");
insert into materias values (423, "geografia");