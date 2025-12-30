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
('BBB2222','Toyota','Corolla',2021,'Sedán',19500,'Muy bueno','Disponible','2024-07-02','Confiable','PROV001'),
('CCC3333','Nissan','Sentra',2020,'Sedán',17000.00,'Bueno','Disponible','2024-01-15','Económico y confiable','PROV004'),
('DDD4444','Honda','Civic',2021,'Sedán',21000.00,'Muy bueno','Disponible','2024-01-20','Popular y eficiente','PROV002'),
('EEE5555','Kia','Sportage',2022,'SUV',27000.00,'Excelente','Disponible','2024-02-02','SUV versátil','PROV003'),
('FFF6666','Volkswagen','Tiguan',2021,'SUV',26500.00,'Muy bueno','Disponible','2024-02-10','Amplio y cómodo','PROV001'),
('GGG7777','Renault','Duster',2019,'SUV',14000.00,'Bueno','Disponible','2024-02-18','Robusto','PROV005'),
('HHH8888','Peugeot','208',2020,'Hatchback',15500.00,'Bueno','Disponible','2024-02-25','Compacto europeo','PROV004'),
('III9999','Subaru','Forester',2021,'SUV',29500.00,'Excelente','Disponible','2024-03-01','AWD confiable','PROV002'),
('JJJ0001','Ford','Explorer',2020,'SUV',32000.00,'Muy bueno','Disponible','2024-03-08','Espacioso','PROV003'),
('KKK0002','Chevrolet','Onix',2021,'Hatchback',13500.00,'Bueno','Disponible','2024-03-12','Eficiente en ciudad','PROV001'),
('LLL0003','Hyundai','Tucson',2022,'SUV',28500.00,'Excelente','Disponible','2024-03-15','Diseño moderno','PROV004'),
('MMM0004','Mazda','Mazda3',2020,'Sedán',18000.00,'Muy bueno','Disponible','2024-03-20','Deportivo','PROV005'),
('NNN0005','Toyota','RAV4',2022,'SUV',33000.00,'Excelente','Disponible','2024-03-25','Híbrido opcional','PROV002'),
('OOO0006','Honda','HR-V',2021,'SUV',24000.00,'Muy bueno','Disponible','2024-03-28','Compacto urbano','PROV003'),
('PPP0007','Nissan','Kicks',2020,'SUV',16500.00,'Bueno','Disponible','2024-04-03','Eficiente','PROV001'),
('QQQ0008','Volkswagen','Gol',2019,'Hatchback',9000.00,'Bueno','Disponible','2024-04-07','Accesible','PROV004'),
('RRR0009','Renault','Logan',2018,'Sedán',8500.00,'Bueno','Disponible','2024-04-12','Espacioso','PROV005'),
('SSS0010','Kia','Rio',2021,'Sedán',14500.00,'Muy bueno','Disponible','2024-04-16','Eficiencia y estilo','PROV003'),
('TTT0011','Peugeot','3008',2020,'SUV',26000.00,'Muy bueno','Disponible','2024-04-20','Tecnológico','PROV002'),
('UUU0012','Subaru','Impreza',2019,'Sedán',16000.00,'Bueno','Disponible','2024-04-24','AWD compacto','PROV001'),
('VVV0013','Hyundai','Santa Fe',2022,'SUV',34000.00,'Excelente','Disponible','2024-04-28','Familiar','PROV004'),
('WWW0014','Chevrolet','Spark',2020,'Hatchback',8000.00,'Bueno','Disponible','2024-05-02','Ciudadano','PROV005'),
('XXX0015','Ford','EcoSport',2019,'SUV',13500.00,'Bueno','Disponible','2024-05-06','Compacto','PROV003'),
('YYY0016','Toyota','Yaris',2021,'Sedán',15000.00,'Muy bueno','Disponible','2024-05-10','Eficiente','PROV002'),
('ZZZ0017','Mazda','CX-30',2022,'SUV',30000.00,'Excelente','Disponible','2024-05-14','Premium compacto','PROV001'),
('ABX0018','Honda','Accord',2020,'Sedán',25000.00,'Muy bueno','Disponible','2024-05-18','Espacioso y cómodo','PROV004'),
('BCY0019','Nissan','Versa',2021,'Sedán',14000.00,'Muy bueno','Disponible','2024-05-22','Económico','PROV005'),
('CDZ0020','Kia','Seltos',2022,'SUV',26000.00,'Excelente','Disponible','2024-05-26','Juvenil','PROV003'),
('DEW0021','Volkswagen','Jetta',2020,'Sedán',19000.00,'Muy bueno','Disponible','2024-05-30','Clásico','PROV002'),
('EFV0022','Renault','Captur',2021,'SUV',20000.00,'Muy bueno','Disponible','2024-06-03','Estilo urbano','PROV001'),
('FGU0023','Peugeot','2008',2020,'SUV',19500.00,'Muy bueno','Disponible','2024-06-07','Compacto europeo','PROV004'),
('GHT0024','Hyundai','i20',2019,'Hatchback',10000.00,'Bueno','Disponible','2024-06-11','Eficiente','PROV005'),
('HIJ0025','Chevrolet','Tracker',2022,'SUV',24500.00,'Excelente','Disponible','2024-06-15','Tecnología moderna','PROV003'),
('IJK0026','Ford','Fusion',2019,'Sedán',17000.00,'Bueno','Disponible','2024-06-19','Cómodo','PROV002'),
('JKL0027','Toyota','Hilux',2021,'Pickup',32000.00,'Muy bueno','Disponible','2024-06-23','Trabajo pesado','PROV001'),
('KLM0028','Mazda','BT-50',2020,'Pickup',28500.00,'Muy bueno','Disponible','2024-06-27','Robusto','PROV004'),
('LMN0029','Nissan','Frontier',2022,'Pickup',35000.00,'Excelente','Disponible','2024-07-03','Capacidad de carga','PROV005'),
('MNO0030','Kia','Picanto',2019,'Hatchback',7800.00,'Bueno','Disponible','2024-07-07','Compacto','PROV003'),
('NOP0031','Volkswagen','Amarok',2021,'Pickup',36000.00,'Muy bueno','Disponible','2024-07-11','Potente','PROV002'),
('OPQ0032','Renault','Koleos',2020,'SUV',24000.00,'Muy bueno','Disponible','2024-07-15','Confort','PROV001'),
('PQR0033','Peugeot','Partner',2019,'Van',14500.00,'Bueno','Disponible','2024-07-19','Comercial ligera','PROV004'),
('QRS0034','Hyundai','Accent',2021,'Sedán',15000.00,'Muy bueno','Disponible','2024-07-23','Económico','PROV005'),
('RST0035','Chevrolet','Colorado',2020,'Pickup',29500.00,'Muy bueno','Disponible','2024-07-27','Trabajo y ciudad','PROV003'),
('STU0036','Ford','Ranger',2022,'Pickup',36500.00,'Excelente','Disponible','2024-07-31','Off-road','PROV002'),
('TUV0037','Toyota','Fortuner',2021,'SUV',42000.00,'Muy bueno','Disponible','2024-08-04','Capacidad 7 pasajeros','PROV001'),
('UVW0038','Mazda','MX-5',2019,'Convertible',28000.00,'Muy bueno','Disponible','2024-08-08','Deportivo biplaza','PROV004'),
('VWX0039','Nissan','X-Trail',2020,'SUV',23000.00,'Muy bueno','Disponible','2024-08-12','Familiar','PROV005'),
('WXY0040','Kia','Cerato',2021,'Sedán',17500.00,'Muy bueno','Disponible','2024-08-16','Balance precio/valor','PROV003'),
('XYZ0041','Volkswagen','Polo',2022,'Hatchback',17000.00,'Excelente','Disponible','2024-08-20','Moderno y seguro','PROV002'),
('YZA0042','Renault','Sandero',2020,'Hatchback',11000.00,'Bueno','Disponible','2024-08-24','Amplio para su clase','PROV001');


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
('1730002222','Laura Gómez','0992220000','laura@gmail.com','Guayaquil'),
('1730003333','Andrés Torres','0983330000','andres@gmail.com','Cuenca'),
('1730004444','María López','0994440000','maria@gmail.com','Ambato'),
('1730005555','Carlos Ruiz','0985550000','carlos@gmail.com','Manta'),
('1730006666','Sofía Herrera','0996660000','sofia@gmail.com','Loja'),
('1730007777','Diego Castro','0987770000','diego@gmail.com','Quito'),
('1730008888','Valentina Ortiz','0998880000','valentina@gmail.com','Guayaquil'),
('1730009999','Javier Morales','0989990000','javier@gmail.com','Cuenca'),
('1730010000','Fernanda Salazar','0990001111','fernanda@gmail.com','Ambato'),
('1730011111','Mateo Jiménez','0981112222','mateo@gmail.com','Manta'),
('1730012222','Isabela Rojas','0992223333','isabela@gmail.com','Loja'),
('1730013333','Sebastián Vega','0983334444','sebastian@gmail.com','Quito'),
('1730014444','Paula Castillo','0994445555','paula@gmail.com','Guayaquil'),
('1730015555','Gabriel Torres','0985556666','gabriel@gmail.com','Cuenca'),
('1730016666','Daniela Pérez','0996667777','daniela@gmail.com','Ambato'),
('1730017777','Luis Mendoza','0987778888','luis@gmail.com','Manta'),
('1730018888','Carolina Flores','0998889999','carolina@gmail.com','Loja'),
('1730019999','Ricardo Vargas','0989990001','ricardo@gmail.com','Quito'),
('1730020000','Ana Martínez','0990002222','ana@gmail.com','Guayaquil'),
('1730021111','Tomás Herrera','0981113333','tomas@gmail.com','Cuenca'),
('1730022222','Lucía Ramírez','0992224444','lucia@gmail.com','Ambato'),
('1730023333','Martín Silva','0983335555','martin@gmail.com','Manta'),
('1730024444','Camila Torres','0994446666','camila.t@gmail.com','Loja'),
('1730025555','Felipe Gómez','0985557777','felipe@gmail.com','Quito'),
('1730026666','Andrea López','0996668888','andrea@gmail.com','Guayaquil'),
('1730027777','Santiago Ruiz','0987779999','santiago@gmail.com','Cuenca'),
('1730028888','Valeria Ortiz','0998880002','valeria@gmail.com','Ambato'),
('1730029999','Cristian Morales','0989991111','cristian@gmail.com','Manta'),
('1730030000','María Fernanda','0990003333','mfernanda@gmail.com','Loja'),
('1730031111','José Torres','0981114444','jose@gmail.com','Quito'),
('1730032222','Natalia Pérez','0992225555','natalia@gmail.com','Guayaquil'),
('1730033333','David Jiménez','0983336666','david@gmail.com','Cuenca'),
('1730034444','Alejandra Salazar','0994447777','alejandra@gmail.com','Ambato'),
('1730035555','Pablo Herrera','0985558888','pablo@gmail.com','Manta'),
('1730036666','Carla Vega','0996669999','carla@gmail.com','Loja'),
('1730037777','Esteban López','0987770003','esteban@gmail.com','Quito'),
('1730038888','Mónica Torres','0998881111','monica@gmail.com','Guayaquil'),
('1730039999','Hugo Ramírez','0989992222','hugo@gmail.com','Cuenca'),
('1730040000','Patricia Silva','0990004444','patricia@gmail.com','Ambato'),
('1730041111','Rodrigo Gómez','0981115555','rodrigo@gmail.com','Manta'),
('1730042222','Lorena Castillo','0992226666','lorena@gmail.com','Loja'),
('1730043333','Francisco Ruiz','0983337777','francisco@gmail.com','Quito'),
('1730044444','Gabriela Ortiz','0994448888','gabriela@gmail.com','Guayaquil'),
('1730045555','Julio Morales','0985559999','julio@gmail.com','Cuenca'),
('1730046666','Silvia Vega','0996660004','silvia@gmail.com','Ambato'),
('1730047777','Oscar Torres','0987771111','oscar@gmail.com','Manta'),
('1730048888','Daniel Ramírez','0998882222','daniel@gmail.com','Loja'),
('1730049999','Marisol Herrera','0989993333','marisol@gmail.com','Quito');


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
('1730002222','BBB2222',0.20,'VIP','ANU'),
('1730003333','CCC3333',0.15,'Frecuente','TRI'),
('1730004444','DDD4444',0.25,'VIP','SEM'),
('1730005555','EEE5555',0.05,'Ocasional','ANU'),
('1730006666','FFF6666',0.30,'Premium','MEN'),
('1730007777','GGG7777',0.10,'Frecuente','TRI'),
('1730008888','HHH8888',0.20,'VIP','SEM'),
('1730009999','III9999',0.15,'Frecuente','MEN'),
('1730010000','JJJ0001',0.25,'VIP','ANU'),
('1730011111','KKK0002',0.05,'Ocasional','TRI'),
('1730012222','LLL0003',0.30,'Premium','SEM'),
('1730013333','MMM0004',0.10,'Frecuente','MEN'),
('1730014444','NNN0005',0.20,'VIP','ANU');



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

SELECT * FROM facturadetalle;

