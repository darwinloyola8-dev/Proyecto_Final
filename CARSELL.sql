CREATE DATABASE CARSELL;
USE CARSELL;

-- TABLA PROVEEDORES

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

-- TABLA VEHICULOS

CREATE TABLE Vehiculos (
    vehiculoID CHAR(7) PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    año INT,
    tipo VARCHAR(30),
    precio DECIMAL(10,2),
    estadoMecanico VARCHAR(100),
    disponibilidad VARCHAR(20),
    fechaIngresoInventario DATE,
    descripcion VARCHAR(255),
    proveedorID CHAR(10),
    FOREIGN KEY (proveedorID) REFERENCES Proveedores(proveedorID)
);

INSERT INTO Vehiculos VALUES
('NOP4567','Ford','Fiesta',2019,'Hatchback',9500,'Bueno','Disponible','2024-03-05','Eficiente','PROV002'),
('QRS5678','Chevrolet','Trailblazer',2022,'SUV',35000,'Excelente','Disponible','2024-04-10','SUV lujo','PROV002'),
('TUV6789','Hyundai','Elantra',2020,'Sedán',16000,'Muy bueno','Disponible','2024-02-20','Cómodo','PROV003'),
('AAA1111','Mazda','CX-5',2022,'SUV',29000,'Excelente','Disponible','2024-07-01','SUV elegante','PROV001'),
('BBB2222','Toyota','Corolla',2021,'Sedán',19500,'Muy bueno','Disponible','2024-07-02','Confiable','PROV001');


-- TABLA CLIENTES

CREATE TABLE Clientes (
    clienteID CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono CHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

INSERT INTO Clientes VALUES
('1714455667','Camila Vega','0981234567','camila@gmail.com','Quito'),
('1730001111','Juan Pérez','0981110000','juan@gmail.com','Quito'),
('1730002222','Laura Gómez','0992220000','laura@gmail.com','Guayaquil');


-- TABLA CLIENTES FRECUENTES

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
('1730001111','AAA1111',0.10,'Frecuente','MEN'),
('1730002222','BBB2222',0.20,'VIP','ANU');



-- TABLA FACTURAS

CREATE TABLE facturas (
    facturanumero CHAR(10) PRIMARY KEY,
    fechafactura DATE,
    clienteID CHAR(10),
    FOREIGN KEY (clienteID) REFERENCES Clientes(clienteID)
);

INSERT INTO facturas VALUES
('FAC0000001','2024-07-10','1714455667'),
('FAC0000002','2024-07-11','1730001111'),
('FAC0000003','2024-07-12','1730002222');


-- TABLA FACTURA DETALLE

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

INSERT INTO facturadetalle VALUES
('FAC0000001','NOP4567',1,9500.00),
('FAC0000002','AAA1111',1,29000.00),
('FAC0000003','BBB2222',1,19500.00);