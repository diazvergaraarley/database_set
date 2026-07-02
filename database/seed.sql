INSERT INTO categoria (nombre)
VALUES
('Construcción'),
('Herramientas');

INSERT INTO metodo_pago (nombre)
VALUES
('Transferencia'),
('Efectivo'),
('Tarjeta');

INSERT INTO asesor (nombre)
VALUES
('Carlos Pérez'),
('Ana Torres');

INSERT INTO sucursal (nombre, ciudad)
VALUES
('Centro','Bogotá'),
('Norte','Medellín');

INSERT INTO cliente (nombre, ciudad)
VALUES
('Constructora Andina SAS','Bogotá'),
('Ferretería Central','Medellín');

INSERT INTO producto (nombre, precio, id_categoria)
VALUES
('Cemento Gris 50kg',32000,1),
('Varilla 3/8',28000,1),
('Martillo',45000,2);