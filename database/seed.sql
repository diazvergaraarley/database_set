-- =====================================================
-- ESTUDIANTES
-- =====================================================

INSERT INTO estudiantes
(nombre_completo, correo_electronico, genero, identificacion, carrera, fecha_nacimiento, fecha_ingreso)

VALUES

('Juan Pérez','juan@correo.com','Masculino','1001','Ingeniería de Sistemas','2002-05-12','2023-01-20'),

('María Gómez','maria@correo.com','Femenino','1002','Ingeniería Industrial','2001-10-02','2022-07-15'),

('Carlos Díaz','carlos@correo.com','Masculino','1003','Ingeniería de Sistemas','2003-03-18','2024-01-25'),

('Laura Torres','laura@correo.com','Femenino','1004','Administración','2002-11-05','2023-08-10'),

('Andrés Ruiz','andres@correo.com','Masculino','1005','Contaduría','2001-01-14','2022-01-15');

-- =====================================================
-- DOCENTES
-- =====================================================

INSERT INTO docentes
(nombre_completo, correo_institucional, departamento_academico, anios_experiencia)

VALUES

('Ana Rodríguez','ana@universidad.edu','Ingeniería',8),

('Luis Martínez','luis@universidad.edu','Administración',4),

('Sofía Herrera','sofia@universidad.edu','Matemáticas',12);

-- =====================================================
-- CURSOS
-- =====================================================

INSERT INTO cursos
(nombre, codigo, creditos, semestre, id_docente)

VALUES

('Bases de Datos','BD101',4,3,1),

('Programación','PR201',5,2,1),

('Administración','AD301',3,1,2),

('Cálculo','CA401',4,2,3);

-- =====================================================
-- INSCRIPCIONES
-- =====================================================

INSERT INTO inscripciones
(id_estudiante, id_curso, fecha_inscripcion, calificacion_final)

VALUES

(1,1,'2025-01-15',4.5),

(1,2,'2025-01-15',4.0),

(2,1,'2025-01-16',3.8),

(2,3,'2025-01-16',4.2),

(3,2,'2025-01-17',4.9),

(4,4,'2025-01-18',3.5),

(5,3,'2025-01-18',4.1),

(5,4,'2025-01-18',3.9);

-- =====================================================
-- ACTUALIZAR ESTADO ACADÉMICO
-- =====================================================

UPDATE estudiantes

SET estado_academico = 'Activo';