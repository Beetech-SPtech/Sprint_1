CREATE TABLE registroSensor(
idRegistroSensor INT PRIMARY KEY AUTO_INCREMENT,
tipoSensor VARCHAR(20),
sensor VARCHAR(14),
qtdTemperatura DECIMAL(4, 2),
dtTemperatura DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(10),
cliente VARCHAR(50)
);


CREATE TABLE infoColmeia(
idColmeia INT PRIMARY KEY AUTO_INCREMENT,
temperaturaMedia DECIMAL(4,2) NOT NULL,
especieAbelha varchar(30)
);


CREATE TABLE producao(
idProducao INT PRIMARY KEY AUTO_INCREMENT,
melKg DECIMAL(7, 2) NOT NULL,
qtdColmeia INT NOT NULL,
valorMel DECIMAL(7, 2),
dtCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
empresa VARCHAR(100)
)AUTO_INCREMENT = 1000;


CREATE TABLE alerta(
	idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    mensagem VARCHAR(200),
    nivelAlerta CHAR(5),
    CONSTRAINT chkNivel CHECK (nivelAlerta in('Baixo', 'Médio', 'Alto')),
    dataHora datetime not null
);