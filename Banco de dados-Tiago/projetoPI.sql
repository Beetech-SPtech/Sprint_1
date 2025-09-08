create database ProjetoPi;
use ProjetoPi;

create table PaginaDeshBoard(
idPagina int primary key auto_increment,
empresa varchar(40),
LoginAdmin varchar(40),
GraficosGerais  decimal (5,2),
GraficosExpecifico decimal(5,2),
GraficoTemperatura decimal (2,2)
);

create table usuario(
idUsuario int primary key auto_increment,
cliente varchar (40),
Login varchar (40),
Dtcadastro datetime default current_timestamp,
Qtcolmeias int not null,
QtSensores int not null
);

create table AlertaSensor(
idAlertaSensor int primary key auto_increment,
NumeroSensor varchar(100) not null,
MensagemAlerta varchar (150),
TipoAlerta varchar(20)
);

CREATE TABLE leituras_temperatura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id VARCHAR(50),
    temperatura DECIMAL(5,2),
    data_hora DATETIME NOT NULL
    );
    