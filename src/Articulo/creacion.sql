CREATE TABLE Articulo (
  id_articulo NUMBER,
  nombre varchar(255) CONSTRAINT nn_nombre_articulo NOT NULL,
  tipo varchar(255) CONSTRAINT nn_tipo_articulo NOT NULL,
  
  CONSTRAINT pk_id_articulo PRIMARY KEY(id_articulo),
  CONSTRAINT ck_tipo_articulo CHECK(tipo IN ('A','B','C','D'))
);