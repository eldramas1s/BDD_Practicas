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