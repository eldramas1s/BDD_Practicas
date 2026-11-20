CREATE TABLE Reservar (
id_cliente NUMBER,
id_hotel NUMBER,
fecha_entrada DATE,
fecha_salida DATE,
--Se usan 2 decimales para el precio por noche, un máximo de 7 cifras no decimales (menos de 10 millones por noche)
precio_por_noche DECIMAL(9, 2),
tipo_hab varchar(255),

CONSTRAINT pk_id_cliente_id_hotel_fecha_entrada PRIMARY KEY(id_cliente, id_hotel, fecha_entrada),
CONSTRAINT fk_id_cliente_reservar FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
CONSTRAINT fk_id_hotel_reservar FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel)
);