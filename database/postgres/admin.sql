-- =====================================================
-- CREAR ROL
-- =====================================================

CREATE ROLE revisor_academico;

-- =====================================================
-- OTORGAR PERMISOS
-- =====================================================

GRANT SELECT

ON vista_historial_academico

TO revisor_academico;

-- =====================================================
-- REVOCAR PERMISOS
-- =====================================================

REVOKE
INSERT,
UPDATE,
DELETE

ON inscripciones

FROM revisor_academico;

-- =====================================================
-- TRANSACCIONES
-- =====================================================

BEGIN;

UPDATE inscripciones

SET calificacion_final = 5

WHERE id_inscripcion = 1;

SAVEPOINT cambio1;

UPDATE inscripciones

SET calificacion_final = 0

WHERE id_inscripcion = 2;

ROLLBACK TO cambio1;

COMMIT;