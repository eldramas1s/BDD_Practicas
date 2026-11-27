CREATE TABLE Proveedor (
  id_proveedor NUMBER,
  nombre varchar(255) CONSTRAINT nn_nombre_proveedor NOT NULL,
  ciudad varchar(255) CONSTRAINT nn_ciudad_proveedor NOT NULL,
  
  CONSTRAINT pk_id_proveedor PRIMARY KEY(id_proveedor),
  CONSTRAINT ck_ciudad_proveedor CHECK(ciudad IN ('Granada','Sevilla'))
);