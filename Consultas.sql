USE carsell;                                                    -- Selecciona la base de datos CARSELL

-- ================= IGUALDAD ENTERO =================
SELECT *                                                        -- Selecciona todas las columnas
FROM Vehiculos                                                  -- Desde la tabla Vehiculos
WHERE anio = 2022;                                              -- Filtra vehículos del año 2022

-- ================= IGUALDAD CADENA =================

SELECT *                                                        -- Selecciona todos los registros
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE marca = 'Ford';                                           -- Solo vehículos marca Ford

-- ================= MAYOR O IGUAL DECIMAL =================

SELECT *                                                        -- Selecciona todos los campos
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE precio >= 20000;                                          -- Precio mayor o igual a 20000

-- ================= DISTINTO CADENA =================

SELECT *                                                        -- Selecciona todos los registros
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE estadoMecanico <> 'Bueno';                                -- Excluye vehículos nuevos

-- ================= IN =================

SELECT *                                                        -- Selecciona todos los vehículos
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE marca IN ('Ford','Chevrolet','Mazda');                    -- Filtra por varias marcas

-- ================= AND =================

SELECT *                                                        -- Selecciona todos los registros
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE tipo = 'Hatchback'                                            -- Condición 1: tipo sedán
AND precio < 35000;                                             -- Condición 2: precio menor a 20000

-- ================= AND + 3 COLUMNAS =================

SELECT vehiculoID, marca, precio                                -- Selecciona columnas específicas
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE tipo = 'Hatchback'                                            -- Filtra por tipo sedán
AND precio <= 20000;                                            -- Precio máximo 20000

-- ================= AND + 3 COLUMNAS + VISTA =================

CREATE OR REPLACE VIEW vista_sedan_economicos AS                -- Crea o reemplaza una vista
SELECT vehiculoID, marca, precio                                -- Columnas que tendrá la vista
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE tipo like 'Sed%'                                            -- Solo sedanes
AND precio <= 20000;                                            -- Con precio económico

SELECT * FROM vista_sedan_economicos;                           -- Consulta la vista creada

-- ================= OR =================

SELECT *                                                        -- Selecciona todos los registros
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE tipo = 'SUV'                                              -- Vehículos SUV
OR precio > 30000;                                              -- O vehículos caros

-- ================= NOT =================

SELECT *                                                        -- Selecciona todos los registros
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE disponibilidad <> 'Disponible';                           -- Vehículos no disponibles

-- ================= JOIN (CLAVE FORÁNEA) =================

SELECT v.vehiculoID,                                            -- Código del vehículo
       v.marca,                                                 -- Marca del vehículo
       p.nombre AS proveedor                                    -- Nombre del proveedor
FROM Vehiculos v                                                -- Alias v para Vehiculos
JOIN Proveedores p                                              -- JOIN con Proveedores
ON v.proveedorID = p.proveedorID;                               -- Relación por clave foránea

-- ================= JOIN + 3 COLUMNAS + VISTA =================

CREATE OR REPLACE VIEW vista_vehiculos_proveedores AS           -- Crea vista con proveedores
SELECT v.vehiculoID,                                            -- Código del vehículo
       v.marca,                                                 -- Marca
       p.nombre AS proveedor                                    -- Proveedor
FROM Vehiculos v                                                -- Tabla Vehiculos
JOIN Proveedores p                                              -- Tabla Proveedores
ON v.proveedorID = p.proveedorID;                               -- Condición del JOIN

SELECT * FROM vista_vehiculos_proveedores;                      -- Consulta la vista

-- ================= LEFT JOIN =================

SELECT c.nombre,                                                -- Nombre del cliente
       f.facturanumero,                                         -- Número de factura
       f.fechafactura                                           -- Fecha de factura
FROM Clientes c                                                 -- Tabla Clientes
LEFT JOIN facturas f                                            -- LEFT JOIN con facturas
ON c.clienteID = f.clienteID;                                   -- Clientes con o sin factura

-- ================= RIGHT JOIN =================

SELECT v.vehiculoID,                                            -- Código del vehículo
       v.marca,                                                 -- Marca
       p.nombre AS proveedor                                    -- Nombre del proveedor
FROM Vehiculos v                                                -- Tabla Vehiculos
RIGHT JOIN Proveedores p                                        -- RIGHT JOIN con Proveedores
ON v.proveedorID = p.proveedorID;                               -- Incluye proveedores sin vehículos

-- ================= LEFT JOIN AUTOREFERENCIA =================

SELECT c1.nombre AS Cliente1,                                   -- Primer cliente
       c2.nombre AS Cliente2,                                   -- Segundo cliente
       c1.direccion                                             -- Dirección compartida
FROM Clientes c1                                                -- Primera instancia de Clientes
LEFT JOIN Clientes c2                                           -- Segunda instancia (autorreferencia)
ON c1.direccion = c2.direccion                                  -- Misma dirección
AND c1.clienteID <> c2.clienteID;                               -- Evita comparar el mismo cliente

-- ================= ORDER BY DESC =================

SELECT vehiculoID, marca, precio                                -- Columnas seleccionadas
FROM Vehiculos                                                  -- Tabla Vehiculos
ORDER BY precio DESC;                                           -- Ordena por precio descendente

-- ================= ORDER BY ASC Y DESC =================

SELECT marca, modelo, precio                                    -- Columnas seleccionadas
FROM Vehiculos                                                  -- Tabla Vehiculos
ORDER BY marca ASC, precio DESC;                                -- Marca A–Z y precio mayor a menor

-- ================= GROUP BY + COUNT =================

SELECT marca,                                                   -- Marca del vehículo
       COUNT(*) AS cantidad_vehiculos                           -- Cuenta vehículos por marca
FROM Vehiculos                                                  -- Tabla Vehiculos
GROUP BY marca;                                                 -- Agrupa por marca

use carsell;

-- ================= FACTURAS =================

SELECT 
    f.facturanumero,                                            -- Número de factura
    f.fechafactura,                                             -- Fecha de emisión
    c.clienteID,                                                -- ID del cliente
    c.nombre AS cliente,                                        -- Nombre del cliente
    c.telefono,                                                 -- Teléfono
    c.email                                                     -- Correo
FROM facturas f                                                 -- Tabla facturas
JOIN Clientes c                                                 -- Unión con clientes
    ON f.clienteID = c.clienteID;                               -- Relación


-- ================= FACTURAS CON DETALLE =================

SELECT 
    f.facturanumero,                                            -- Número de factura
    f.fechafactura,                                             -- Fecha
    c.nombre AS cliente,                                        -- Cliente
    v.marca,                                                    -- Marca del vehículo
    v.modelo,                                                   -- Modelo del vehículo
    fd.cantidad,                                                -- Cantidad
    fd.precio,                                                  -- Precio unitario
    (fd.cantidad * fd.precio) AS subtotal                       -- Subtotal
FROM facturas f                                                 -- Tabla facturas
JOIN Clientes c                                                 -- Clientes
    ON f.clienteID = c.clienteID
JOIN facturadetalle fd                                          -- Detalle factura
    ON f.facturanumero = fd.facturanumero
JOIN Vehiculos v                                                -- Vehículos
    ON fd.vehiculoID = v.vehiculoID
ORDER BY f.facturanumero;                                       -- Orden


-- ================= TOTAL POR FACTURA =================

SELECT 
    f.facturanumero,                                            -- Número de factura
    f.fechafactura,                                             -- Fecha
    c.nombre AS cliente,                                        -- Cliente
    SUM(fd.cantidad * fd.precio) AS total_factura               -- Total
FROM facturas f                                                 -- Tabla facturas
JOIN Clientes c                                                 -- Clientes
    ON f.clienteID = c.clienteID
JOIN facturadetalle fd                                          -- Detalle
    ON f.facturanumero = fd.facturanumero
GROUP BY 
    f.facturanumero,
    f.fechafactura,
    c.nombre;                                                   -- Agrupación

-- ================= FACTURAS CON DESCUENTO =================

SELECT 
    f.facturanumero,                                            -- Número de factura
    c.nombre AS cliente,                                        -- Cliente
    v.marca,                                                    -- Marca
    v.modelo,                                                   -- Modelo
    fd.precio,                                                  -- Precio original
    IFNULL(cf.descuento,0) AS descuento,                        -- Descuento
    (fd.precio - (fd.precio * IFNULL(cf.descuento,0))) 
        AS precio_final                                         -- Precio final
FROM facturas f                                                 -- Facturas
JOIN Clientes c                                                 -- Clientes
    ON f.clienteID = c.clienteID
JOIN facturadetalle fd                                          -- Detalle
    ON f.facturanumero = fd.facturanumero
JOIN Vehiculos v                                                -- Vehículos
    ON fd.vehiculoID = v.vehiculoID
LEFT JOIN ClientesFrecuentes cf                                 -- Frecuentes
    ON c.clienteID = cf.clienteID 
   AND v.vehiculoID = cf.vehiculoID;                            -- Relación



-- ================= PROYECCIÓN CON COLUMNA CALCULADA =================

SELECT vehiculoID,                                              -- Código del vehículo
       precio,                                                  -- Precio base
       precio * 1.12 AS precio_con_iva                          -- Precio con IVA incluido
FROM Vehiculos;                                                 -- Tabla Vehiculos

-- ================= PROYECCIÓN CON CONCAT =================

SELECT vehiculoID,                                              -- Código del vehículo
       marca,                                                   -- Marca
       CONCAT(marca, ' ', modelo) AS descripcion                -- Marca + modelo concatenados
FROM Vehiculos;                                                 -- Tabla Vehiculos

-- ================= PROYECCIÓN + CONCAT + VISTA =================

CREATE OR REPLACE VIEW vista_descripcion_vehiculos AS           -- Crea vista descriptiva
SELECT vehiculoID,                                              -- Código del vehículo
       marca,                                                   -- Marca
       CONCAT(marca, ' ', modelo, ' - $', precio) 
           AS descripcion_completa                              -- Descripción completa
FROM Vehiculos;                                                 -- Tabla Vehiculos

SELECT * FROM vista_descripcion_vehiculos;                      -- Consulta la vista

-- ================= SUBCONSULTA =================

SELECT nombre                                                   -- Nombre del cliente
FROM Clientes                                                   -- Tabla Clientes
WHERE clienteID = (                                             -- Cliente que coincide con
    SELECT clienteID                                            -- Cliente en factura
    FROM facturas                                               -- Tabla facturas
    WHERE facturanumero = 'FAC0000002'                          -- Factura específica
);

-- ================= FECHA + CURDATE =================

SELECT vehiculoID,                                              -- Código del vehículo
       fechaIngresoInventario,                                  -- Fecha de ingreso
       DATEDIFF(CURDATE(), fechaIngresoInventario) 
           AS dias_en_inventario                                -- Días en inventario
FROM Vehiculos;                                                 -- Tabla Vehiculos

-- ================= FECHA + BETWEEN =================

SELECT vehiculoID, marca, fechaIngresoInventario                -- Columnas seleccionadas
FROM Vehiculos                                                  -- Tabla Vehiculos
WHERE fechaIngresoInventario                                    -- Rango de fechas
BETWEEN '2024-03-01' AND '2024-04-30';

-- ================= IS NULL / IS NOT NULL =================

SELECT nombre, email                                            -- Nombre y correo
FROM Proveedores                                                -- Tabla Proveedores
WHERE telefono IS NOT NULL;                                     -- Proveedores con teléfono

SELECT nombre, email                                            -- Nombre y correo
FROM Proveedores                                                -- Tabla Proveedores
WHERE telefono IS NULL;                                         -- Proveedores sin teléfono

-- ================= DISTINCT =================

SELECT DISTINCT marca                                           -- Marcas sin repetir
FROM Vehiculos;                                                 -- Tabla Vehiculos

-- ================= CASE WHEN =================

SELECT vehiculoID,                                              -- Código del vehículo
       precio,                                                  -- Precio
       CASE                                                     -- Clasificación por precio
           WHEN precio < 15000 THEN 'Económico'
           WHEN precio BETWEEN 15000 AND 30000 THEN 'Gama media'
           ELSE 'Alta gama'
       END AS categoria_precio                                  -- Categoría calculada
FROM Vehiculos;                                                 -- Tabla Vehiculos

-- ================= UNION =================

SELECT marca, modelo                                            -- Vehículos SUV
FROM Vehiculos
WHERE tipo = 'SUV'
UNION                                                           -- Une sin duplicados
SELECT marca, modelo                                            -- Vehículos Sedán
FROM Vehiculos
WHERE tipo = 'Hatchback';

-- ================= EXISTS =================

SELECT nombre                                                   -- Nombre del cliente
FROM Clientes c                                                 -- Tabla Clientes
WHERE EXISTS (                                                  -- Verifica existencia
    SELECT 1
    FROM facturas f                                             -- Tabla facturas
    WHERE f.clienteID = c.clienteID                             -- Cliente con factura
);

use CARSELL;
