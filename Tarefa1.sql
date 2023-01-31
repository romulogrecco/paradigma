CREATE TABLE Departamento (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
);

CREATE TABLE Pessoa (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Salario DECIMAL(18,2) NOT NULL,
  	DepartamentoId INT FOREIGN KEY REFERENCES Departamento(Id)
);

INSERT INTO Departamento (Nome) VALUES ('TI');
INSERT INTO Departamento (Nome) VALUES ('Vendas');

INSERT INTO Pessoa (Nome, Salario, Departamentoid) VALUES ('Joe', 70000, 1);
INSERT INTO Pessoa (Nome, Salario, Departamentoid) VALUES ('Henry', 80000, 2);
INSERT INTO Pessoa (Nome, Salario, Departamentoid) VALUES ('Sam', 60000, 2);
INSERT INTO Pessoa (Nome, Salario, Departamentoid) VALUES ('Max', 90000, 1);


SELECT	d.Nome, p.Nome, p.Salario 
  from 	Pessoa p 
  JOIN 	Departamento d ON d.Id = p.Departamentoid
 WHERE 	p.Salario IN (SELECT MAX(Salario) FROM Pessoa GROUP BY Departamentoid)