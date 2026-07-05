-- =====================================================
-- BASE DE DATOS
-- =====================================================

CREATE DATABASE gestion_academica_universidad;

-- =====================================================
-- TABLA ESTUDIANTES
-- =====================================================

CREATE TABLE estudiantes (

    id_estudiante SERIAL PRIMARY KEY,

    nombre_completo VARCHAR(100) NOT NULL,

    correo_electronico VARCHAR(100) NOT NULL UNIQUE,

    genero VARCHAR(20)
        CHECK (genero IN ('Masculino', 'Femenino', 'Otro')),

    identificacion VARCHAR(20) NOT NULL UNIQUE,

    carrera VARCHAR(100) NOT NULL,

    fecha_nacimiento DATE NOT NULL,

    fecha_ingreso DATE NOT NULL

);

-- =====================================================
-- TABLA DOCENTES
-- =====================================================

CREATE TABLE docentes (

    id_docente SERIAL PRIMARY KEY,

    nombre_completo VARCHAR(100) NOT NULL,

    correo_institucional VARCHAR(100) NOT NULL UNIQUE,

    departamento_academico VARCHAR(100) NOT NULL,

    anios_experiencia INT NOT NULL
        CHECK (anios_experiencia >= 0)

);

-- =====================================================
-- TABLA CURSOS
-- =====================================================

CREATE TABLE cursos (

    id_curso SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    codigo VARCHAR(20) NOT NULL UNIQUE,

    creditos INT NOT NULL
        CHECK (creditos > 0),

    semestre INT NOT NULL
        CHECK (semestre >= 1),

    id_docente INT NOT NULL,

    FOREIGN KEY (id_docente)
        REFERENCES docentes(id_docente)
        ON DELETE RESTRICT

);

-- =====================================================
-- TABLA INSCRIPCIONES
-- =====================================================

CREATE TABLE inscripciones (

    id_inscripcion SERIAL PRIMARY KEY,

    id_estudiante INT NOT NULL,

    id_curso INT NOT NULL,

    fecha_inscripcion DATE NOT NULL,

    calificacion_final DECIMAL(4,2)
        CHECK (calificacion_final BETWEEN 0 AND 5),

    FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante)
        ON DELETE CASCADE,

    FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON DELETE CASCADE

);

-- =====================================================
-- MODIFICAR TABLA
-- =====================================================

ALTER TABLE estudiantes

ADD COLUMN estado_academico VARCHAR(20);

-- =====================================================
-- CREAR VISTA
-- =====================================================

CREATE VIEW vista_historial_academico AS

SELECT

    e.nombre_completo AS estudiante,

    c.nombre AS curso,

    d.nombre_completo AS docente,

    c.semestre,

    i.calificacion_final

FROM inscripciones i

JOIN estudiantes e
ON i.id_estudiante = e.id_estudiante

JOIN cursos c
ON i.id_curso = c.id_curso

JOIN docentes d
ON c.id_docente = d.id_docente;