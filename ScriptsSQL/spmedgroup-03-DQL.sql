USE spMedGroup

--Parte DQL

SELECT * FROM Clinica
SELECT * FROM Consulta
SELECT * FROM Medico
SELECT * FROM Usuario
SELECT * FROM TipoUsuario
SELECT * FROM Especialidade
SELECT * FROM Prontuario

--Ver consultas
SELECT Consulta.DataConsulta, Consulta.Situacao, Medico.NomeMedico, Usuario.NomeUsuario FROM Consulta 
INNER JOIN Medico ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Usuario ON Consulta.IdProntuario = Usuario.IdUsuario

--Procedure para consultar a especialidade de cada médico
CREATE PROCEDURE MedicoEspecialidade 
@ID INT
AS

SELECT Medico.NomeMedico, Especialidade.NomeEspecialidade  FROM Medico
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade
WHERE Especialidade.IdEspecialidade = @ID

EXECUTE MedicoEspecialidade 1

--Procedure para calcular a idade de um Usuario
CREATE PROCEDURE IdadeUsuario 
@id INT
AS
SELECT Nome, YEAR(GETDATE())-YEAR(DataNascimento)-IIF(MONTH(GETDATE())*32+DAY(GETDATE())<MONTH(DataNascimento)*32+DAY(DataNascimento),1,0)
FROM Prontuario
WHERE Prontuario.IdProntuario = @id

EXECUTE IdadeUsuario 3;

--Converter data 
SELECT CONVERT(VARCHAR(10), DataNascimento, 110) AS [Mes/Dia/Ano] 
FROM Prontuario

--Contar o total de usuarios
SELECT COUNT (IdUsuario) AS NumeroUsuarios FROM Usuario

--
SELECT Prontuario.Nome AS Paciente, Prontuario.CPF ,Prontuario.DataNascimento,Consulta.DataConsulta, Medico.NomeMedico AS NomeMedico, Especialidade.NomeEspecialidade AS EspecialidadeMedica FROM Consulta
INNER JOIN Prontuario ON Prontuario.IdProntuario = Consulta.IdProntuario
INNER JOIN Medico ON Medico.IdMedico = Consulta.IdMedico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade; 





