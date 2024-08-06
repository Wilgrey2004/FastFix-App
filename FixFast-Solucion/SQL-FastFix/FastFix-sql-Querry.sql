create database FixFastDb

use FixFastDb

CREATE TABLE Usuarios (
  id_usuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  name VARCHAR(20) NOT NULL,
  last_name1 VARCHAR(30) DEFAULT 'xx-xx',
  last_name2 VARCHAR(30) DEFAULT 'cc-cc',
  sexo CHAR(1) DEFAULT 'N', -- N para no especificado
  email VARCHAR(255) UNIQUE NOT NULL CHECK (email LIKE '%@[%@%.%][^.]{2,}%'),
  password VARCHAR(MAX) NOT NULL
)

create table clientes (
	id_cliente int identity primary key not null,  
	id_Usuario int references Usuarios(id_usuario),
	rango CHAR(1) default 'B'
)

create table puestos(
	id_Puestos INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name_Puesto varchar(30) not null, 
	descripcion varchar(max) default 'dd-dd',
	pago_por_hora float not null,
)

create table Empleados (
	id_empleados int identity primary key not null,
	id_Usuario int references Usuarios(id_usuario),
	id_puesto int references puestos(id_Puestos)
)

create table categorias (
	id_categoria INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name_categoria varchar(20),
	descripcion_categoria varchar(max) default 'dd-dd'
)

create table Productos(
	id_productos INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_categria int references categorias(id_categoria),
	name_producto varchar(40) not null, 
	descripcion varchar(max) not null,
	marca_del_producto varchar(30),
	precio_unidad float not null,
	cantidad_en_stock int not null,
)

create table estados_de_las_Piezas(
	id_estado INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name_estado varchar(20) not null, 
	desripcion_estado varchar(max) default 'dd-dd',
)

create table Almacen_De_Reparaciones(
	id_pieza_a_reparar INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente int references clientes(id_cliente),
	id_empleado_a_cargo int references Empleados(id_empleados),
	id_estado_de_la_pieza int references estados_de_las_Piezas(id_estado) default 0,
	descripcion_de_la_averia varchar(max) default 'dd-dd',
	monto_acordado float default 0.0,
	fecha_de_la_alamacenamiento datetime
)

create table citas (
	id_cita INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente int references clientes(id_cliente),
	id_empleado int references empleados(id_empleados),
	descripcion_de_la_averia varchar(max) default 'dd-dd',
	monto_acordado float default 0.0,
	fecha_de_la_cita datetime default getdate()
)


