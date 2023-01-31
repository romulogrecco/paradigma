CREATE TABLE Departamento (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome varchar(250) NOT NULL,
);

CREATE TABLE Pessoa (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome varchar(250) NOT NULL,
    Salario decimal(18,2) NOT NULL,
  	DepartamentoId INT FOREIGN KEY REFERENCES Departamento(Id)
);

INSERT INTO Departamento (nome) VALUES ('TI');
INSERT INTO Departamento (nome) VALUES ('Vendas');

INSERT INTO Pessoa (nome, salario, departamentoid) VALUEs ('Joe', 70000, 1);
INSERT INTO Pessoa (nome, salario, departamentoid) VALUEs ('Henry', 80000, 2);
INSERT INTO Pessoa (nome, salario, departamentoid) VALUEs ('Sam', 60000, 2);
INSERT INTO Pessoa (nome, salario, departamentoid) VALUEs ('Max', 90000, 1);


SELECT	d.nome, p.nome, p.salario 
  from 	Pessoa p 
  JOIN 	Departamento d ON d.Id = p.departamentoid
 WHERE 	p.salario IN (SELECT MAX(salario) FROM Pessoa GROUP BY departamentoid)