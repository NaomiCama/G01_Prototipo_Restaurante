CREATE DATABASE Restaurante_Prototipo
DEFAULT CHARACTER SET UTF8MB4;
/* Usando la base de datos */

USE Restaurante_Prototipo;
/* Creando las tablas */
CREATE table Ubigeo(
	Cod_Ubigeo INT AUTO_INCREMENT,
	Departamento VARCHAR(70) NOT NULL,
	Provincia VARCHAR(70) NOT NULL,
    Distrito VARCHAR(70) NOT NULL,
	PRIMARY KEY (Cod_Ubigeo)
);

INSERT INTO Ubigeo (Cod_Ubigeo , Departamento , Provincia, Distrito)
VALUES ('1', 'Lima' , 'Cañete' , 'SanVicente'),
	   ('2', 'Apurimac' , 'Abancay' , 'Curasco'),
	   ('3', 'Arequipa' , 'Provincia de Arequipa' , 'Characato'),
       ('4', 'Cajamarca' , 'Yakanora' , 'Asuncion'),
       ('5', 'Lambayeque' , 'Chiclayo' , 'Jayanca'),
       ('6', 'Tumbes' , 'Tumbes' , 'La cruz'),
       ('7', 'Tacna' , 'Tacna' , 'Calana'),
       ('8', 'Puno' , 'Puno' , 'Acora'),
       ('9', 'Piura' , 'Piura' , 'Castilla'),
       ('10', 'Pasco' , 'Huachon' , 'Pasco');
       


CREATE table Cliente(
	Id_Cliente INT AUTO_INCREMENT,
    Cod_Ubigeo INT,
	Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(40),
    Ap_Materno VARCHAR(40),
    Telefono char(9),
    Correo VARCHAR(50),
	PRIMARY KEY (Id_Cliente),
	foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo)
);

INSERT INTO Cliente (Id_Cliente  ,  Cod_Ubigeo , Nombre , Ap_Paterno,Ap_Materno,Telefono,Correo)
VALUES ('1', '1' , 'Abel' , 'Mamani','Huascar','989008703','mamani@gmail.com'),
 ('2', '2' , 'Jhanpool' , 'Pancrasio','Condori','923434656','condori@gmail.com'),
 ('3', '3' , 'Rey' , 'Quispe','Lara','934452234','Rqquispe@gmail.com'),
 ('4', '4' , 'Yakanora' , 'Asuncion','Vilchez','978457347','yakanora@gmail.com'),
 ('5', '5' , 'Cecilia' , 'Caceres','Flores','923536234','caceres@gmail.com'),
 ('6', '6' , 'Esteban' , 'Rigoberto','Perez','975637671','RigoEs@gmail.com'),
 ('7', '7' , 'Naomi' , 'Bautista','Paucar','964267483','Bnaomi@gmail.com'),
 ('8', '8' , 'Jeremias' , 'Pantano','Vergara','953625367','jpantano@gmail.com'),
 ('9', '9' , 'Anacleta' , 'Hurtado','Levano','964836583','Hurtado@gmail.com'),
 ('10', '10' , 'Pedro' , 'Castle','Huamanripa','964836432','Pedro@gmail.com');


CREATE table Empleado(
	Id_Empleado INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Cod_Ubigeo INT,
    Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(30),
    Ap_Materno VARCHAR(30),
    Telefono char(9),
    Horario varchar(10),
	PRIMARY KEY (Id_Empleado),
    foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo),
    foreign key (Id_Cliente) references Cliente(Id_Cliente)
);

INSERT INTO Empleado (Id_Empleado  , Id_Cliente , Cod_Ubigeo  , Nombre ,Ap_Paterno, Ap_Materno,Telefono,Horario)
VALUES ('1', '1' , '1' , 'Alma','Astocondor','Atoche','974687432','tarde'),
('2', '2' , '2' , 'Jett','Robles','Zambrano','975738742','tarde'),
('3', '3' , '3' , 'Benito','Yupanqui','Casas','954783867','noche'),
('4', '4' , '4' , 'Consuelo','Jimenes','Ladrillo','973654236','mañana'),
('5', '5' , '5' , 'Angel','Ibarra','Yataco','968264873','madrugada'),
('6', '6' , '6' , 'Andrea','Contreras','Fernandez','964827473','noche'),
('7', '7' , '7' , 'Brenda','Camayo','Carhuancho','976489267','tarde'),
 ('8', '8' , '8' , 'Arnold','Moreno','Beltran','954827464','madrugada'),
 ('9', '9' , '9' , 'Brigeet','Rosas','Melano','962876826','noche'),
 ('10', '10' , '10' , 'Dario','Acuña','Vilca','964827437','noche');

CREATE table Pedido(
	Id_Pedido INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Id_Empleado INT,
	Nombre VARCHAR(30),
    Cantidad int,
	PRIMARY KEY (Id_Pedido),
    foreign key (Id_Cliente) references Cliente(Id_Cliente),
    foreign key (Id_Empleado) references Empleado(Id_Empleado)
);

INSERT INTO Pedido (Id_Pedido , Id_Cliente , Id_Empleado,Nombre,Cantidad)
VALUES ('1', '1' , '1' , 'PedidoLocal','1'),
('2', '2' , '2' , 'PedidoDelivery','2'),
('3', '3' , '3' , 'PedidoLocal','3'),
 ('4', '4' , '4' , 'PedidoLocal','1'),
 ('5', '5' , '5' , 'PedidoDelivery','4'),
 ('6', '6' , '6' , 'PedidoLocal','2'),
 ('7', '7' , '7' , 'PedidoDelivery','1'),
 ('8', '8' , '8' , 'PedidoLocal','5'),
 ('9', '9' , '9' , 'PedidoLocal','1'),
 ('10', '10' , '10' ,'PedidoDelivery','2');

CREATE table Venta(
	Codigo_Venta INT AUTO_INCREMENT,
    Id_Pedido INT,
    Fecha DATE,
    Total float,
	PRIMARY KEY (Codigo_Venta),
    foreign key (Id_Pedido) references Pedido(Id_Pedido)
);

INSERT INTO Venta (Codigo_Venta , Id_Pedido , Fecha, Total)
VALUES ('1', '1' , '02/07/21' , '15'),
('2', '2' , '03/07/21' , '100.00'),
('3', '3' , '07/07/21' , '360.00'),
('4', '4' , '10/07/21' , '30.00'),
('5', '5' , '14/07/21' , '180.00'),
('6', '6' , '16/07/21' , '120.00'),
('7', '7' , '20/07/21' , '23.00'),
('8', '8' , '04/07/21' , '60.00'),
('9', '9' , '05/07/21' , '80.00'),
('10', '10' , '09/07/21' , '190.00');


CREATE table Menu(
	Codigo_Menu INT AUTO_INCREMENT,
	Nombre VARCHAR (40),
	PRIMARY KEY (Codigo_Menu)
);

INSERT INTO Menu (Codigo_Menu , Nombre)
VALUES ('1',  'Menu Marino' ),
 ('2', 'Menu mixto' ),
 ('3',  'Menu Criollo' ),
 ('4',  'Menu marino ' ),
 ('5',  'Menu criollo' ),
 ('6',  'Menu Mixto' ),
 ('7',  'Menu Criollo' ),
 ('8',  'Menu Mixto' ),
 ('9', 'Menu criollo' ),
 ('10',  'Menu Marino' );

CREATE table Producto(
	Codigo_Producto INT AUTO_INCREMENT,
    Codigo_Menu INT,
    Descripcion text,
    Nombre VARCHAR (50),
    Precio float,
	PRIMARY KEY (Codigo_Producto),
    foreign key (Codigo_Menu) references Menu(Codigo_Menu)
);

INSERT INTO Producto (Codigo_Producto , Codigo_Menu , Descripcion, Nombre, Precio)
VALUES ('1', '1' , 'Bueno' ,'Adobo de Pollo','15.00'),
('2', '2' , 'Posee muy buenas Caracteristicas' ,'Trucha Frita', '50.00'),
('3', '3' , 'Es muy completo' ,'Sopa Seca', '120.00'),
('4', '4' , 'Las caracteristicas son las correctas','Cau Cau', '15.00'),
('5', '5' , 'Buena Presentacion','Caldo de Gallina', '45.00'),
('6', '6' , 'Buena Presentacion','Arroz Chaufa', '60.00'),
('7', '7' , 'Productos en buen estado','Ternero al vino', '23.00'),
('8', '8' , 'Las caracteristicas son las correctas','Chilcano', '60.00'),
('9', '9' , 'Productos en buen estado' ,'Arroz con Mariscos', '80.00'),
('10', '10' , 'Es muy completo' ,'Ceviche', '65.00');

CREATE table Venta_Detalle(
	Codigo_VentaDetalle INT AUTO_INCREMENT,
    Codigo_Venta INT,
    Codigo_Producto int,
    Cantidad int,
    Precio float,
    total float,
	PRIMARY KEY (Codigo_VentaDetalle),
    foreign key (Codigo_Venta) references Venta(Codigo_Venta),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);

INSERT INTO Venta_Detalle (Codigo_VentaDetalle , Codigo_Venta , Codigo_Producto, Cantidad,Precio,total)
VALUES ('1', '1' , '1' , '1','30.00','30.00'),
('2', '2' , '2' , '2','100.00','200.00'),
('3', '3' , '3' , '2','240.00','480.00'),
('4', '4' , '4' , '3','45.00','135.00'),
('5', '5' , '5' , '1','45.00','45.00'),
('6', '6' , '6' , '1','60.00','60.00'),
('7', '7' , '7' , '2','46.00','92.00'),
('8', '8' , '8' , '4','240.00','960.00'),
('9', '9' , '9' , '2','160.00','320.00'),
('10', '10' , '10' , '1','65.00','65.00');

CREATE table Menu_Producto(
	Codigo_MenuProducto INT AUTO_INCREMENT,
    Codigo_Menu INT,
	Codigo_Producto INT,
    Categoria varchar(20),
	PRIMARY KEY (Codigo_MenuProducto),
    foreign key (Codigo_Menu) references Menu(Codigo_Menu),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);

INSERT INTO Menu_Producto (Codigo_MenuProducto ,  Codigo_Menu , Codigo_Producto , Categoria)
VALUES ('1', '1' , '1' , 'Criollo'),
('2', '2' , '2' , 'Criollo'),
('3', '3' , '3' , 'Criollo'),
('4', '4' , '4' , 'Marino'),
('5', '5' , '5' , 'Criollo'),
('6', '6' , '6' , 'Marino'),
('7', '7' , '7' , 'Criollo'),
('8', '8' , '8' , 'Criollo'),
('9', '9' , '9' , 'Marino'),
('10', '10' , '10' , 'Criollo');

SELECT * FROM Ubigeo;
SELECT * FROM Cliente;
SELECT * FROM Empleado;
SELECT * FROM Pedido;
SELECT * FROM Venta;
SELECT * FROM Menu;
SELECT * FROM Producto;
SELECT * FROM Venta_Detalle;
SELECT * FROM Menu_Producto;