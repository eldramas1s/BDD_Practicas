select * from user_tables;

CREATE TABLE HOTEL (
    id_hotel        NUMBER,
    nombre          VARCHAR2(100) CONSTRAINT nn_hotel_nombre NOT NULL,
    ciudad          VARCHAR2(60)  CONSTRAINT nn_hotel_ciudad NOT NULL,
    provincia       VARCHAR2(60)  CONSTRAINT nn_hotel_provincia NOT NULL,
    num_hab_simple  NUMBER(4)     DEFAULT 0 CONSTRAINT nn_hotel_simple NOT NULL,
    num_hab_doble   NUMBER(4)     DEFAULT 0 CONSTRAINT nn_hotel_doble NOT NULL,
    id_empleado     NUMBER CONSTRAINT nn_id_empleado_hotel NOT NULL,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_hotel PRIMARY KEY (id_hotel),
    CONSTRAINT ck_hotel_hab_simple CHECK (num_hab_simple >= 0),
    CONSTRAINT ck_hotel_hab_doble CHECK (num_hab_doble >= 0),
    CONSTRAINT ck_hotel_min_hab CHECK (num_hab_simple + num_hab_doble > 0),
    CONSTRAINT fk_id_empleado FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado)
);
