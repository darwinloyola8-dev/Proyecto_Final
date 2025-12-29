
use carsell;

-- IGUALDAD ENTERO

SELECT *
FROM Vehiculos
WHERE año = 2022;

-- IGUALDAD CADENA

SELECT *
FROM Vehiculos
WHERE marca = 'Ford';



-- MAYOR O IGUAL DECIMAL

SELECT *
FROM Vehiculos
WHERE precio >= 20000;



-- DISTINTO CADENA

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



-- AND + 3 COLUMNAS

SELECT vehiculoID, marca, precio
FROM Vehiculos
WHERE tipo = 'Sedán'
AND precio <= 20000;



-- AND + 3 COLUMNAS + VISTA

CREATE OR REPLACE VIEW vista_sedan_economicos AS
SELECT vehiculoID, marca, precio
FROM Vehiculos
WHERE tipo = 'Sedán'
AND precio <= 20000;

SELECT * FROM vista_sedan_economicos;



-- OR

SELECT *
FROM Vehiculos
WHERE tipo = 'SUV'
OR precio > 30000;



-- NOT

SELECT *
FROM Vehiculos
WHERE disponibilidad <> 'Disponible';



-- JOIN (CLAVE FORÁNEA)

SELECT v.vehiculoID, v.marca, p.nombre AS proveedor
FROM Vehiculos v
JOIN Proveedores p
ON v.proveedorID = p.proveedorID;


-- JOIN + 3 COLUMNAS + VISTA

CREATE OR REPLACE VIEW vista_vehiculos_proveedores AS
SELECT 
    v.vehiculoID,
    v.marca,
    p.nombre AS proveedor
FROM Vehiculos v
JOIN Proveedores p
ON v.proveedorID = p.proveedorID;

SELECT * FROM vista_vehiculos_proveedores;



-- LEFT JOIN

SELECT c.nombre, f.facturanumero, f.fechafactura
FROM Clientes c
LEFT JOIN facturas f
ON c.clienteID = f.clienteID;



--RIGHT JOIN entre dos tablas con clave foránea 

SELECT v.vehiculoID, v.marca, p.nombre AS proveedor
FROM Vehiculos v
RIGHT JOIN Proveedores p
ON v.proveedorID = p.proveedorID;



-- LEFT JOIN AUTOREFERENCIA

SELECT c1.nombre AS Cliente1, c2.nombre AS Cliente2, c1.direccion
FROM Clientes c1
LEFT JOIN Clientes c2
ON c1.direccion = c2.direccion
AND c1.clienteID <> c2.clienteID;



-- ORDER BY DESC

SELECT vehiculoID, marca, precio
FROM Vehiculos
ORDER BY precio DESC;



-- ORDER BY ASC Y DESC

SELECT marca, modelo, precio
FROM Vehiculos
ORDER BY marca ASC, precio DESC;



-- GROUP BY + COUNT

SELECT marca, COUNT(*) AS cantidad_vehiculos
FROM Vehiculos
GROUP BY marca;



-- PROYECCIÓN CON COLUMNA CALCULADA (MATEMÁTICA)

SELECT vehiculoID, precio, precio * 1.12 AS precio_con_iva
FROM Vehiculos;



-- PROYECCIÓN CON CONCAT

SELECT vehiculoID, marca, CONCAT(marca, ' ', modelo) AS descripcion
FROM Vehiculos;



-- PROYECCIÓN + CONCAT + VISTA

CREATE OR REPLACE VIEW vista_descripcion_vehiculos AS
SELECT 
    vehiculoID,
    marca,
    CONCAT(marca, ' ', modelo, ' - $', precio) AS descripcion_completa
FROM Vehiculos;

SELECT * FROM vista_descripcion_vehiculos;



-- SUBCONSULTA (CLAVE FORÁNEA)

SELECT nombre
FROM Clientes
WHERE clienteID = (
    SELECT clienteID
    FROM facturas
    WHERE facturanumero = 'FAC0000002'
);



-- FECHA + CURDATE

SELECT 
    vehiculoID,
    fechaIngresoInventario,
    DATEDIFF(CURDATE(), fechaIngresoInventario) AS dias_en_inventario
FROM Vehiculos;



-- FECHA + BETWEEN

SELECT vehiculoID, marca, fechaIngresoInventario
FROM Vehiculos
WHERE fechaIngresoInventario 
BETWEEN '2024-03-01' AND '2024-04-30';



-- IS NULL / IS NOT NULL

SELECT nombre, email
FROM Proveedores
WHERE telefono IS NOT NULL;

SELECT nombre, email
FROM Proveedores
WHERE telefono IS NULL;




-- DISTINCT

SELECT DISTINCT marca
FROM Vehiculos;


-- CASE WHEN THEN ELSE

SELECT 
    vehiculoID,
    precio,
    CASE
        WHEN precio < 15000 THEN 'Económico'
        WHEN precio BETWEEN 15000 AND 30000 THEN 'Gama media'
        ELSE 'Alta gama'
    END AS categoria_precio
FROM Vehiculos;


-- UNION

SELECT marca, modelo
FROM Vehiculos
WHERE tipo = 'SUV'
UNION
SELECT marca, modelo
FROM Vehiculos
WHERE tipo = 'Sedán';


-- EXISTS

SELECT nombre
FROM Clientes c
WHERE EXISTS (
    SELECT 1
    FROM facturas f
    WHERE f.clienteID = c.clienteID
);
