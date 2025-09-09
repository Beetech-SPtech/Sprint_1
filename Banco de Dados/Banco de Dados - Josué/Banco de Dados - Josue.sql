-- Josué Alvarez Avendano | RA: 01252002 | 1ADSA

CREATE DATABASE projetoPI;
USE projetoPI;

-- Criação da tabela com dados dos clientes:
CREATE TABLE dadosClientes(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCompleto VARCHAR(50) NOT NULL,
empresa VARCHAR(50) NOT NULL,
email VARCHAR(70) NOT NULL UNIQUE,
dataNascimento DATE NOT NULL,
telCelular VARCHAR (13) NOT NULL UNIQUE,
telFixo VARCHAR(10),
nivelUsuario CHAR(3) NOT NULL,
senha VARCHAR(60) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO dadosClientes(nomeCompleto, empresa, email, dataNascimento, telCelular, nivelUsuario, senha) VALUES
	('Bruno Silva Guimarães', 'Rancho da Abelha', 'bruno.guimaraes@ranchoabelha', '2000-06-16', '11984127658','1', 'Xka22#'),
    ('Amanda Pereira dos Santos', 'beetech', 'amanda.santos@beetech', '1979-09-21', '11951526375', '2', 'Ps@523'),
    ('Matheus Lopes', 'Farm Ville', 'matheus.lopes@farmville', '1985-07-03', '11974365843', '1', 'L52$ds'),
    ('Bruna Santos', 'beetech', 'bruna.santos@beetech', '1999-12-25', '11988532469', '1', 'aed@292');

-- Mostrar todos os dados
SELECT * FROM dadosClientes ORDER BY nomeCompleto ASC;

-- Mostrar data de aniversario dos clientes
SELECT CONCAT(nomeCompleto, ' faz aniversario na data: ', dataNascimento) AS 'Data de Aniversário' FROM dadosClientes;

-- Mostrar niveis de acesso
SELECT nomeCompleto, CASE WHEN nivelUsuario = '1' THEN 'Dono da Empresa' ELSE 'Funcionario' END AS 'Cargo' FROM dadosClientes;

/* --------------------------------------------------------------------------------------- */

-- Criação da tabela com os dados dos sensores ativos:
CREATE TABLE Sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(10) NOT NULL,
cliente VARCHAR(50) NOT NULL
);

INSERT INTO sensores (nomeSensor, cliente) VALUES
('Sensor_001', 'Nagro Valley'),
('Sensor_002', 'Rancho do Maia'),
('Sensor_003', 'BeeTec'),
('Sensor_004', 'BeeTec'),
('Sensor_005', 'Fazendo Pedro da Colmeia');

-- Mostrar os dados de todos os sensores
SELECT * FROM sensores;

-- Mostrar sensores da empresa Beetec
SELECT * FROM sensores WHERE cliente = 'Beetec';

/* --------------------------------------------------------------------------------------- */

-- Criação da tabela com os dados coletados pelos sensores:
CREATE TABLE registroSensor(
idRegistro_Sensor INT PRIMARY KEY AUTO_INCREMENT,
Sensor VARCHAR(10) NOT NULL,
QtdTemperatura dECIMAL (5, 2) NOT NULL,
data_temperatura DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO registroSensor (sensor, qtdTemperatura) VALUES
('Sensor_001', 32.50),
('Sensor_002', 35.21),
('Sensor_003', 34.32),
('Sensor_004', 33.45),
('Sensor_005', 35.49);

-- Mostrar os registros do 'Sensor_002'
SELECT * FROM registroSensor
WHERE sensor = 'Sensor_002';

-- Mostrar um sinal de alerta para temperaturas acima de 35°C e temperatura abaixo de 33°C
SELECT sensor AS 'Sensor', qtdTemperatura AS 'Temperatura', CASE 
	WHEN qtdTemperatura > 35 THEN 'Temperatura Muito Alta'
    WHEN qtdTemperatura < 33 THEN 'Temperatura Muito Baixa'
    ELSE 'Temperatura Normal'END
    AS 'Alerta' FROM registroSensor;
