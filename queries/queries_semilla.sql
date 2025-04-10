/* ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--                                                                               --
--                              CREATE TABLE                                     --
--                                                                               --
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------*/


-- Fichero seeder para reproducir la BBDD en PostgreSQL

-- Eliminar tablas si existen
DROP TABLE IF EXISTS rol CASCADE;
DROP TABLE IF EXISTS personas CASCADE;
DROP TABLE IF EXISTS clase_personas CASCADE;
DROP TABLE IF EXISTS clases CASCADE;
DROP TABLE IF EXISTS jornadas CASCADE;
DROP TABLE IF EXISTS modalidad CASCADE;
DROP TABLE IF EXISTS proyectos CASCADE;
DROP TABLE IF EXISTS clase_proyectos CASCADE;
DROP TABLE IF EXISTS calificaciones CASCADE;
DROP TABLE IF EXISTS vertical CASCADE;
DROP TABLE IF EXISTS campus CASCADE;
DROP TABLE IF EXISTS promocion CASCADE;


-- Crear tabla rol
CREATE TABLE rol (
  rol_id serial NOT NULL PRIMARY KEY, 
  nombre varchar(50) NOT NULL
);

--Crear tabla: proyectos
CREATE TABLE proyectos (
    proyecto_id serial NOT NULL PRIMARY KEY,
    nombre varchar(50)
);

--Crear tabla: jornadas
CREATE TABLE jornadas (
    jornada_id serial NOT NULL PRIMARY KEY,
    nombre varchar(50)
);

--Crear tabla: vertical
CREATE TABLE vertical (
    vertical_id serial NOT NULL PRIMARY KEY,
    nombre varchar(50) NOT NULL
  );

--Crear tabla: modalidad
CREATE TABLE modalidad (
    modalidad_id serial NOT NULL PRIMARY KEY,
    nombre varchar(50) NOT NULL
  );

--Crear tabla: promocion
CREATE TABLE promocion (
  promocion_id serial NOT NULL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_fin date NOT NULL
);

--Crear tabla: campus
CREATE TABLE campus (
  campus_id serial NOT NULL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  ciudad varchar(50) NOT NULL
);

-- Crear tabla personas
CREATE TABLE personas (
  persona_id serial NOT NULL PRIMARY KEY, 
  nombre_completo varchar(100) NOT NULL, 
  dni varchar(15) NOT NULL, 
  email varchar(100) NOT NULL UNIQUE,
  telefono varchar(50)
);

-- Crear tabla clases
CREATE TABLE clases (
  clase_id serial NOT NULL PRIMARY KEY, 
  nombre_clase varchar(50) NOT NULL, 
  promocion_id int,
  campus_id int,
  vertical_id int,
  modalidad_id int,
  jornada_id int,
  FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id),
  FOREIGN KEY (campus_id) REFERENCES campus(campus_id),
  FOREIGN KEY (vertical_id) REFERENCES vertical(vertical_id),
  FOREIGN KEY (modalidad_id) REFERENCES modalidad(modalidad_id),
  FOREIGN KEY (jornada_id) REFERENCES jornadas(jornada_id)
);

-- Crear tabla clase_personas
  CREATE TABLE clase_personas (
    clasepersona_id serial NOT NULL PRIMARY KEY,
    clase_id int,
    persona_id int,
    rol_id int,
    fecha_ini date NOT NULL,
    fecha_fin date NOT NULL,
    FOREIGN KEY (clase_id) REFERENCES clases(clase_id),
    FOREIGN KEY (persona_id) REFERENCES personas(persona_id),
    FOREIGN KEY (rol_id) REFERENCES rol(rol_id)
  );

-- Crear tabla clase_proyectos
CREATE TABLE clase_proyectos (
  proyectoclase_id serial NOT NULL PRIMARY KEY,
  proyecto_id int,
  clase_id int,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id),
  FOREIGN KEY (clase_id) REFERENCES clases(clase_id)
);

--Crear tabla calificaciones
CREATE TABLE calificaciones(
    calificacion_id serial NOT NULL PRIMARY KEY,
    proyectoclase_id int NOT NULL,
    persona_id int NOT NULL,
    nota varchar(10),
    FOREIGN KEY (proyectoclase_id) REFERENCES clase_proyectos(proyectoclase_id),
    FOREIGN KEY (persona_id) REFERENCES personas(persona_id)
);


/* ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--                                                                               --
--                              INSERT INTO                                      --
--                                                                               --
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------*/

--insert tabla personas
INSERT INTO
personas (nombre_completo, dni, email, telefono) VALUES
('Jafet Casals', '21854736L', 'Jafet_Casals@gmail.com', '613402859'),
('Jorge Manzanares', '38752016F', 'Jorge_Manzanares@gmail.com', '634981720'),
('Onofre Adadia', '59278104M', 'Onofre_Adadia@gmail.com', '672094138'),
('Merche Prada', '84321976V', 'Merche_Prada@gmail.com', '611782435'),
('Pilar Abella', '10435629S', 'Pilar_Abella@gmail.com', '647091236'),
('Leoncio Tena', '75813942C', 'Leoncio_Tena@gmail.com', '689304571'),
('Odalys Torrijos', '62018594P', 'Odalys_Torrijos@gmail.com', '693810294'),
('Eduardo Caparrós', '33179058G', 'Eduardo_Caparrós@gmail.com', '623901475'),
('Ignacio Goicoechea', '91684025Z', 'Ignacio_Goicoechea@gmail.com', '645138209'),
('Clementina Santos', '20917348D', 'Clementina_Santos@gmail.com', '676204931'),
('Daniela Falcó', '68253017Q', 'Daniela_Falcó@gmail.com', '699184305'),
('Abraham Vélez', '87450296J', 'Abraham_Vélez@gmail.com', '674893102'),
('Maximiliano Menéndez', '39528061K', 'Maximiliano_Menéndez@gmail.com', '690217438'),
('Anita Heredia', '43172698W', 'Anita_Heredia@gmail.com', '655730948'),
('Eli Casas', '70284951X', 'Eli_Casas@gmail.com', '611984702'),
('Guillermo Borrego', '80134725B', 'Guillermo_Borrego@gmail.com', '633701895'),
('Sergio Aguirre', '95710386N', 'Sergio_Aguirre@gmail.com', '692140386'),
('Carlito Carrión', '38791520H', 'Carlito_Carrión@gmail.com', '687391204'),
('Haydée Figueroa', '13495280E', 'Haydée_Figueroa@gmail.com', '641029573'),
('Chita Mancebo', '67490132T', 'Chita_Mancebo@gmail.com', '668193027'),
('Joaquina Asensio', '72059483A', 'Joaquina_Asensio@gmail.com', '677802391'),
('Cristian Sarabia', '56940287R', 'Cristian_Sarabia@gmail.com', '695304817'),
('Isabel Ibáñez', '38560174Y', 'Isabel_Ibáñez@gmail.com', '659218430'),
('Desiderio Jordá', '81374026F', 'Desiderio_Jordá@gmail.com', '688140952'),
('Rosalina Llanos', '60581739D', 'Rosalina_Llanos@gmail.com', '662309781'),
('Amor Larrañaga', '21460873G', 'Amor_Larrañaga@gmail.com', '626481902'),
('Teodoro Alberola', '98543027K', 'Teodoro_Alberola@gmail.com', '634705291'),
('Cleto Plana', '30194872M', 'Cleto_Plana@gmail.com', '612973845'),
('Aitana Sebastián', '84951763C', 'Aitana_Sebastián@gmail.com', '687059413'),
('Dolores Valbuena', '76320485P', 'Dolores_Valbuena@gmail.com', '670431208'),
('Julie Ferrer', '19834570L', 'Julie_Ferrer@gmail.com', '699318402'),
('Mireia Cabañas', '73982645V', 'Mireia_Cabañas@gmail.com', '644890735'),
('Flavia Amador', '50217934S', 'Flavia_Amador@gmail.com', '685142097'),
('Albino Macias', '68792053H', 'Albino_Macias@gmail.com', '622059184'),
('Ester Sánchez', '31549702N', 'Ester_Sánchez@gmail.com', '647893205'),
('Luis Miguel Galvez', '98126340X', 'Luis_Miguel_Galvez@gmail.com', '676109843'),
('Loida Arellano', '24386075B', 'Loida_Arellano@gmail.com', '661340958'),
('Heraclio Duque', '17602498J', 'Heraclio_Duque@gmail.com', '658021439'),
('Herberto Figueras', '45278903T', 'Herberto_Figueras@gmail.com', '691870243'),
('Teresa Laguna', '31047689Y', 'Teresa_Laguna@gmail.com', '645091783'),
('Estrella Murillo', '68094213W', 'Estrella_Murillo@gmail.com', '693780214'),
('Ernesto Uriarte', '20435879Z', 'Ernesto_Uriarte@gmail.com', '633149802'),
('Daniela Guitart', '86249130A', 'Daniela_Guitart@gmail.com', '670289153'),
('Timoteo Trillo', '53472061D', 'Timoteo_Trillo@gmail.com', '623478291'),
('Ricarda Tovar', '14730628G', 'Ricarda_Tovar@gmail.com', '690281947'),
('Alejandra Vilaplana', '67298510E', 'Alejandra_Vilaplana@gmail.com', '675204319'),
('Daniel Rosselló', '92031487M', 'Daniel_Rosselló@gmail.com', '659041827'),
('Rita Olivares', '70826459F', 'Rita_Olivares@gmail.com', '697318405'),
('Cleto Montes', '89075324R', 'Cleto_Montes@gmail.com', '687920314'),
('Marino Castilla', '51068427P', 'Marino_Castilla@gmail.com', '610489375'),
('Estefanía Valcárcel', '74392015K', 'Estefanía_Valcárcel@gmail.com', '681042793'),
('Noemí Vilanova', '62710438X', 'Noemí_Vilanova@gmail.com', '648930124'),
('Noa Yáñez', '35984726T', 'Noa_Yanez@gmail.com', '663481072'),
('Saturnina Benitez', '82164930V', 'Saturnina_Benitez@gmail.com', '622791408'),
('Anna Feliu', '60813542S', 'Anna_Feliu@gmail.com', '695017348'),
('Rosalva Ayuso', '19857046N', 'Rosalva_Ayuso@gmail.com', '664802913'),
('Ana Sofía Ferrer', '76328014C', 'Ana_S_Ferrer@gmail.com', '693208714'),
('Angélica Corral', '92078135J', 'Angelica_Corral@gmail.com', '611729803'),
('Ariel Lledó', '28490763H', 'Ariel_Lledo@gmail.com', '627894130'),
('Mario Prats', '31480627Q', 'Mario_Prats@gmail.com', '661093847'),
('Luis Ángel Suárez', '67391520B', 'Luis_Angel@gmail.com', '671938024'),
('María Dolores Diaz', '75428016W', 'Maria_D_Diaz@gmail.com', '696140287')
;

--insert tabla promocion
INSERT INTO
promocion (nombre, fecha_inicio, fecha_fin) VALUES
('SEP23', '2023-09-18', '2024-01-15'),
('FEB24', '2024-02-12', '2024-04-30'),
('SEP24', '2024-09-01', '2025-01-15'),
('MAR25', '2025-03-05', '2025-06-06'),
('JUN25', '2025-06-01', '2025-08-31')
;

--insert tabla modalidad
INSERT INTO
modalidad (nombre) VALUES
('presencial'),
('online'),
('hibrido')
;

--insert tabla rol
INSERT INTO
rol (nombre) VALUES
('ESTUDIANTE'),
('ASISTENTE PROFESOR'),
('PROFESOR')
;

--insert tabla jornadas
INSERT INTO
jornadas (nombre) VALUES
('fulltime'),
('partime')
;

--insert tabla vertical
INSERT INTO
vertical (nombre) VALUES
('DATA SCIENCE'),
('FULLSTACK'),
('CIBER SEGURIDAD')
;

--insert tabla campus
INSERT INTO
campus (nombre, ciudad) VALUES
('Madrid-Recoletos', 'Madrid'),
('Valencia', 'Valencia'),
('Madrid-Alcobendas', 'Madrid')
;

--insert tabla clases
INSERT INTO
clases (nombre_clase, promocion_id, campus_id, vertical_id, modalidad_id, jornada_id) VALUES
('202309DSM', 1, 1, 1, 1, 1),
('202402DSM', 2, 1, 1, 1, 1),
('202309FSM', 1, 1, 2, 1, 1),
('202309FSV', 1, 2, 2, 1, 1),
('202402FSV', 2, 2, 2, 1, 1),
('202402FSM', 2, 1, 2, 1, 1),
('202402FSVO', 2, 2, 2, 2, 1),
('202309FSMO', 1, 1, 2, 2, 1),
('202309DSMO', 1, 1, 1, 2, 1)
;

--insert tabla clase_personas
INSERT INTO
clase_personas (persona_id, clase_id, rol_id, fecha_ini, fecha_fin) VALUES
(1, 1, 1, '2025-03-05', '9999-12-31'),
(2, 1, 1, '2025-03-05', '9999-12-31'),
(3, 1, 1, '2025-03-05', '9999-12-31'),
(4, 1, 1, '2025-03-05', '9999-12-31'),
(5, 1, 1, '2025-03-05', '9999-12-31'),
(6, 1, 1, '2025-03-05', '9999-12-31'),
(7, 1, 1, '2025-03-05', '9999-12-31'),
(8, 1, 1, '2025-03-05', '9999-12-31'),
(9, 1, 1, '2025-03-05', '9999-12-31'),
(10, 1, 1, '2025-03-05', '9999-12-31'),
(11, 1, 1, '2025-03-05', '9999-12-31'),
(12, 1, 1, '2025-03-05', '9999-12-31'),
(13, 1, 1, '2025-03-05', '9999-12-31'),
(14, 1, 1, '2025-03-05', '9999-12-31'),
(15, 1, 1, '2025-03-05', '9999-12-31'),
(16, 2, 1, '2025-03-05', '9999-12-31'),
(17, 2, 1, '2025-03-05', '9999-12-31'),
(18, 2, 1, '2025-03-05', '9999-12-31'),
(19, 2, 1, '2025-03-05', '9999-12-31'),
(20, 2, 1, '2025-03-05', '9999-12-31'),
(21, 2, 1, '2025-03-05', '9999-12-31'),
(22, 2, 1, '2025-03-05', '9999-12-31'),
(23, 2, 1, '2025-03-05', '9999-12-31'),
(24, 2, 1, '2025-03-05', '9999-12-31'),
(25, 2, 1, '2025-03-05', '9999-12-31'),
(26, 3, 1, '2025-03-05', '9999-12-31'),
(27, 3, 1, '2025-03-05', '9999-12-31'),
(28, 3, 1, '2025-03-05', '9999-12-31'),
(29, 3, 1, '2025-03-05', '9999-12-31'),
(30, 3, 1, '2025-03-05', '9999-12-31'),
(31, 3, 1, '2025-03-05', '9999-12-31'),
(32, 3, 1, '2025-03-05', '9999-12-31'),
(33, 3, 1, '2025-03-05', '9999-12-31'),
(34, 3, 1, '2025-03-05', '9999-12-31'),
(35, 3, 1, '2025-03-05', '9999-12-31'),
(36, 3, 1, '2025-03-05', '9999-12-31'),
(37, 3, 1, '2025-03-05', '9999-12-31'),
(38, 3, 1, '2025-03-05', '9999-12-31'),
(39, 3, 1, '2025-03-05', '9999-12-31'),
(40, 5, 1, '2025-03-05', '9999-12-31'),
(41, 5, 1, '2025-03-05', '9999-12-31'),
(42, 5, 1, '2025-06-01', '9999-12-31'),
(43, 5, 1, '2025-06-01', '9999-12-31'),
(44, 5, 1, '2025-06-01', '9999-12-31'),
(45, 5, 1, '2025-06-01', '9999-12-31'),
(46, 5, 1, '2025-06-01', '9999-12-31'),
(47, 5, 1, '2025-06-01', '9999-12-31'),
(48, 5, 1, '2025-06-01', '9999-12-31'),
(49, 5, 1, '2025-06-01', '9999-12-31'),
(50, 5, 1, '2025-06-01', '9999-12-31'),
(51, 5, 1, '2025-06-01', '9999-12-31'),
(52, 5, 1, '2025-06-01', '9999-12-31'),
(53, 1, 2, '2025-06-01', '9999-12-31'),
(54, 1, 2, '2025-06-01', '9999-12-31'),
(55, 3, 2, '2025-03-05', '9999-12-31'),
(56, 4, 2, '2025-03-05', '9999-12-31'),
(57, 5, 2, '2025-03-05', '9999-12-31'),
(58, 6, 2, '2025-03-05', '9999-12-31'),
(59, 1, 2, '2025-03-05', '9999-12-31'),
(60, 7, 3, '2025-03-05', '9999-12-31'),
(61, 8, 3, '2025-03-05', '9999-12-31'),
(62, 9, 3, '2025-03-05', '9999-12-31')
;

--insert tabla proyectos
INSERT INTO
proyectos (proyecto_id, nombre) VALUES
('1','Proyecto_HLF'),
('2','Proyecto_EDA'),
('3','Proyecto_BBDD'),
('4','Proyecto_ML'),
('5','Proyecto_Deployment'),
('6','Proyecto_WebDev'),
('7','Proyecto_FrontEnd'),
('8','Proyecto_Backend'),
('9','Proyecto_React'),
('10','Proyecto_FullSatck'),
('11','proyecto_Siem'),
('12','Proyecto_XG_Firewall'),
('13','Proyecto_Metasploit'),
('14','Proyecto_Autopsy'),
('15','Proyecto_Kali')
;

--insert tabla clase_proyectos
INSERT INTO
clase_proyectos (proyecto_id, clase_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(6, 8),
(7, 8),
(8, 8),
(9, 8),
(10, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9)
;

--insert tabla clase_proyectos
INSERT INTO
calificaciones (proyectoclase_id, persona_id, nota) VALUES
(1,1,'Apto'),
(1,2,'Apto'),
(1,3,'Apto'),
(1,4,'Apto'),
(1,5,'Apto'),
(1,6,'Apto'),
(1,7,'No Apto'),
(1,8,'No Apto'),
(1,9,'Apto'),
(1,10,'Apto'),
(1,11,'Apto'),
(1,12,'Apto'),
(1,13,'Apto'),
(1,14,'Apto'),
(1,15,'Apto'),
(2,1,'No Apto'),
(2,2,'No Apto'),
(2,3,'Apto'),
(2,4,'No Apto'),
(2,5,'No Apto'),
(2,6,'Apto'),
(2,7,'Apto'),
(2,8,'Apto'),
(2,9,'Apto'),
(2,10,'No Apto'),
(2,11,'Apto'),
(2,12,'No Apto'),
(2,13,'No Apto'),
(2,14,'Apto'),
(2,15,'Apto'),
(3,1,'Apto'),
(3,2,'Apto'),
(3,3,'Apto'),
(3,4,'No Apto'),
(3,5,'Apto'),
(3,6,'Apto'),
(3,7,'Apto'),
(3,8,'Apto'),
(3,9,'Apto'),
(3,10,'Apto'),
(3,11,'Apto'),
(3,12,'No Apto'),
(3,13,'Apto'),
(3,14,'Apto'),
(3,15,'Apto'),
(4,1,'Apto'),
(4,2,'Apto'),
(4,3,'No Apto'),
(4,4,'Apto'),
(4,5,'Apto'),
(4,6,'Apto'),
(4,7,'Apto'),
(4,8,'Apto'),
(4,9,'No Apto'),
(4,10,'Apto'),
(4,11,'Apto'),
(4,12,'Apto'),
(4,13,'Apto'),
(4,14,'Apto'),
(4,15,'Apto'),
(5,1,'Apto'),
(5,2,'Apto'),
(5,3,'Apto'),
(5,4,'No Apto'),
(5,5,'Apto'),
(5,6,'Apto'),
(5,7,'Apto'),
(5,8,'Apto'),
(5,9,'Apto'),
(5,10,'Apto'),
(5,11,'Apto'),
(5,12,'Apto'),
(5,13,'Apto'),
(5,14,'Apto'),
(5,15,'Apto'),
(1,16,'Apto'),
(1,17,'Apto'),
(1,18,'Apto'),
(1,19,'Apto'),
(1,20,'No Apto'),
(1,21,'No Apto'),
(1,22,'Apto'),
(1,23,'No Apto'),
(1,24,'No Apto'),
(1,25,'Apto'),
(2,16,'No Apto'),
(2,17,'No Apto'),
(2,18,'No Apto'),
(2,19,'Apto'),
(2,20,'Apto'),
(2,21,'No Apto'),
(2,22,'Apto'),
(2,23,'Apto'),
(2,24,'Apto'),
(2,25,'Apto'),
(3,16,'No Apto'),
(3,17,'Apto'),
(3,18,'Apto'),
(3,19,'Apto'),
(3,20,'No Apto'),
(3,21,'Apto'),
(3,22,'No Apto'),
(3,23,'No Apto'),
(3,24,'No Apto'),
(3,25,'Apto'),
(4,16,'Apto'),
(4,17,'Apto'),
(4,18,'Apto'),
(4,19,'Apto'),
(4,20,'Apto'),
(4,21,'Apto'),
(4,22,'Apto'),
(4,23,'Apto'),
(4,24,'No Apto'),
(4,25,'Apto'),
(5,16,'No Apto'),
(5,17,'No Apto'),
(5,18,'Apto'),
(5,19,'Apto'),
(5,20,'Apto'),
(5,21,'Apto'),
(5,22,'Apto'),
(5,23,'Apto'),
(5,24,'Apto'),
(5,25,'Apto'),
(11,26,'Apto'),
(11,27,'No Apto'),
(11,28,'Apto'),
(11,29,'Apto'),
(11,30,'Apto'),
(11,31,'No Apto'),
(11,32,'No Apto'),
(11,33,'Apto'),
(11,34,'No Apto'),
(11,35,'No Apto'),
(11,36,'No Apto'),
(11,37,'Apto'),
(11,38,'Apto'),
(11,39,'Apto'),
(12,26,'Apto'),
(12,27,'No Apto'),
(12,28,'No Apto'),
(12,29,'No Apto'),
(12,30,'Apto'),
(12,31,'No Apto'),
(12,32,'Apto'),
(12,33,'Apto'),
(12,34,'Apto'),
(12,35,'Apto'),
(12,36,'Apto'),
(12,37,'Apto'),
(12,38,'Apto'),
(12,39,'Apto'),
(13,26,'Apto'),
(13,27,'Apto'),
(13,28,'Apto'),
(13,29,'Apto'),
(13,30,'Apto'),
(13,31,'No Apto'),
(13,32,'Apto'),
(13,33,'No Apto'),
(13,34,'Apto'),
(13,35,'Apto'),
(13,36,'Apto'),
(13,37,'Apto'),
(13,38,'No Apto'),
(13,39,'Apto'),
(14,26,'Apto'),
(14,27,'No Apto'),
(14,28,'No Apto'),
(14,29,'No Apto'),
(14,30,'Apto'),
(14,31,'Apto'),
(14,32,'Apto'),
(14,33,'Apto'),
(14,34,'Apto'),
(14,35,'No Apto'),
(14,36,'Apto'),
(14,37,'Apto'),
(14,38,'No Apto'),
(14,39,'Apto'),
(15,26,'No Apto'),
(15,27,'Apto'),
(15,28,'Apto'),
(15,29,'Apto'),
(15,30,'No Apto'),
(15,31,'No Apto'),
(15,32,'Apto'),
(15,33,'Apto'),
(15,34,'Apto'),
(15,35,'Apto'),
(15,36,'Apto'),
(15,37,'Apto'),
(15,38,'No Apto'),
(15,39,'Apto'),
(21,40,'Apto'),
(21,41,'Apto'),
(21,42,'Apto'),
(21,43,'Apto'),
(21,44,'No Apto'),
(21,45,'Apto'),
(21,46,'No Apto'),
(21,47,'No Apto'),
(21,48,'No Apto'),
(21,49,'Apto'),
(21,50,'No Apto'),
(21,51,'Apto'),
(21,52,'Apto'),
(22,40,'Apto'),
(22,41,'Apto'),
(22,42,'Apto'),
(22,43,'No Apto'),
(22,44,'Apto'),
(22,45,'Apto'),
(22,46,'No Apto'),
(22,47,'No Apto'),
(22,48,'No Apto'),
(22,49,'Apto'),
(22,50,'No Apto'),
(22,51,'Apto'),
(22,52,'No Apto'),
(23,40,'Apto'),
(23,41,'No Apto'),
(23,42,'Apto'),
(23,43,'No Apto'),
(23,44,'Apto'),
(23,45,'Apto'),
(23,46,'No Apto'),
(23,47,'Apto'),
(23,48,'No Apto'),
(23,49,'No Apto'),
(23,50,'Apto'),
(23,51,'No Apto'),
(23,52,'No Apto'),
(24,40,'Apto'),
(24,41,'Apto'),
(24,42,'Apto'),
(24,43,'Apto'),
(24,44,'Apto'),
(24,45,'Apto'),
(24,46,'Apto'),
(24,47,'No Apto'),
(24,48,'Apto'),
(24,49,'Apto'),
(24,50,'No Apto'),
(24,51,'No Apto'),
(24,52,'Apto'),
(25,40,'Apto'),
(25,41,'Apto'),
(25,42,'Apto'),
(25,43,'Apto'),
(25,44,'No Apto'),
(25,45,'Apto'),
(25,46,'Apto'),
(25,47,'No Apto'),
(25,48,'Apto'),
(25,49,'Apto'),
(25,50,'No Apto'),
(25,51,'Apto'),
(25,52,'Apto')
;

/* ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--                                                                               --
--                                    VIEWS                                      --
--                                                                               --
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------*/

-- Vista Alumnos
CREATE VIEW alumnos AS
select 
	t1.*, 
	t2.clase_id, 
	t4.nombre_clase,
	t5.nombre as promocion, 
	t5.fecha_inicio, 
	t5.fecha_fin,
	t6.nombre as campus,
	t7.nombre as vertical, 
	t8.nombre as modalidad, 
	t9.nombre as jornada
from 
	personas t1
join clase_personas t2 on t1.persona_id = t2.persona_id
join rol t3 on t2.rol_id = t3.rol_id
join clases t4 on t2.clase_id = t4.clase_id
join promocion t5 on t4.promocion_id = t5.promocion_id
join campus t6 on t4.campus_id = t6.campus_id
join vertical t7 on t4.vertical_id = t7.vertical_id
join modalidad t8 on t4.modalidad_id = t8.modalidad_id
join jornadas t9 on t4.jornada_id = t9.jornada_id
where 
	t2.fecha_fin='9999-12-31' and t2.rol_id=1;

-- Vista Profesores
CREATE VIEW profesores AS
SELECT 
	t1.persona_id,
    t1.nombre_completo,
    t1.dni,
    t1.email,
    t1.telefono,
	t3.nombre as rol,
    t2.clase_id,
    t4.nombre_clase,
    t5.nombre AS promocion,
    t5.fecha_inicio,
    t5.fecha_fin,
    t6.nombre AS campus,
    t7.nombre AS vertical,
    t8.nombre AS modalidad,
    t9.nombre AS jornada
FROM personas t1
JOIN clase_personas t2 ON t1.persona_id = t2.persona_id
JOIN rol t3 ON t2.rol_id = t3.rol_id
JOIN clases t4 ON t2.clase_id = t4.clase_id
JOIN promocion t5 ON t4.promocion_id = t5.promocion_id
JOIN campus t6 ON t4.campus_id = t6.campus_id
JOIN vertical t7 ON t4.vertical_id = t7.vertical_id
JOIN modalidad t8 ON t4.modalidad_id = t8.modalidad_id
JOIN jornadas t9 ON t4.jornada_id = t9.jornada_id
WHERE 
	t2.fecha_fin = '9999-12-31'::date AND t2.rol_id <> 1;

/* ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--                                                                               --
--                                TABLAS                                         --
--                                                                               --
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------*/

SELECT * FROM personas LIMIT 5;

SELECT * FROM campus;

SELECT * FROM promocion;

SELECT * FROM modalidad;

SELECT * FROM jornada;

SELECT * FROM vertical;

SELECT * FROM rol;

SELECT * FROM clases;

SELECT * FROM clase_personas LIMIT 5;

SELECT * FROM proyectos;

SELECT * FROM clase_proyectos LIMIT 5;

SELECT * FROM calificaciones LIMIT 5;





