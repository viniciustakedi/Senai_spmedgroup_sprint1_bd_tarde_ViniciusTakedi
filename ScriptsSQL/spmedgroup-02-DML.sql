USE spMedGroup

--Parte DML

INSERT INTO Clinica (Nome, razaoSocial, Cnpj, IdEndereco)
VALUES ('Clinica do Jefersson', 'SpMedGroup', '64.763.186.400.902/0001-3023-1', 1);

INSERT INTO Endereco (Endereco, Cep, Cidade, Estado)
VALUES ('Rua Piuau', '14124-2', 'São Caetano', 'SP');

INSERT INTO tipoUsuario (nomeTipoUsu)
VALUES  ('Administrador'),
		('Médico'),
		('Paciente');

INSERT INTO Usuario (nomeUsuario, Email, Senha, IdTipoUsu)
VALUES	('administrador', 'adm@adm.com', '@adm', 1),
		('Davi Takedi', 'Ddrtakedi@gmail.com', 'bolopodreatanaruto931929', 2),
		('Alberta Silva', 'AlbeDout@hotmail.com', 'iiuuehs13', 2),
		('Firmino Souza', 'drfirmino@yahoo.com.br', 'dhasudhu33', 2),
		('Rafaela Gimenez', 'rara@gmail.com', 'barbieuueu912', 3),
		('Luiz Brunelli', 'luiz.kiej@hotmail.com', 'matematica9992', 3),
		('Betina Rosa', 'betina@gmail.com', 'florrosa883', 3);

INSERT INTO Especialidade (NomeEspecialidade)
VALUES	('Cirurgião'),
		('Pediatra'),
		('Cirurgia Central'),
		('Urologia');

INSERT INTO Pacientes (NomePaciente, Senha, IdTipoUsu)
VALUES	('Rafaela Gimenez', 'barbieuueu912', 3),
		('Luiz Brunelli', 'matematica9992', 3),
		('Betina Rosa', 'florrosa883', 3);

INSERT INTO Medico (NomeMedico, Crm, Email, Senha, IdClinica, IdEspecialidade, IdTipoUsu)
VALUES  ('Davi Takedi', '54356-SP', 'drtakedi@gmail.com', 'dhasudhu33', 2, 1, 2),
		('Firmino Souza', '54356-SP', 'drfirmino@yahoo.com.br', 'dhasudhu33', 2, 4, 2),
		('Alberta Silva', '86356-SP', 'AlbeDout@hotmail.com', 'iiuuehs13', 2, 2, 2); 

INSERT INTO Prontuario (Nome, Email, DataNascimento, Telefone, Rg, Cpf, IdUsuario, IdEndereco)
VALUES  ('Rafaela Gimenez', 'rara@gmail.com', '10/12/1972', '987461249', '82.832.933-1', '231.312.312-2', 5, 2),
		('Luiz Brunelli', 'luiz.kiej@hotmail.com', '09/01/1990', '981319762', '32.883.382-9', '193.947.440-0', 6, 5),
		('Betina Rosa', 'betina@gmail.com', '20/10/2000', '28739873', '39.882.838-1', '198.873.019-0', 7, 4);

INSERT INTO Consulta (DataConsulta, Situacao, IdProntuario, IdMedico)
VALUES	('09/01/2020', 'Realizada', 1, 5),
		('20/01/2020', 'Cancelada', 2, 6),
		('14/02/2020', 'Pendente', 3, 4);

