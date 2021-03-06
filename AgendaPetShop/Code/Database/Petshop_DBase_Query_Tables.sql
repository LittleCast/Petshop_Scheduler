USE master
GO
DROP DATABASE Petshop_DBase
GO

CREATE DATABASE Petshop_DBase
GO

USE Petshop_DBase
GO

CREATE TABLE Dono
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	cpf VARCHAR(14) NOT NULL,
	nome VARCHAR(70) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	telefone VARCHAR(13),
	celular VARCHAR(14) NOT NULL,
	observacoes VARCHAR(MAX)
)

CREATE TABLE Raca
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
)

CREATE TABLE Pelagem
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
)

CREATE TABLE Porte
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
)

CREATE TABLE Especie
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
)

CREATE TABLE Pet
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	idade VARCHAR(40) NOT NULL,
	especieId INT NOT NULL REFERENCES Especie(id),
	racaId INT NOT NULL REFERENCES Raca(id),
	pelagemId INT NOT NULL REFERENCES Pelagem(id),
	porteId INT NOT NULL REFERENCES Porte(id),
	observacoes VARCHAR(MAX)
)

CREATE TABLE PetXDono
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	petId INT NOT NULL REFERENCES Pet(id),
	donoId INT NOT NULL REFERENCES Dono(id)
)

CREATE TABLE Funcionario
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	cpf VARCHAR(14) NOT NULL,
	nome VARCHAR(70) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	telefone VARCHAR(13),
	celular VARCHAR(14) NOT NULL,
	observacoes VARCHAR(MAX),
	salario DECIMAL(10,2) NOT NULL
)

CREATE TABLE Servico
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	duracao INT NOT NULL
)

CREATE TABLE TipoPacote
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL
)

CREATE TABLE Pacote
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	petId INT NOT NULL REFERENCES Pet(id),
	tipo INT NOT NULL REFERENCES TipoPacote(id),
	funcionarioId INT NOT NULL REFERENCES Funcionario(id),
)

CREATE TABLE Pagamento
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	data DATE NOT NULL,
	tipoId INT NOT NULL
)

CREATE TABLE Agendamento
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	petId INT NOT NULL REFERENCES Pet(id),
	data DATE NOT NULL,
	horario TIME NOT NULL,
	servicoId INT NOT NULL REFERENCES Servico(id),
	funcionarioId INT NULL REFERENCES Funcionario(id),
	pacoteId INT NULL REFERENCES Pacote(id),
	pagamentoId INT NULL REFERENCES Pagamento(id),
	cancelado BIT NOT NULL
)

CREATE TABLE TipoPagamento
(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	descricao VARCHAR(MAX) NOT NULL
)