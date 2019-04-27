-- TABLA ALUMNO
CREATE TABLE alumno(
    id_alumno INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    ci VARCHAR(20) NOT NULL,
    imagen LONGBLOB,
    PRIMARY KEY(id_alumno)
);

-- TABLA PADRE
CREATE TABLE padre(
    id_padre INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nick VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    token VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_padre)
);

-- TABLA DOCENTE
CREATE TABLE docente(
    id_docente INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    user VARCHAR(20) NOT NULL,
    pass VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_docente)
); 

-- TABLA MATERIA
CREATE TABLE materia(
    id_materia INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_materia)
);

-- TABLA AULA
CREATE TABLE aula(
    id_aula INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_aula)
);

-- TABLA HORARIO
CREATE TABLE horario(
    id_horario INT(11) NOT NULL AUTO_INCREMENT,
    dia VARCHAR(20) NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    PRIMARY KEY(id_horario)
);

-- TABLA NIVEL
CREATE TABLE nivel(
    id_nivel INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_nivel)
);

-- TABLA GESTION
CREATE TABLE gestion(
    id_gestion INT(11) NOT NULL AUTO_INCREMENT,
    anio VARCHAR(10) NOT NULL,
    PRIMARY KEY(id_gestion)
);

-- TABLA CURSO
CREATE TABLE curso(
    id_curso INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_nivel_fk INT(11) NOT NULL,
    PRIMARY KEY(id_curso),
    FOREIGN KEY (id_nivel_fk) REFERENCES nivel(id_nivel)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- TABLA INSCRIPCION
CREATE TABLE inscripcion(
    id_inscripcion INT(11) NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_alumno_fk INT(11) NOT NULL,
    id_curso_fk INT(11) NOT NULL,
    PRIMARY KEY(id_inscripcion),
    FOREIGN KEY (id_alumno_fk) REFERENCES alumno(id_alumno)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_curso_fk) REFERENCES curso(id_curso)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- TABLA GRUPOMATERIA
CREATE TABLE grupomateria(
    id_grupoMateria INT(11) NOT NULL AUTO_INCREMENT,
    id_gestion_fk INT(11) NOT NULL,
    id_docente_fk INT(11) NOT NULL,
    id_curso_fk INT(11) NOT NULL,
    id_materia_fk INT(11) NOT NULL,
    PRIMARY KEY(id_grupoMateria),
    FOREIGN KEY (id_gestion_fk) REFERENCES gestion(id_gestion)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_docente_fk) REFERENCES docente(id_docente)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_curso_fk) REFERENCES curso(id_curso)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_materia_fk) REFERENCES materia(id_materia)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- TABLA ASIGNACION
CREATE TABLE asignacion(
    id_asignacion INT(11) NOT NULL AUTO_INCREMENT,
    id_grupoMateria_fk INT(11) NOT NULL,
    id_horario_fk INT(11) NOT NULL,
    id_aula_fk INT(11) NOT NULL,
    PRIMARY KEY(id_asignacion),
    FOREIGN KEY (id_grupoMateria_fk) REFERENCES grupomateria(id_grupoMateria)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_horario_fk) REFERENCES horario(id_horario)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_aula_fk) REFERENCES aula(id_aula)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- TABLA LICENCIA
CREATE TABLE licencia(
    id_licencia INT(11) NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    fechaLicencia DATE NOT NULL,
    id_alumno_fk INT(11) NOT NULL,
    id_grupoMateria_fk INT(11) NOT NULL,
    PRIMARY KEY(id_licencia),
    FOREIGN KEY (id_alumno_fk) REFERENCES alumno(id_alumno)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_grupoMateria_fk) REFERENCES grupomateria(id_grupoMateria)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- TABLA FALTA 
CREATE TABLE falta(
    id_falta INT(11) NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    tipo BOOLEAN NOT NULL,
    id_alumno_fk INT(11) NOT NULL,
    id_grupoMateria_fk INT(11) NOT NULL,
    PRIMARY KEY(id_falta),
    FOREIGN KEY (id_alumno_fk) REFERENCES alumno(id_alumno)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_grupoMateria_fk) REFERENCES grupomateria(id_grupoMateria)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- TABLA PADREALUMNO
CREATE TABLE padrealumno(
    id_padre_alumno INT(11) NOT NULL AUTO_INCREMENT,
    id_alumno_fk INT(11) NOT NULL,
    id_padre_fk INT(11) NOT NULL,
    PRIMARY KEY(id_padre_alumno),
    FOREIGN KEY (id_alumno_fk) REFERENCES alumno(id_alumno)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    FOREIGN KEY (id_padre_fk) REFERENCES padre(id_padre)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

ALTER TABLE alumno AUTO_INCREMENT = 0;

ALTER TABLE docente AUTO_INCREMENT = 50;

ALTER TABLE materia AUTO_INCREMENT = 100;

ALTER TABLE aula AUTO_INCREMENT = 150;

ALTER TABLE horario AUTO_INCREMENT = 200;

ALTER TABLE nivel AUTO_INCREMENT = 250;

ALTER TABLE gestion AUTO_INCREMENT = 300;

ALTER TABLE curso AUTO_INCREMENT = 350;

ALTER TABLE inscripcion AUTO_INCREMENT = 400;

ALTER TABLE grupomateria AUTO_INCREMENT = 450;

ALTER TABLE asignacion AUTO_INCREMENT = 500;

ALTER TABLE licencia AUTO_INCREMENT = 550;

ALTER TABLE falta AUTO_INCREMENT = 600;

ALTER TABLE padre AUTO_INCREMENT = 650;

ALTER TABLE padrealumno AUTO_INCREMENT = 700;

INSERT INTO alumno (id_alumno,nombre,apellido,ci,imagen) VALUES
(NULL,'Pedro','Garcia Menacho','123456'),
(NULL,'Maribel','Vargas Mendez','879'),
(NULL,'Carmen','Gutierrez Banegas','2251'),
(NULL,'Luis','Prado Velasques','6589'),
(NULL,'Juan','Rojas Estrada','3698'),
(NULL,'Sergio','Zambrana','1111'),
(NULL,'Daniel','Zeballos Cruz','2222'),
(NULL,'Leonardo','Ayala','3333'),
(NULL,'Freddy','Maturano Leon','4444'),
(NULL,'Natalia','Ovideo Acosta','5555');

INSERT INTO docente (id_docente,nombre,apellido,user,pass) VALUES
(NULL,'Fernando','Montero Garcia','pedro','123456789'),
(NULL,'Alvaro','Zacary Mendez','alvaro','321654'),
(NULL,'Percy','Tomicha Trujillo','per','987654'),
(NULL,'Alejandra','Murillo Vasquez','ale','654789'),
(NULL,'Noelia','Banegas Gutierrez','nor','357951');

INSERT INTO materia (id_materia,nombre) VALUES
(NULL,'Literatura'),
(NULL,'Ciencias Sociales'),
(NULL,'Ciencias Naturales'),
(NULL,'Matematicas'),
(NULL,'Ingles'),
(NULL,'Educacion Fisica'),
(NULL,'Geografia'),
(NULL,'Biologia'),
(NULL,'Civica'),
(NULL,'Religion'),
(NULL,'Musica'),
(NULL,'Artes Plasticas'),
(NULL,'Psicologia'),
(NULL,'Filosofia');

INSERT INTO aula (id_aula, nombre) VALUES
(NULL,'Magna'),
(NULL,'01'),
(NULL,'02'),
(NULL,'03'),
(NULL,'04'),
(NULL,'05'),
(NULL,'06'),
(NULL,'07'),
(NULL,'08'),
(NULL,'09'),
(NULL,'10');

INSERT INTO horario (id_horario,dia,horaInicio,horaFin) VALUES
(NULL,'Lunes','07:00:00','08:30:00'),
(NULL,'Lunes','08:30:00','10:00:00'),
(NULL,'Lunes','10:00:00','10:30:00'),           -- recreo
(NULL,'Lunes','10:30:00','12:00:00'),
(NULL,'Lunes','12:00:00','13:00:00'),
(NULL,'Martes','07:00:00','08:30:00'),
(NULL,'Martes','08:30:00','10:00:00'),
(NULL,'Martes','10:00:00','10:30:00'),           -- recreo
(NULL,'Martes','10:30:00','12:00:00'),
(NULL,'Martes','12:00:00','13:00:00'),
(NULL,'Miercoles','07:00:00','08:30:00'),
(NULL,'Miercoles','08:30:00','10:00:00'),
(NULL,'Miercoles','10:00:00','10:30:00'),           -- recreo
(NULL,'Miercoles','10:30:00','12:00:00'),
(NULL,'Miercoles','12:00:00','13:00:00'),
(NULL,'Jueves','07:00:00','08:30:00'),
(NULL,'Jueves','08:30:00','10:00:00'),
(NULL,'Jueves','10:00:00','10:30:00'),           -- recreo
(NULL,'Jueves','10:30:00','12:00:00'),
(NULL,'Jueves','12:00:00','13:00:00'),
(NULL,'Viernes','07:00:00','08:30:00'),
(NULL,'Viernes','08:30:00','10:00:00'),
(NULL,'Viernes','10:00:00','10:30:00'),           -- recreo
(NULL,'Viernes','10:30:00','12:00:00'),
(NULL,'Viernes','12:00:00','13:00:00');

INSERT INTO nivel (id_nivel, nombre) VALUES
(NULL,'Inicial'),
(NULL,'Basico'),
(NULL,'Primaria'),
(NULL,'Secundaria');

INSERT INTO gestion(id_gestion,anio) VALUES
(NULL,'2018'),
(NULL,'2019');


INSERT INTO curso(id_curso,nombre,id_nivel_fk) VALUES
(NULL,'Kinder',250),
(NULL,'Tercero',251),
(NULL,'Cuarto',252),
(NULL,'Segundo',253);

INSERT INTO inscripcion(id_inscripcion,fecha,id_alumno_fk,id_curso_fk) VALUES
(NULL,'2019-04-04',1,350),
(NULL,'2019-04-03',2,350),
(NULL,'2019-04-04',3,351),
(NULL,'2019-04-03',4,351),
(NULL,'2019-04-02',5,352),
(NULL,'2019-04-04',6,352),
(NULL,'2019-04-04',7,353),
(NULL,'2019-04-04',8,353),
(NULL,'2019-04-04',9,353),
(NULL,'2019-04-04',10,353);

INSERT INTO grupomateria(id_grupoMateria,id_gestion_fk,id_docente_fk,id_curso_fk,id_materia_fk) VALUES
(NULL,301,50,352,103),
(NULL,301,51,352,100),
(NULL,301,52,353,108),
(NULL,301,53,353,109);

INSERT INTO asignacion(id_asignacion,id_grupoMateria_fk,id_horario_fk,id_aula_fk) VALUES
(NULL,450,200,151),
(NULL,451,200,152),
(NULL,452,201,153),
(NULL,453,201,154);

INSERT INTO licencia(id_licencia,fecha,fechaLicencia,id_alumno_fk,id_grupoMateria_fk) VALUES
(NULL, '2019-04-01','2019-04-04',6,450),
(NULL, '2019-04-01','2019-04-04',7,451),
(NULL, '2019-04-01','2019-04-04',8,452),
(NULL, '2019-04-01','2019-04-04',9,453);




















