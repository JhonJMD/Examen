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
  
  ```

- Calcular el precio promedio de los productos por categoría 

  ```SQL
  
  ```

- Encontrar la fecha de la primera y última compra registrada 

  ```SQL
  
  ```

- Calcular el total de ingresos por ventas 

  ```SQL
  
  ```

- Contar la cantidad de compras realizadas por cada medio de pago 

  ```SQL
  
  ```

- Calcular el total de productos vendidos por cada producto 

  ```SQL
  
  ```

- Obtener el promedio de cantidad de productos comprados por compra 

  ```SQL
  
  ```

- Encontrar los productos con el stock más bajo 

  ```SQL
  
  ```

- Calcular el total de productos comprados y el total gastado por cliente 

  ```SQL
  
  ```

## **Consultas usando Join**

- Consultar todos los productos con sus categorías Consultar todas las compras y los clientes que las realizaron 

  ```SQL
  
  ```

- Consultar los productos comprados en cada compra 

  ```SQL
  
  ```

- Consultar las compras realizadas por un cliente específico 

  ```SQL
  
  ```

- Consultar el total gastado por cada cliente 

  ```SQL
  
  ```

- Consultar el stock disponible de productos y su categoría 

  ```SQL
  
  ```

- Consultar los detalles de compras junto con la información del cliente y el producto 

  ```SQL
  
  ```

- Consultar los productos que han sido comprados por más de una cantidad específica 

  ```SQL
  
  ```

- Consultar la cantidad total de productos vendidos por categoría 

  ```SQL
  
  ```

- Consultar los clientes que han realizado compras en un rango de fechas específico 

  ```SQL
  
  ```

- Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados 

  ```SQL
  
  ```

- Consultar los productos que nunca han sido comprados 

  ```SQL
  
  ```

- Consultar los clientes que han realizado más de una compra y el total gastado por ellos Consultar los productos más vendidos por categoría 

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

  