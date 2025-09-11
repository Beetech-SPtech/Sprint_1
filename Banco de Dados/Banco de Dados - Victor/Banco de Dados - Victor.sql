/* NOME: VICTOR RAFAEL LOURENÇO OLIVEIRA - RA: 01252058 */
create database projetoPI;
use projetoPI;

create table usuarios(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL, 
email VARCHAR(70) NOT NULL UNIQUE,
dtNascimento DATE NOT NULL,
telCelular VARCHAR (13) UNIQUE,
telFixo VARCHAR(10) UNIQUE,
senha VARCHAR(60) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
nivelPermissao CHAR(3), 
CONSTRAINT chkPermissao CHECK(nivelPermissao IN('ADM', 'SUB'))
);

INSERT INTO usuarios(nome, sobrenome, email, dtNascimento, telCelular, senha, nivelUsuario) VALUES
	('Josué', 'Alvarez Avendano', 'josue.avendano@rancho.maia', '2000-02-02', '11960181191', 'J0su3!12th3', 'SUB'),
    ('Lesly', 'Oliveira', 'lesly.oliveira@bee.tec', '2004-06-21', '11961692152', 'K0l3s_3r', 'SUB'),
    ('Cláudio', 'Frizzarini', 'claudio.frizzarini@pedro.colmeia', '1968-05-20', '11932841827', 'fr1zz0l_', 'SUB'),
    ('Victor', 'Oliveira', 'victor.oliveira@rancho.maia', '2004-11-20', '11984739532', 'V!ctor_23', 'ADM'),
    ('Pedro', 'Cardoso', 'pedro.cardoso@pedro.colmeia', '1971-04-07', '86978420913', 'pedroFarm_$', 'ADM');

SELECT * FROM usuarios;
/* ------------------------------------------------------------------------------------------------------- */

CREATE TABLE empresas(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
responsavel VARCHAR(40) NOT NULL,
nomeEmpresa VARCHAR(150) NOT NULL,
cnpj CHAR(18),
telFixo VARCHAR(12) UNIQUE,
telCelular VARCHAR(13) UNIQUE
);

INSERT INTO empresas (responsavel, nomeEmpresa, cnpj, telCelular) VALUES
('Victor Rafael', 'Rancho do Maia', '20.000.258/0001-03', '1123750853'),
('Thais Lima', 'Nagro Valley', '16.465.514/0001-52' ,'6274859048'),
('Guilherme Jesus', 'BeeTec', '47.287.021/0001-01' ,'6274890985'),
('Pedro Henrique', 'Fazenda Pedro da Colmeia', '76.168.937/0001-32' ,'8674830941');

SELECT * FROM usuarios;
/* ------------------------------------------------------------------------------------------------------- */

CREATE TABLE registroSensor(
idRegistroSensor INT PRIMARY KEY AUTO_INCREMENT,
sensor VARCHAR(14),
qtdTemperatura DECIMAL(4, 2),
dtTemperatura DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO registroSensor (sensor, qtdTemperatura) VALUES
('Sensor_001', 34.43),
('Sensor_002', 35.99),
('Sensor_003', 35.44),
('Sensor_004', 37.25);

INSERT INTO registroSensor (sensor, qtdTemperatura) VALUES
('Sensor_001', 34.23),
('Sensor_002', 35.29),
('Sensor_003', 35.74),
('Sensor_004', 34.25);

SELECT * FROM registroSensor;
/* ------------------------------------------------------------------------------------------------------- */

CREATE TABLE sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(10),
cliente VARCHAR(50)
);

INSERT INTO sensores (nomeSensor, cliente) VALUES
('Sensor_001', 'Nagro Valley'),
('Sensor_002', 'Rancho do Maia'),
('Sensor_003', 'BeeTec'),
('Sensor_004', 'Fazenda Pedro da Colmeia');

SELECT * FROM sensores;
/* ------------------------------------------------------------------------------------------------------- */

CREATE TABLE enderecos(
	idEnderecos INT PRIMARY KEY AUTO_INCREMENT,
	cnpj CHAR(18),
	logradouro VARCHAR (90) NOT NULL,
	numLogradouro VARCHAR(10) NOT NULL,
	cidade VARCHAR(80) NOT NULL,
	UF CHAR(2) NOT NULL,
	cep CHAR (9) NOT NULL,
    bairro VARCHAR(40),
    complemento VARCHAR(50),
    statusEndereco VARCHAR(10) DEFAULT 'Ativo',
    CONSTRAINT chkEndereco CHECK( statusEndereco IN('Ativo', 'Inativo'))
);

INSERT INTO enderecos (cnpj, logradouro, numLogradouro, cidade, UF, cep, bairro, complemento, statusEndereco) VALUES
('12.345.678/0001-90', 'Avenida Paulista', '1000', 'São Paulo', 'SP', '01310-100', 'Bela Vista', 'Conjunto 101', 'Ativo'),
('98.765.432/0001-55', 'Rua XV de Novembro', '250', 'Curitiba', 'PR', '80020-310', 'Centro', 'Sala 5', 'Ativo'),
('55.444.333/0001-22', 'Avenida Atlântica', '5000', 'Rio de Janeiro', 'RJ', '22021-001', 'Copacabana', 'Apt 130', 'Inativo'),
('77.888.999/0001-11', 'Rua das Flores', '123', 'Florianópolis', 'SC', '88010-200', 'Centro', 'Casa 2', 'Ativo');

SELECT * FROM enderecos;