DROP DATABASE IF EXISTS miscompras;

CREATE DATABASE miscompras;

USE miscompras;

CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT,
    description VARCHAR(45),
    estado TINYINT,
    CONSTRAINT pk_id_categoria PRIMARY KEY(id_categoria)
);

CREATE TABLE cliente(
    id VARCHAR(20),
    nombre VARCHAR(4),
    apellido VARCHAR(100),
    celular DECIMAL(10.0),
    direccion VARCHAR(80),
    correo_electronico VARCHAR(70),
    CONSTRAINT pk_id_cliente PRIMARY KEY(id)
);

CREATE TABLE compra(
    id_compra INT AUTO_INCREMENT,
    id_cliente VARCHAR(20),
    fecha DATETIME,
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR(1),
    CONSTRAINT pk_id_compra PRIMARY KEY (id_compra),
    CONSTRAINT fk_id_cliente_compras FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE producto(
    id_producto INT AUTO_INCREMENT,
    nombre VARCHAR(45),
    id_categoria INT(11),
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16,2),
    cantidad_stock INT(10),
    estado TINYINT,
    CONSTRAINT pk_id_producto PRIMARY KEY (id_producto),
    CONSTRAINT fk_id_categoria_producto FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE compras_productos(
    id_compra INT(11),
    id_producto INT(11),
    cantidad INT(10),
    total DECIMAL(16,2),
    estado TINYINT,
    CONSTRAINT pk_id_compras_productos PRIMARY KEY (id_compra, id_producto),
    CONSTRAINT fk_id_compra_compro FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    CONSTRAINT fk_id_producto_comprp FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
