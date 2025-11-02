Use Esquema_Proyecto;

INSERT INTO usuario (direccion, telefono) VALUES
('San Martin 32', '3558426190'),
('Alvear 120', '3569175248'),
('Ohiggins 1290', '3576248053'),
('9 de Julio 465', '3584391720'),
('Buenos Aires 1298', '35572948016'),
('Ayacucho 265', '3563841927'),
('Sarmiento 1232', '3587612646');

INSERT INTO empresa (id_usuario, cuit, kw) VALUES
(1, 30700123456, 25000),
(2, 30820121456, 35000);

INSERT INTO persona (id_usuario, dni) VALUES
(3, 41022140),
(4, 36915986), 
(5, 42944710),
(6, 28017273),
(7, 33128930); 

INSERT INTO empleado (id_usuario, nombre, apellido, sueldo) VALUES
(6, 'Juan Carlos', 'Ramirez', 950000), 
(7, 'Esteban', 'Herrera', 950000);

INSERT INTO motivo (descripcion) VALUES 
('Corte de luz en hogar'),
('Problema con el medidor'),
('Problemas de tension'),
('Solicitud de reconexión'),
('Reclamo por mal cobro');

INSERT INTO reclamo (fecha_hora, id_usuario, cod_motivo, fecha_solucion)
VALUES
('2025-10-10 08:30:00', 3, 1, '2025-10-11 12:00:00'),
('2025-10-11 11:00:00', 4, 2, '2025-10-12 09:30:00'),
('2025-10-12 08:00:00', 1, 3, '2025-10-12 12:00:00'),
('2025-10-13 09:30:00', 2, 3, NULL),
('2025-10-14 14:00:00', 5, 5, NULL);

INSERT INTO llamado (nro_reclamo, nro_llamado, fecha_hora) VALUES
(1, 1, '2025-10-10 08:30:00'),
(1, 2, '2025-10-10 13:00:00'),
(2, 1, '2025-10-11 11:00:00'),
(3, 1, '2025-10-12 08:00:00'),
(4, 1, '2025-10-13 09:30:00'),
(4, 2, '2025-10-13 17:30:00'),
(5, 1, '2025-10-14 14:00:00');

INSERT INTO material (descripcion) VALUES
('DISYUNTOR'),
('FUSIBLE'),
('INTERRUPTOR'),
('CAJA DE CONEXION'),
('CABLE ELECTRICO ALTA TENSION'),
('MEDIDOR DIGITAL');

INSERT INTO utiliza (nro_reclamo, cod_material, cantidad) VALUES
(1, 5, 2),
(2, 6, 1),
(2, 1, 1),
(3, 1, 1),
(3, 4, 1);

INSERT INTO mantenimiento (nro_reclamo, id_usuario) VALUES
(1, 6),
(2, 7),
(3, 7),
(4, 6),
(5, 7);

DELETE FROM reclamo where (nro_reclamo = 2);

