-- Lesley de Oliveira 1ADSA

create database projetoPI;

use projetoPI;

create table usuarios(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
sobrenome VARCHAR(60) NOT NULL, 
email VARCHAR(70) NOT NULL UNIQUE,
dtNascimento DATE NOT NULL,
contatoCelular VARCHAR (13) NOT NULL UNIQUE,
senha CHAR(8) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
empresa VARCHAR(100),
nivelUsuario CHAR(3), 
CONSTRAINT chkCargo CHECK( nivelUsuario IN('ADM', 'SUB'))
);

INSERT INTO usuarios(nome, sobrenome, email, dtNascimento, contatoCelular, senha, empresa, nivelUsuario) VALUES
	('Lesly', 'Oliveira', 'lesly.oliveira@wee.tec', '2004-06-21', '11961694166', 'Swem2_uy', 'BeeTec', 'ADM'),
	('Lucas', 'Cardozo', 'lucas.cardozo@gmail.com', '2004-06-14', '11987543810','Sqzxi@89','Ryzen tec','SUB'),
	('Yan', 'Waykon', 'yanlucas98@gmail.com', '2001-02-06', '1198024001','Kcswe.01','Rancho Melifera','ADM'),
	('Julia', 'Borge', 'jucariri@gmail.com', '1998-01-06', '1199024802','Mamis_pj','Rancho Farm Tec','SUB'),
    ('Alan', 'Santos', 'rraminhos@alan.colmeia', '1989-10-14', '62968775528', 'rramiA_$', 'Fazenda Ramos da Colmeia', 'ADM');
    

SELECT * FROM usuarios;

SELECT CONCAT(nome, ' ', contatoCelular) AS 'Nome e Numero' FROM usuarios;

ALTER TABLE usuarios MODIFY COLUMN email VARCHAR(60);

DESCRIBE usuarios;

SELECT nome as Nomes FROM usuarios;


-- Criação da tabela de apiarios

CREATE TABLE Apiarios (
idApiarios INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(150) NOT NULL,
localizacao VARCHAR(100) NOT NULL,
responsavel VARCHAR(100) NOT NULL
);

INSERT INTO Apiarios (nome, localizacao, responsavel) VALUES 
('Apiario Principal', 'BeeTec', 'Lesly Oliveira'),
('Apiario Secundario', 'Rancho Melifera', 'Yan Waykon'),
('Apiario Principal', 'Ryzen tec', 'Lucas Cardozo'),
('Apiario Principal', 'Rancho Farm Tec', 'Julia Borges'),
('Apiario Principal', 'Fazenda Ramos da Colmeia', 'Alan Santos');


SELECT * FROM Apiarios;

ALTER TABLE Apiarios MODIFY COLUMN nome VARCHAR(80);

DESCRIBE Apiarios;

-- Criação de tabelas das colmeias

CREATE TABLE Colmeias(
idColmeia INT PRIMARY KEY AUTO_INCREMENT,
Apiario VARCHAR(70) NOT NULL,
especieAbelha VARCHAR (50),
dataInstalacao DATE
);

INSERT INTO Colmeias (Apiario, especieAbelha, dataInstalacao) VALUES
('Apiario Principal', 'Apis Mellifera', '2025-01-20'),
('Apiario Principal', 'Apis Mellifera', '2025-06-21'),
('Apiario Principal', 'Apis Mellifera', '2025-05-11'),
('Apiario Secundario', 'Apis Mellifera', '2024-04-28'),
('Apiario Secundario', 'Apis Mellifera', '2024-11-28');

SELECT * FROM Colmeias;

SELECT Apiario, especieAbelha, dataInstalacao, CASE WHEN dataInstalacao >= '2025-01-01' THEN 
CONCAT ('Apiario:', ' ', Apiario, ' ', 'Especie:',' ', especieAbelha, ' ', 'Data da Instalação:', ' ', dataInstalacao) END AS 'Informações Gerais'
FROM Colmeias;   

  DROP TABLE Colmeias;
  
  
  CREATE TABLE Sensores(
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  Colmeia VARCHAR(50) NOT NULL,
  ModeloSensor VARCHAR (50),
  tipoSensor VARCHAR(60) NOT NULL,
  dataInstalacao DATE
);

INSERT INTO Sensores (Colmeia, ModeloSensor, tipoSensor, dataInstalacao) VALUES
('Apiario Principal', 'LM35', 'Temperatura','2025-01-20'),
('Apiario Principal','LM35', 'Temperatura', '2025-06-21'),
('Apiario Secundario', 'LM35', 'Temperatura', '2024-04-28'),
('Apiario Principal', 'LM35', 'Temperatura', '2025-05-11'),
('Apiario Secundario', 'LM35', 'Temperatura', '2024-04-28')
;

SELECT * FROM Sensores;

DESCRIBE Sensores;

ALTER TABLE Sensores MODIFY COLUMN tipoSensor VARCHAR(50);

 DROP TABLE Sensores;
 
 
 
 