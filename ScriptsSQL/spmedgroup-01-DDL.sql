CREATE DATABASE spMedGroup

USE spMedGroup

--Parte DDL

CREATE TABLE Endereco (
	IdEndereco				INT PRIMARY KEY IDENTITY,
	Endereco				VARCHAR (200),
	Cep						VARCHAR (200),
	Cidade					VARCHAR (200),	
	Estado					VARCHAR (200),
);

CREATE TABLE Clinica (
	IdClinica				INT PRIMARY KEY IDENTITY,
	Nome					VARCHAR (200),
	razaoSocial				VARCHAR (200),
	Cnpj					VARCHAR (200),
	IdEndereco				INT FOREIGN KEY REFERENCES Endereco (IdEndereco),
);


CREATE TABLE TipoUsuario (
	IdTipoUsu				INT PRIMARY KEY IDENTITY,
	nomeTipoUsu				VARCHAR (200),
);

CREATE TABLE Usuario (
	IdUsuario				INT PRIMARY KEY IDENTITY,
	NomeUsuario				VARCHAR (200),
	Email					VARCHAR (200),
	Senha					VARCHAR (200),
	IdTipoUsu				INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsu),
);


CREATE TABLE Especialidade (
	IdEspecialidade			INT PRIMARY KEY IDENTITY,
	NomeEspecialidade		VARCHAR (200),
);

CREATE TABLE Pacientes (
	IdPaciente				INT PRIMARY KEY IDENTITY,
	NomePaciente			VARCHAR (200),
	Senha					VARCHAR (200),
	IdTipoUsu				INT FOREIGN KEY REFERENCES tipoUsuario (IdTipoUsu),
);

CREATE TABLE Medico (
	IdMedico				INT PRIMARY KEY IDENTITY,
	NomeMedico				VARCHAR (200),
	Crm						CHAR (8),
	Email					VARCHAR (200),
	Senha					VARCHAR (200),
	IdClinica				INT FOREIGN KEY REFERENCES Clinica			(IdClinica),
	IdEspecialidade			INT FOREIGN KEY REFERENCES Especialidade	(IdEspecialidade),
	IdTipoUsu				INT FOREIGN KEY REFERENCES tipoUsuario		(IdTipoUsu),
);


CREATE TABLE Prontuario (
	IdProntuario			INT PRIMARY KEY IDENTITY,
	Nome					VARCHAR (200),
	Email					VARCHAR (200),
	DataNascimento			DATE,
	Telefone				VARCHAR (200),
	Rg						CHAR (15),
	Cpf						CHAR (15),
	IdUsuario				INT FOREIGN KEY REFERENCES	Usuario		(IdUsuario),
	IdEndereco				INT FOREIGN KEY REFERENCES	Endereco	(IdEndereco),
);

CREATE TABLE Consulta (
	IdConsulta			INT PRIMARY KEY IDENTITY,
	DataConsulta		DATE,
	Situacao			VARCHAR (200),
	IdProntuario		INT FOREIGN KEY REFERENCES	Prontuario	(IdProntuario),
	IdMedico			INT FOREIGN KEY REFERENCES	Medico		(IdMedico),
);

