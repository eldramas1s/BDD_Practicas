CREATE TABLE PRODUCIR(
    id_proveedor NUMBER,
    id_articulo NUMBER,

    -- Restricciones (Constraints) a nivel de tabla
    CONSTRAINT pk_producir PRIMARY KEY(id_proveedor, id_articulo),
    CONSTRAINT fk_id_proveedor_producir FOREIGN KEY(id_proveedor) REFERENCES PROVEEDOR(id_proveedor),
    CONSTRAINT fk_id_articulo_producir FOREIGN KEY(id_articulo) REFERENCES ARTICULO(id_articulo)
)