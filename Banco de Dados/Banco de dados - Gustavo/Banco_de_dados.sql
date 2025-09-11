create database beetech;
use beetech;

create table productionTotal(
	idProducao int primary key auto_increment,
    tamanhoProducao varchar(30) constraint cnkTypeProduction check( typeProduction in('small', 'medium', 'big')),
	especieAbelha varchar(80)
    );
create table productionMonthly(
		idProducaoMensal int primary key auto_increment, 
		melPorKg decimal(8,4) not null,
        qtdColmeia int not null,
        temperaturaMedia decimal(8,4) not null,
        valorDoMel decimal(8,2),
        dtCriacao date default current_timestamp
        )auto_increment = 1308;

create table `user`(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeCompleto VARCHAR(80) NOT NULL,
email VARCHAR(70) NOT NULL UNIQUE,
dtNascimento DATE NOT NULL,
ddd char(2) null,
celular VARCHAR (11) NULL,
senha VARCHAR(60) NOT NULL,
empresa VARCHAR(90),
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
nivelUsuario CHAR(3),
CONSTRAINT chkCargo CHECK( nivelUsuario IN('ADM', 'SUB')),
statusUsuario TINYINT,
CONSTRAINT chkStatus CHECK( statusUsuario IN(0, 1))
);


CREATE TABLE interesse(
idContato INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (80) NOT NULL,
email VARCHAR (70) NOT NULL unique,
ddd char(2) not null,
celular CHAR (11) NOT NULL,
empresa VARCHAR (100) NOT NULL,
cargo VARCHAR(40) NOT NULL,
dtEnvio date default current_timestamp
);

CREATE TABLE contato(
idContato INT PRIMARY KEY AUTO_INCREMENT,
nomeCompleto VARCHAR (80) NOT NULL,
email VARCHAR (70) NOT NULL,
empresa VARCHAR (100) NOT NULL,
cargo VARCHAR(40) NOT NULL,
comentario VARCHAR(500) NOT NULL,
dtCriacao date default current_timestamp
);

CREATE TABLE registroSensor(
idRegistroSensor INT PRIMARY KEY AUTO_INCREMENT,
sensor VARCHAR(14),
qtdTemperatura DECIMAL(4, 2),
dtTemperatura DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(10),
cliente VARCHAR(50),
dtInstalacao DATE DEFAULT CURRENT_TIMESTAMP,
dtManutencao DATE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sensores (nomeSensor, cliente) VALUES
('Sensor_01', 'melbras'),
('Sensor_02', 'supra mel'),
('Sensor_03', 'melbras'),
('Sensor_04', 'supra mel');

select concat("O ", nomeSensor, " da empresa ", cliente, " realizou a ultima manutenção em ", dtManutencao) from sensores;