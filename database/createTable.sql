CREATE SCHEMA IF NOT EXISTS `ravin`;
USE `ravin`;

CREATE TABLE IF NOT EXISTS `statusMesa` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255),
	UNIQUE KEY `uniqueNome` (`Nome`) USING HASH,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `statusComanda` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255),
	UNIQUE KEY `uniqueNome` (`Nome`) USING HASH,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `statusComandaProduto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255),
	UNIQUE KEY `uniqueNome` (`Nome`) USING HASH,
	PRIMARY KEY (`id`)
);
	
CREATE TABLE IF NOT EXISTS `pessoa` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL,
	`tipoPessoa` CHAR(1) NOT NULL,
	`cpf` VARCHAR(11),
	`telefone` INT(8) unsigned,
	`ativo` BOOLEAN NOT NULL,
	`criadoEm` DATETIME NOT NULL,
	`criadoPor` VARCHAR(255) NOT NULL,
	`alteradoEm` DATETIME NOT NULL,
	`alteradoPor` VARCHAR(255) NOT NULL,
	UNIQUE KEY `uniqueCpf` (`cpf`) USING HASH,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `mesa` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`atendenteId` int,
	`statusMesaId` int,
	`nome` VARCHAR(255),
	`codigo` VARCHAR(255),
	`numero` INT unsigned NOT NULL,
	`quantidadeMaximaPessoas` INT unsigned,
	`criadoEm` DATETIME NOT NULL,
	`criadoPor` VARCHAR(255) NOT NULL,
	`alteradoEm` DATETIME NOT NULL,
	`alteradoPor` VARCHAR(255) NOT NULL,
	UNIQUE KEY `uniqueCodigo` (`codigo`) USING HASH,
	UNIQUE KEY `uniqueNumero` (`numero`) USING HASH,
	PRIMARY KEY (`id`),
	FOREIGN KEY (atendenteId) REFERENCES pessoa(id),
	FOREIGN KEY (statusMesaId) REFERENCES statusMesa(id)
);

CREATE TABLE IF NOT EXISTS `comanda` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`mesaId` int,	
	`clienteId` int,	
	`statusComandaId` int,	
	`codigo` VARCHAR(255),
	`valor` FLOAT unsigned NOT NULL,
	`criadoEm` DATETIME NOT NULL,
	`criadoPor` VARCHAR(255) NOT NULL,
	`alteradoEm` DATETIME NOT NULL,
	`alteradoPor` VARCHAR(255) NOT NULL,
	UNIQUE KEY `uniqueCodigo` (`codigo`) USING HASH,
	PRIMARY KEY (`id`),
	FOREIGN KEY (mesaId) REFERENCES mesa(id),
	FOREIGN KEY (clienteId) REFERENCES pessoa(id),
	FOREIGN KEY (statusComandaId) REFERENCES statusComanda(id)
);

CREATE TABLE IF NOT EXISTS `produto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL,
	`descricao` VARCHAR(255),
	`codigo` VARCHAR(255),
	`precoCusto` DOUBLE NOT NULL,
	`precoVenda` DOUBLE unsigned,
	`tempoDePreparo` TIME,
	`observacoes` VARCHAR(255),
	`ativo` BOOLEAN NOT NULL,
	`criadoEm` DATETIME NOT NULL,
	`criadoPor` VARCHAR(255) NOT NULL,
	`alteradoEm` DATETIME NOT NULL,
	`alteradoPor` VARCHAR(255) NOT NULL,
	UNIQUE KEY `uniqueCodigo` (`codigo`) USING HASH,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `comandaProduto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`comandaId` int NOT NULL,
	`produtoId` int NOT NULL,	
	`statusComandaProdutoId` int NOT NULL,	
	`quantidade` INT unsigned NOT NULL,
	`valorTotal` DOUBLE NOT NULL,
	`criadoEm` DATETIME NOT NULL,
	`criadoPor` VARCHAR(255) NOT NULL,
	`alteradoEm` DATETIME NOT NULL,
	`alteradoPor` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (comandaId) REFERENCES comanda(id),
	FOREIGN KEY (produtoId) REFERENCES produto(id),
	FOREIGN KEY (statusComandaProdutoId) REFERENCES statusComandaProduto(id)
);