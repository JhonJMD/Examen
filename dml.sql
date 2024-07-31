--Inserts Categoria
INSERT INTO categoria(description, estado)
VALUES ('Comestibles', 1), ('Aseo', 2), ('Electronicos', 1), ('Bebidas', 2);

--Inserts Clientes
INSERT INTO cliente(id, nombre, apellido, celular, direccion, correo_electronico)
VALUES ('111', 'John', 'Dee', 3124198288, 'Avenida PM casa QLI', 'johndee@gmail.com'), 
('112', 'Juna', 'Sr', 3134199299, 'CRA PM APTO MMG', 'junasr@gmail.com'),
('113', 'Marce', 'Doña', 3144190255, 'CALLE PM casa LQ', 'marcedoña@gmail.com');

--Inserts Productos
INSERT INTO producto(nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Carne',1,'CR12345',12000,2000,1),
('Cloro',2,'CL12345',7860,500,1),
('PC',3,'PC12345',3000000,50,1),
('Cerveza',4,'CE12345',3000,5000,1);

--Inserts Compras
INSERT INTO compra(id_cliente, fecha, medio_pago, comentario, estado)
VALUES ('111',CURDATE(),'T','Comentario 1','A'),
('112',CURDATE(),'E','Comentario 2','A'),
('113',CURDATE(),'T','Comentario 3','C'),
('111',CURDATE(),'T','Comentario 4','A');

--Inserts Compras Productos
INSERT INTO compras_productos(id_compra, id_producto, cantidad, total, estado)
VALUES (1,1,3,36000,1),(2,2,5,40000,1),(3,3,2,6000000,2),(4,4,10,30000,1);

--Consultas Basicas
--1
SELECT 
    p.nombre AS producto, 
    p.codigo_barras, 
    p.precio_venta, 
    p.cantidad_stock, 
    p.estado, 
    c.id_categoria, 
    c.description, 
    c.estado
FROM producto p
JOIN categoria c ON p.id_categoria = c.id_categoria;

--2
SELECT
    c.id_compra,
    c.fecha,
    c.medio_pago,
    c.comentario,
    c.estado,
    cli.id,
    CONCAT(cli.nombre, ' ', cli.apellido) AS cliente
FROM compra c 
JOIN cliente cli ON cli.id = c.id_cliente
GROUP BY c.id_compra;

--3
SELECT
    p.nombre AS producto,
    cp.id_compra,
    cp.cantidad,
    cp.total,
    cp.estado
FROM compras_productos cp
JOIN producto p ON cp.id_producto = p.id_producto
JOIN compra c ON cp.id_compra = c.id_compra
WHERE c.id_compra = 1;

--4
INSERT INTO producto(nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Pollo',1,'PO12345',15000,2500,1);

--5
UPDATE producto
SET cantidad_stock = 1500
WHERE id_producto = 5;

--6
SELECT 
    c.id_compra, 
    c.id_cliente, 
    c.fecha,
    c.medio_pago,
    c.comentario,
    c.estado
FROM compra c 
WHERE c.id_cliente = '111';

--7
SELECT 
    cli.id,
    CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
    cli.correo_electronico
FROM cliente cli
GROUP BY cli.id;

--8
SELECT 
    COUNT(cp.id_producto) AS cantidad_productos, 
    cp.id_compra
FROM compras_productos cp
GROUP BY cp.id_compra;

--9
SELECT 
    c.id_compra,
    c.id_cliente,
    c.fecha,
    c.medio_pago,
    c.comentario,
    c.estado
FROM compra c 
WHERE c.fecha BETWEEN '2024-07-01 00:00:00' AND '2024-07-31 00:00:00';

--Consultas funciones agregadas
--1
SELECT 
    COUNT(p.id_producto) AS cantidad,
    c.id_categoria, 
    c.description,
    c.estado
FROM categoria c 
JOIN producto p ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria;