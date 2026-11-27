CREATE TABLE Trabajar (
id_empleado NUMBER,
fecha_asignacion DATE,
id_hotel NUMBER,
fecha_finalizacion DATE,
--Se usan 2 decimales para el salario, un máximo de 8 cifras no decimales (menos de 10 millones por noche)
salario DECIMAL(10, 2),

CONSTRAINT pk_id_empleado_fecha_asignacion PRIMARY KEY(id_empleado, fecha_asignacion),
CONSTRAINT fk_id_empleado_trabajar FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
CONSTRAINT fk_id_hotel_trabajar FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel)
);