CREATE DATABASE CARSELL;
USE CARSELL;

-- TABLA DE PROVEEDORES
CREATE TABLE Proveedores (
    proveedorID CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono CHAR(15),
    email VARCHAR(100) UNIQUE
);

INSERT INTO Proveedores VALUES
('PROV001','AutoImport','Luis Mayorga','0981112233','autoimport@gmail.com'),
('PROV002','ChevyCorp','Andrea Zoto','0993322110','chevycorp@gmail.com'),
('PROV003','Hyundai Ecuador','Carlos Mena','0975544332','hyundai@gmail.com'),
('PROV004','Kia Motors EC','Fernando Ruiz','0967788991','kia@gmail.com'),
('PROV005','Nissan Ecuador','María Torres','0956677889','nissan@gmail.com');


-- TABLA DE VEHICULOS

CREATE TABLE Vehiculos (
    vehiculoID CHAR(7) PRIMARY KEY, -- Placa
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    tipo VARCHAR(30),
    precio DECIMAL(10,2) NOT NULL,
    estadoMecanico VARCHAR(100),
    disponibilidad VARCHAR(20) DEFAULT 'Disponible',
    fechaIngresoInventario DATE,
    descripcion VARCHAR(255),
    proveedorID CHAR(10),
    FOREIGN KEY (proveedorID) REFERENCES Proveedores(proveedorID)
);

INSERT INTO Vehiculos VALUES
('NOP4567','Ford','Fiesta',2019,'Hatchback',9500,'Bueno','Disponible','2024-03-05','Eficiente y económico','PROV002'),
('QRS5678','Chevrolet','Trailblazer',2022,'SUV',35000,'Excelente','Disponible','2024-04-10','SUV de lujo','PROV002'),
('TUV6789','Hyundai','Elantra',2020,'Sedán',16000,'Muy bueno','Disponible','2024-02-20','Sedán cómodo y seguro','PROV003'),
('WXY7890','Kia','Soul',2021,'Hatchback',18000,'Muy bueno','Disponible','2024-03-25','Vehículo moderno','PROV004'),
('ZAB8901','Nissan','Versa',2022,'Sedán',14000,'Excelente','Disponible','2024-05-15','Vehículo económico','PROV005'),
('BCD9012','Toyota','Camry',2023,'Sedán',28000,'Nuevo','Disponible','2024-06-01','Último modelo','PROV001'),
('EFG0123','Honda','Civic',2021,'Sedán',22000,'Muy bueno','Disponible','2024-04-30','Sedán confiable','PROV003'),
('HIJ1234','Ford','Escape',2022,'SUV',32000,'Excelente','Disponible','2024-05-10','SUV familiar','PROV002'),
('KLM2345','Chevrolet','Malibu',2020,'Sedán',20000,'Muy bueno','Disponible','2024-03-18','Vehículo cómodo','PROV002'),
('NOP3456','Hyundai','Santa Fe',2023,'SUV',38000,'Nuevo','Disponible','2024-06-20','SUV premium','PROV003');

-- TABLA DE CLIENTES

CREATE TABLE Clientes (
    clienteID CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono CHAR(15),
    email VARCHAR(100) UNIQUE,
    direccion VARCHAR(150)
);

INSERT INTO Clientes VALUES
('1714455667','Camila Vega','0981234567','camila@gmail.com','Quito, Ecuador'),
('1715566778','Luis Cordero','0992345678','luis@gmail.com','Guayaquil, Ecuador'),
('1716677889','Mariana Salazar','0973456789','mariana@gmail.com','Cuenca, Ecuador'),
('1717788990','Andrés Paredes','0984567890','andres@gmail.com','Ambato, Ecuador'),
('1718899001','Isabel Suárez','0995678901','isabel@gmail.com','Manta, Ecuador'),
('1719900112','Fernando Castillo','0976789012','fernando@gmail.com','Loja, Ecuador'),
('1720011223','Natalia Vargas','0987890123','natalia@gmail.com','Portoviejo, Ecuador'),
('1721122334','Jorge Mora','0998901234','jorge@gmail.com','Machala, Ecuador'),
('1722233445','Paola Rojas','0979012345','paola@gmail.com','Riobamba, Ecuador'),
('1723344556','Ricardo Luna','0980123456','ricardo@gmail.com','Esmeraldas, Ecuador');

--TABLA DE EMPLEADOS

CREATE TABLE Empleados (
    empleadoID CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono CHAR(15),
    email VARCHAR(100) UNIQUE,
    puesto VARCHAR(50) DEFAULT 'Vendedor'
);

INSERT INTO Empleados VALUES
('EMP001','Carlos Mendoza','0981112233','carlos.mendoza@empresa.com','Vendedor'),
('EMP002','María López','0993322110','maria.lopez@empresa.com','Administradora'),
('EMP003','Javier Suarez','0975544332','javier.suarez@empresa.com','Técnico'),
('EMP004','Fernanda Pérez','0987766554','fernanda.perez@empresa.com','Vendedora');


-- TABLA DE CLIENTESFRECUENTES

CREATE TABLE ClientesFrecuentes (
    clienteID CHAR(10),
    vehiculoID CHAR(7),
    descuento DECIMAL(5,2),
    nivelCliente VARCHAR(20),
    frecuenciaCompra CHAR(3),
    PRIMARY KEY (clienteID, vehiculoID),
    FOREIGN KEY (clienteID) REFERENCES Clientes(clienteID),
    FOREIGN KEY (vehiculoID) REFERENCES Vehiculos(vehiculoID)
);

INSERT INTO ClientesFrecuentes VALUES
('1716410210','ABC1234',0.10,'Frecuente','MEN'),
('1710982348','XYZ5678',0.15,'Frecuente','TRI'),
('1716938210','PQR8910',0.20,'VIP','ANU');


--TABLA DE FACTURAS

CREATE TABLE facturas (
    facturanumero CHAR(10) PRIMARY KEY,
    fechafactura DATE,
    clienteID CHAR(10),
    empleadoID CHAR(10),
    total DECIMAL(15,2),
    FOREIGN KEY (clienteID) REFERENCES Clientes(clienteID),
    FOREIGN KEY (empleadoID) REFERENCES Empleados(empleadoID)
);

INSERT INTO facturas VALUES ('0000000001', '2024-12-10', '1716410210', 'EMP001', 16500.00);
INSERT INTO facturas VALUES ('0000000002', '2024-12-11', '1710982348', 'EMP002', 9200.00);
INSERT INTO facturas VALUES ('0000000003', '2024-12-12', '1755582348', 'EMP003', 28500.00);

SELECT * FROM facturas;


-- TABLA DE FACTURADETALLES

CREATE TABLE facturadetalle (
    facturanumero CHAR(10),
    vehiculoID CHAR(7),
    cantidad INT,
    precio DECIMAL(15,2),
    PRIMARY KEY (facturanumero, vehiculoID),
    CHECK (cantidad > 0),
    FOREIGN KEY (facturanumero) REFERENCES facturas(facturanumero),
    FOREIGN KEY (vehiculoID) REFERENCES Vehiculos(vehiculoID)
);

INSERT INTO facturadetalle VALUES ('0000000001', 'ABC1234', 1, 16500.00);
INSERT INTO facturadetalle VALUES ('0000000002', 'XYZ5678', 1, 9200.00);
INSERT INTO facturadetalle VALUES ('0000000003', 'PQR8910', 1, 28500.00);

SELECT * FROM facturadetalle;


--Completo:)