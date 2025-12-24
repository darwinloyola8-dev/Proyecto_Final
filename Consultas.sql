
use carsell;

-- Igualdad entero

SELECT *
FROM Vehiculos
WHERE año = 2022;

-- Igualdad cadena

SELECT *
FROM Vehiculos
WHERE marca = 'Ford';

-- Mayor o igual decimal

SELECT *
FROM Vehiculos
WHERE precio >= 20000;

-- Distinto cadena

SELECT *
FROM Vehiculos
WHERE estadoMecanico <> 'Nuevo';

-- IN

SELECT *
FROM Vehiculos
WHERE marca IN ('Ford','Chevrolet','Mazda');

-- AND

SELECT *
FROM Vehiculos
WHERE tipo = 'Sedán'
AND precio < 20000;

-- AND + 3 columnas

SELECT vehiculoID, marca, precio
FROM Vehiculos
WHERE tipo = 'Sedán'
AND precio <= 20000;

-- OR

SELECT *
FROM Vehiculos
WHERE tipo = 'SUV'
OR precio > 30000;

-- NOT

SELECT *
FROM Vehiculos
WHERE disponibilidad <> 'Disponible';

-- JOIN (Vehiculos - Proveedores)

SELECT v.vehiculoID, v.marca, p.nombre AS proveedor
FROM Vehiculos v
JOIN Proveedores p
ON v.proveedorID = p.proveedorID;


-- JOIN + 3 columnas

SELECT v.vehiculoID, v.marca, p.nombre
FROM Vehiculos v
JOIN Proveedores p
ON v.proveedorID = p.proveedorID;


-- LEFT JOIN 

SELECT c.nombre, f.facturanumero, f.fechafactura
FROM Clientes c
LEFT JOIN facturas f
ON c.clienteID = f.clienteID;

--LEFT JOIN entre dos tablas con clave foránea 

SELECT c.clienteID, c.nombre, f.facturanumero, f.fechafactura
FROM Clientes c
LEFT JOIN facturas f
ON c.clienteID = f.clienteID;

--RIGHT JOIN entre dos tablas con clave foránea 

SELECT v.vehiculoID, v.marca, p.nombre AS proveedor
FROM Vehiculos v
RIGHT JOIN Proveedores p
ON v.proveedorID = p.proveedorID;

--LEFT JOIN con auto referencia (self join)

SELECT c1.nombre AS Cliente1, c2.nombre AS Cliente2, c1.direccion
FROM Clientes c1
LEFT JOIN Clientes c2
ON c1.direccion = c2.direccion
AND c1.clienteID <> c2.clienteID;

--Ordenamiento descendente sobre un atributo 

SELECT vehiculoID, marca, precio
FROM Vehiculos
ORDER BY precio DESC;

--Ordenamiento por dos atributos (ASC y DESC) 

SELECT marca, modelo, precio
FROM Vehiculos
ORDER BY marca ASC, precio DESC;

--Agrupamiento + conteo 

SELECT marca, COUNT(*) AS cantidad_vehiculos
FROM Vehiculos
GROUP BY marca;

--Proyección con columna calculada 

SELECT vehiculoID, precio, precio * 1.12 AS precio_con_iva
FROM Vehiculos;

--Proyección con columna calculada 

SELECT vehiculoID, marca, CONCAT(marca, ' ', modelo) AS descripcion
FROM Vehiculos;

-- Vista con información resumida de clientes
CREATE OR REPLACE VIEW vista_clientes_info AS
SELECT 
    clienteID,
    nombre,
    CONCAT(
        'Cliente: ', nombre,
        ' - Teléfono: ', telefono,
        ' - Dirección: ', direccion
    ) AS datos_completos
FROM Clientes;

-- Consulta de la vista
SELECT * FROM vista_clientes_info;


--Subconsulta que retorna un valor (clave foránea) 

SELECT nombre
FROM Clientes
WHERE clienteID = (
    SELECT clienteID
    FROM facturas
    WHERE facturanumero = 'FAC0000002'
);


