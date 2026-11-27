CREATE TABLE CLIENTE(
    id_cliente NUMBER,
    dni varchar(9) CONSTRAINT nn_dni_cliente NOT NULL,
    telefono NUMBER(15),
    nombre varchar(255) CONSTRAINT nn_nombre_cliente NOT NULL,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT ck_telefono_cliente CHECK (telefono BETWEEN 1000000 AND 999999999999999)

);