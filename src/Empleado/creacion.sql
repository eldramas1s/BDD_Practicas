CREATE TABLE Empleado (
  id_empleado NUMBER,
  dni varchar(9) NOT NULL,
  telefono int,
  direccion varchar(255),
  fecha_contrato_multi date,
  
  CONSTRAINT pk_id_empleado PRIMARY KEY(id_empleado)
);