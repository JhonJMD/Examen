# Examen SQL 2 

![img](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcTWPTa8baXhCqDWOKbCPt0o_OgFgNMRzuGS6DlKmxKz53bYrGmVTPtWxcNcTpdWp4m5t6rgyXYP-1eQznmU2qRlhDtevbXhYmQ1C-T_T7NehGg0AgqjpyzMsTO_sLwt0Watui714Zw_bAqkuLXuVY2TtI?key=Dw1hpLaCgRtTJfwyQCknyw)

## **Consultas Básicas** 

- Consultar todos los productos y sus categorías 

  ```SQL
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
  ```

- Consultar todas las compras y los clientes que las realizaron 

  ```SQL
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
  ```

- Consultar los productos comprados en una compra específica 

  ```SQL
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
  ```

- Agregar un nuevo producto 

  ```SQL
  INSERT INTO producto(nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
  VALUES ('Pollo',1,'PO12345',15000,2500,1);
  ```

- Actualizar el stock de un producto 

  ```SQL
  UPDATE producto
  SET cantidad_stock = 1500
  WHERE id_producto = 5;
  ```

- Consultar todas las compras de un cliente específico 

  ```SQL
  SELECT 
      c.id_compra, 
      c.id_cliente, 
      c.fecha,
      c.medio_pago,
      c.comentario,
      c.estado
  FROM compra c 
  WHERE c.id_cliente = '111';
  ```

- Consultar todos los clientes y sus correos electrónicos 

  ```SQL
  SELECT 
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
      cli.correo_electronico
  FROM cliente cli
  GROUP BY cli.id;
  ```

- Consultar la cantidad total de productos comprados en cada compra 

  ```SQL
  SELECT 
      COUNT(cp.id_producto) AS cantidad_productos, 
      cp.id_compra
  FROM compras_productos cp
  GROUP BY cp.id_compra;
  ```

- Consultar las compras realizadas en un rango de fechas 

  ```SQL
  SELECT 
      c.id_compra,
      c.id_cliente,
      c.fecha,
      c.medio_pago,
      c.comentario,
      c.estado
  FROM compra c 
  WHERE c.fecha BETWEEN '2024-07-01 00:00:00' AND '2024-07-31 00:00:00';
  ```

## **Consultas usando funciones agregadas** 

- Contar la cantidad de productos por categoría 

  ```SQL
  SELECT 
      COUNT(p.id_producto) AS cantidad,
      c.id_categoria, 
      c.description,
      c.estado
  FROM categoria c 
  JOIN producto p ON p.id_categoria = c.id_categoria
  GROUP BY c.id_categoria;
  ```

- Calcular el precio total de ventas por cada cliente 

  ```SQL
  SELECT
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
      SUM(cp.total) AS total
  FROM cliente cli
  JOIN compra c ON c.id_cliente = cli.id
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY cli.id;
  ```

- Calcular el precio promedio de los productos por categoría 

  ```SQL
  SELECT
      c.id_categoria,
      c.description,
      AVG(p.precio_venta) AS promedio
  FROM categoria c 
  JOIN producto p ON c.id_categoria = p.id_categoria
  GROUP BY c.id_categoria;
  ```

- Encontrar la fecha de la primera y última compra registrada 

  ```SQL
  SELECT
      MIN(c.fecha) AS primera_fecha,
      MAX(c.fecha) AS ultima_fecha
  FROM compra c;
  ```

- Calcular el total de ingresos por ventas 

  ```SQL
  SELECT 
      cp.id_compra,
      cp.id_producto,
      SUM(cp.total) AS Ingresos
  FROM compras_productos cp
  GROUP BY cp.id_producto, cp.id_compra;
  ```

- Contar la cantidad de compras realizadas por cada medio de pago 

  ```SQL
  SELECT
      c.medio_pago,
      COUNT(c.id_compra) AS total
  FROM compra c
  GROUP BY c.medio_pago;
  ```

- Calcular el total de productos vendidos por cada producto 

  ```SQL
  SELECT
      p.id_producto,
      p.nombre, 
      SUM(cp.cantidad) AS total
  FROM producto p 
  JOIN compras_productos cp ON cp.id_producto = p.id_producto
  GROUP BY p.id_producto;
  ```

- Obtener el promedio de cantidad de productos comprados por compra 

  ```SQL
  SELECT
      p.id_producto,
      p.nombre,
      AVG(cp.cantidad) AS promedio
  FROM producto p
  JOIN compras_productos cp ON cp.id_producto = p.id_producto
  GROUP BY p.id_producto;
  ```

- Encontrar los productos con el stock más bajo 

  ```SQL
  SELECT
      p.id_producto,
      p.nombre,
      p.cantidad_stock
  FROM producto p
  WHERE p.cantidad_stock = (
      SELECT 
          MIN(p.cantidad_stock)
      FROM producto p
  );
  ```

- Calcular el total de productos comprados y el total gastado por cliente 

  ```SQL
  SELECT
      cli.id,
      SUM(cp.cantidad) AS total_comprado,
      SUM(cp.total) AS total_gastado
  FROM cliente cli 
  JOIN compra c ON c.id_cliente = cli.id
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY cli.id;
  ```

## **Consultas usando Join**

- Consultar todos los productos con sus categorías 

  ```SQL
  SELECT 
      p.id_producto, 
      p.nombre AS producto,
      p.codigo_barras,
      p.precio_venta,
      p.cantidad_stock,
      c.description
  FROM producto p
  JOIN categoria c ON c.id_categoria = p.id_categoria;
  ```

- Consultar todas las compras y los clientes que las realizaron 

  ```SQL
  SELECT
      c.id_compra,
      c.fecha,
      c.medio_pago,
      c.comentario,
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente
  FROM compra c 
  JOIN cliente cli ON cli.id = c.id_cliente;
  ```

- Consultar los productos comprados en cada compra 

  ```SQL
  SELECT 
      cp.id_producto,
      cp.id_compra,
      p.nombre AS producto
  FROM compras_productos cp 
  JOIN producto p ON p.id_producto = cp.id_producto;
  ```

- Consultar las compras realizadas por un cliente específico 

  ```SQL
  SELECT 
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
      c.id_compra,
      c.fecha,
      c.medio_pago,
      c.comentario,
      c.estado
  FROM cliente cli
  JOIN compra c ON c.id_cliente = cli.id
  WHERE cli.id = '111';
  ```

- Consultar el total gastado por cada cliente 

  ```SQL
  SELECT
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
      SUM(cp.total) AS total_gastado
  FROM cliente cli
  JOIN compra c ON c.id_cliente = cli.id
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY cli.id; 
  ```

- Consultar el stock disponible de productos y su categoría 

  ```SQL
  SELECT 
      p.id_producto,
      p.nombre AS producto,
      p.cantidad_stock,
      c.id_categoria,
      c.description
  FROM producto p 
  JOIN categoria c ON c.id_categoria = p.id_categoria;
  ```

- Consultar los detalles de compras junto con la información del cliente y el producto 

  ```SQL
  SELECT
      cp.id_compra, 
      cp.id_producto,
      cli.id,
      cp.cantidad, 
      cp.total, 
      cp.estado,
      p.nombre AS producto, 
      p.precio_venta,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
      cli.celular,
      cli.direccion,
      cli.correo_electronico
  FROM cliente cli
  JOIN compra c ON c.id_cliente = cli.id
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  JOIN producto p ON p.id_producto = cp.id_producto;
  ```

- Consultar los productos que han sido comprados por más de una cantidad específica 

  ```SQL
  SELECT 
      p.id_producto,
      p.nombre AS producto,
      cp.cantidad AS cantidad_comprada
  FROM producto p
  JOIN compras_productos cp ON cp.id_producto = p.id_producto
  WHERE cp.cantidad >= 10;
  ```

- Consultar la cantidad total de productos vendidos por categoría 

  ```SQL
  SELECT
      c.id_categoria,
      c.description, 
      SUM(cp.cantidad) AS total_vendidos
  FROM categoria c
  JOIN producto p ON p.id_categoria = c.id_categoria
  JOIN compras_productos cp ON cp.id_producto = p.id_producto
  GROUP BY c.id_categoria;
  ```

- Consultar los clientes que han realizado compras en un rango de fechas específico 

  ```SQL
  SELECT 
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente, 
      c.fecha
  FROM cliente cli
  JOIN compra c ON cli.id = c.id_cliente
  WHERE c.fecha BETWEEN '2024-07-01 00:00:00' AND '2024-07-31 00:00:00';
  ```

- Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados 

  ```SQL
  SELECT
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente, 
      SUM(cp.total) AS total_gastado,
      COUNT(c.id_compra) AS productos
  FROM cliente cli
  JOIN compra c ON c.id_cliente = cli.id 
  JOIN compras_productos cp ON cp.id_compra = c.id_compra
  GROUP BY cli.id;
  ```

- Consultar los productos que nunca han sido comprados 

  ```SQL
  SELECT 
      p.id_producto,
      p.nombre AS producto
  FROM producto p
  LEFT JOIN compras_productos cp ON p.id_producto = cp.id_producto
  WHERE cp.id_producto IS NULL;
  ```

- Consultar los clientes que han realizado más de una compra y el total gastado por ellos 

  ```SQL
  SELECT 
      cli.id,
      CONCAT(cli.nombre, ' ', cli.apellido) AS cliente, 
      SUM(cp.total) AS total_gastado,
      COUNT(c.id_compra) AS compras
  FROM cliente cli
  JOIN compra c ON c.id_cliente = cli.id
  JOIN compras_productos cp ON cp.id_compra = c.id_cliente
  GROUP BY c.id_compra
  HAVING COUNT(c.id_compra) > 1;
  ```

- Consultar los productos más vendidos por categoría 

  ```SQL
  
  ```

- Consultar las compras realizadas por clientes de una ciudad específica y el total gastado 

  ```SQL
  
  ```

- Consultar los proveedores que han suministrado productos y la cantidad total suministrada 

  ```SQL
  
  ```

## **Subconsultas** 

- Consultar los productos que tienen un precio de venta superior al precio promedio de todos los productos 

  ```SQL
  
  ```

- Consultar los clientes que han gastado más del promedio general en sus compras 

  ```SQL
  
  ```

- Consultar las categorías que tienen más de 5 productos 

  ```SQL
  
  ```

- Consultar los productos más vendidos (top 5) por categoría 

  ```SQL
  
  ```

- Consultar los clientes que han realizado compras en los últimos 30 días 

  ```SQL
  
  ```

- Consultar las compras y sus productos para un cliente específico, mostrando solo las compras más recientes 

  ```SQL
  
  ```

- Consultar las categorías que tienen productos con un stock por debajo del promedio general

  ```SQL
  
  ```

- Consultar los productos que han sido comprados por todos los clientes 

  ```SQL
  
  ```

- Consultar las compras que tienen más productos que el promedio de productos por compra 

  ```SQL
  
  ```

- Consultar los productos que se han vendido menos de la cantidad promedio de productos vendidos 

  ```SQL
  
  ```

  