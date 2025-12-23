
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

