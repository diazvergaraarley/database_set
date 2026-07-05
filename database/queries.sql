-- =====================================================
-- CONSULTAR VISTA
-- =====================================================

SELECT *

FROM vista_historial_academico;

-- =====================================================
-- ESTUDIANTES CON SUS CURSOS
-- =====================================================

SELECT

    e.nombre_completo,

    c.nombre AS curso,

    i.calificacion_final

FROM inscripciones i

JOIN estudiantes e
ON i.id_estudiante = e.id_estudiante

JOIN cursos c
ON i.id_curso = c.id_curso;

-- =====================================================
-- CURSOS DICTADOS POR DOCENTES CON MÁS DE 5 AÑOS
-- =====================================================

SELECT

    c.nombre,

    d.nombre_completo,

    d.anios_experiencia

FROM cursos c

JOIN docentes d
ON c.id_docente = d.id_docente

WHERE d.anios_experiencia > 5;

-- =====================================================
-- PROMEDIO DE CALIFICACIONES POR CURSO
-- =====================================================

SELECT

    c.nombre,

    AVG(i.calificacion_final) AS promedio

FROM cursos c

JOIN inscripciones i
ON c.id_curso = i.id_curso

GROUP BY c.nombre;

-- =====================================================
-- ESTUDIANTES INSCRITOS EN MÁS DE UN CURSO
-- =====================================================

SELECT

    e.nombre_completo,

    COUNT(*) AS cursos_inscritos

FROM inscripciones i

JOIN estudiantes e
ON i.id_estudiante = e.id_estudiante

GROUP BY e.nombre_completo

HAVING COUNT(*) > 1;

-- =====================================================
-- PROBAR ON DELETE RESTRICT
-- =====================================================

-- Esta consulta genera un error porque la tabla cursos
-- tiene una clave foránea con ON DELETE RESTRICT.

DELETE FROM docentes

WHERE id_docente = 1;

-- =====================================================
-- CURSOS CON MÁS DE DOS ESTUDIANTES
-- =====================================================

SELECT

    c.nombre,

    COUNT(*) AS estudiantes

FROM cursos c

JOIN inscripciones i
ON c.id_curso = i.id_curso

GROUP BY c.nombre

HAVING COUNT(*) > 2;

-- =====================================================
-- ESTUDIANTES CON PROMEDIO SUPERIOR AL PROMEDIO GENERAL
-- =====================================================

SELECT

    e.nombre_completo,

    AVG(i.calificacion_final) AS promedio

FROM estudiantes e

JOIN inscripciones i
ON e.id_estudiante = i.id_estudiante

GROUP BY e.nombre_completo

HAVING AVG(i.calificacion_final) >

(

SELECT AVG(calificacion_final)

FROM inscripciones

);

-- =====================================================
-- CARRERAS CON ESTUDIANTES INSCRITOS EN CURSOS
-- DE SEMESTRE MAYOR O IGUAL A 2
-- =====================================================

SELECT

    e.carrera,

    COUNT(DISTINCT e.id_estudiante) AS cantidad_estudiantes

FROM estudiantes e

JOIN inscripciones i
ON e.id_estudiante = i.id_estudiante

JOIN cursos c
ON i.id_curso = c.id_curso

WHERE c.semestre >= 2

GROUP BY e.carrera;

-- =====================================================
-- INDICADORES GENERALES
-- =====================================================

SELECT

    ROUND(AVG(calificacion_final),2) AS promedio_general,

    SUM(calificacion_final) AS suma_calificaciones,

    MAX(calificacion_final) AS nota_maxima,

    MIN(calificacion_final) AS nota_minima,

    COUNT(*) AS total_inscripciones

FROM inscripciones;