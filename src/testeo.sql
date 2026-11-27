-- 1. Insertamos los datos previos (añadiendo el campo obligatorio 'nombre')
INSERT INTO Empleado (id_empleado, nombre, dni, telefono, direccion, fecha_contrato_multi)
VALUES (1, 'Carlos Pérez', '12345678A', 600112233, 'Calle Gran Vía 10, Granada', TO_DATE('2025-01-15', 'YYYY-MM-DD'));

INSERT INTO HOTEL (id_hotel, nombre, ciudad, provincia, num_hab_simple, num_hab_doble, id_director)
VALUES (1, 'Hotel Alhambra', 'Granada', 'Granada', 20, 30, 1);

-- 2. Asignamos el empleado al hotel con un salario inicial de 1800.00
INSERT INTO Trabajar (id_empleado, fecha_asignacion, id_hotel, fecha_finalizacion, salario)
VALUES (1, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 1, NULL, 1800.00);

-- 3. SENTENCIA DE PRUEBA: Intentamos bajarle el salario a 1500.00
UPDATE Trabajar
SET salario = 1500.00
WHERE id_empleado = 1 
  AND fecha_asignacion = TO_DATE('2025-02-01', 'YYYY-MM-DD');

commit;