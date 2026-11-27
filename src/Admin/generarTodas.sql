-- Articulo
CREATE TABLE Articulo (
  id_articulo NUMBER,
  nombre varchar(255) CONSTRAINT nn_nombre_articulo NOT NULL,
  tipo varchar(255) CONSTRAINT nn_tipo_articulo NOT NULL,
  
  CONSTRAINT pk_id_articulo PRIMARY KEY(id_articulo),
  CONSTRAINT ck_tipo_articulo CHECK(tipo IN ('A','B','C','D'))
);

-- Proveedor
CREATE TABLE Proveedor (
  id_proveedor NUMBER,
  nombre varchar(255) CONSTRAINT nn_nombre_proveedor NOT NULL,
  ciudad varchar(255) CONSTRAINT nn_ciudad_proveedor NOT NULL,
  
  CONSTRAINT pk_id_proveedor PRIMARY KEY(id_proveedor),
  CONSTRAINT ck_ciudad_proveedor CHECK(ciudad IN ('Granada','Sevilla'))
);

-- Empleado
CREATE TABLE Empleado (
  id_empleado NUMBER,
  nombre varchar(255) CONSTRAINT nn_nombre_empleado NOT NULL,
  dni varchar(9) NOT NULL,
  telefono int,
  direccion varchar(255),
  fecha_contrato_multi date,
  
  CONSTRAINT pk_id_empleado PRIMARY KEY(id_empleado)
);

-- Hotel
CREATE TABLE HOTEL (
    id_hotel        NUMBER,
    nombre          VARCHAR2(100) CONSTRAINT nn_hotel_nombre NOT NULL,
    ciudad          VARCHAR2(60)  CONSTRAINT nn_hotel_ciudad NOT NULL,
    provincia       VARCHAR2(60)  CONSTRAINT nn_hotel_provincia NOT NULL,
    num_hab_simple  NUMBER(4)     DEFAULT 0 CONSTRAINT nn_hotel_simple NOT NULL,
    num_hab_doble   NUMBER(4)     DEFAULT 0 CONSTRAINT nn_hotel_doble NOT NULL,
    id_director     NUMBER CONSTRAINT nn_id_director_hotel NOT NULL,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_hotel PRIMARY KEY (id_hotel),
    CONSTRAINT ck_hotel_hab_simple CHECK (num_hab_simple >= 0),
    CONSTRAINT ck_hotel_hab_doble CHECK (num_hab_doble >= 0),
    CONSTRAINT ck_hotel_min_hab CHECK (num_hab_simple + num_hab_doble > 0),
    CONSTRAINT fk_id_director FOREIGN KEY(id_director) REFERENCES EMPLEADO(id_empleado),
    CONSTRAINT unique_director UNIQUE (id_director)
);


-- Cliente
CREATE TABLE CLIENTE(
    id_cliente NUMBER,
    dni varchar(9) CONSTRAINT nn_dni_cliente NOT NULL,
    telefono NUMBER(15),
    nombre varchar(255) CONSTRAINT nn_nombre_cliente NOT NULL,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT ck_telefono_cliente CHECK (telefono BETWEEN 1000000 AND 999999999999999)

);

-- Producir
CREATE TABLE PRODUCIR(
    id_proveedor NUMBER,
    id_articulo NUMBER,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_producir PRIMARY KEY(id_proveedor, id_articulo),
    CONSTRAINT fk_id_proveedor_producir FOREIGN KEY(id_proveedor) REFERENCES PROVEEDOR(id_proveedor),
    CONSTRAINT fk_id_articulo_producir FOREIGN KEY(id_articulo) REFERENCES ARTICULO(id_articulo)
);

-- Suministrar
CREATE TABLE SUMINISTRAR(
    id_proveedor NUMBER,
    id_articulo NUMBER,
    id_hotel NUMBER,
    fecha_suministro DATE CONSTRAINT nn_fecha_suministro_suministrar NOT NULL,
    cantidad NUMBER CONSTRAINT nn_cantidad_suministrar NOT NULL,
    precio_unidad DECIMAL(9,2) CONSTRAINT nn_precio_unidad_suministrar NOT NULL,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_suministrar PRIMARY KEY(id_proveedor, id_articulo, id_hotel, fecha_suministro),
    CONSTRAINT fk_id_proveedor_articulo_suministrar FOREIGN KEY(id_proveedor,id_articulo) REFERENCES PRODUCIR(id_proveedor,id_articulo),
    CONSTRAINT fk_id_hotel_suministrar FOREIGN KEY(id_hotel) REFERENCES HOTEL(id_hotel)

);

-- Reservar
CREATE TABLE Reservar (
    id_cliente NUMBER,
    id_hotel NUMBER,
    fecha_entrada DATE,
    fecha_salida DATE,
    --Se usan 2 decimales para el precio por noche, un máximo de 7 cifras no decimales (menos de 10 millones por noche)
    precio_por_noche DECIMAL(9, 2) CONSTRAINT nn_precio_por_noche_reservar NOT NULL,
    tipo_hab varchar(255) CONSTRAINT nn_tipo_hab_reservar NOT NULL,

    CONSTRAINT pk_id_cliente_id_hotel_fecha_entrada PRIMARY KEY(id_cliente, id_hotel, fecha_entrada),
    CONSTRAINT fk_id_cliente_reservar FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    CONSTRAINT fk_id_hotel_reservar FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel),
    CONSTRAINT ck_tipo_hab_reservar CHECK(tipo_hab IN ('sencilla','doble'))
);

-- Trabajar
CREATE TABLE Trabajar (
    id_empleado NUMBER,
    fecha_asignacion DATE,
    id_hotel NUMBER,
    fecha_finalizacion DATE,
    --Se usan 2 decimales para el salario, un máximo de 8 cifras no decimales (menos de 10 millones por noche)
    salario DECIMAL(10, 2) CONSTRAINT nn_salario_trabajar NOT NULL,

    CONSTRAINT pk_id_empleado_fecha_asignacion PRIMARY KEY(id_empleado, fecha_asignacion),
    CONSTRAINT fk_id_empleado_trabajar FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    CONSTRAINT fk_id_hotel_trabajar FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel),
    CONSTRAINT ck_salario_trabajar CHECK(salario>=0)
);

