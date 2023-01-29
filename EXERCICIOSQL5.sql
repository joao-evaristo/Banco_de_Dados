/*1) Crie as tabelas abaixo:*/
create table departamento (Dnum int, nome varchar(10), TotalSal float);
alter table departamento add primary key (Dnum);

create table empregado (id int, nome varchar(10), salario float, dnum int);
alter table empregado add primary key (id);
alter table empregado add foreign key(Dnum) references departamento(Dnum);

/*2) Insira na tabela Departamento:*/
INSERT INTO departamento VALUES (1, 'computação', 0), (2, 'matemática', 0);

/*3) Crie uma trigger que atualize o TotalSal da tabela Depto, sempre que um
novo empregado for inserido.*/
CREATE TRIGGER tgr_empregado_insert AFTER INSERT
ON empregado
FOR EACH ROW
UPDATE departamento SET TotalSal = TotalSal + NEW.salario
WHERE departamento.Dnum = NEW.dnum;

INSERT INTO empregado VALUES (1, 'João Vitor', 1400.00, 2), (2, 'Oscar Rob', 3000.00, 1), (3, 'Paulo Jaca', 2500.00, 1);

SELECT * FROM departamento;

/*4) Crie uma trigger que atualize o TotaSal, sempre que um empregado trocar
de depto.*/
DELIMITER $$
CREATE TRIGGER tgr_empregado_alteradep AFTER UPDATE
ON empregado
FOR EACH ROW
BEGIN
UPDATE departamento SET TotalSal = TotalSal - OLD.salario
WHERE departamento.Dnum = OLD.dnum;
UPDATE departamento SET TotalSal = TotalSal + NEW.salario
WHERE departamento.Dnum = NEW.dnum;
END$$

UPDATE empregado
SET dnum = 2
WHERE id = 3;

SELECT * FROM departamento;

/*5) Crie uma tabela FolhaPagamento(id, salario, id_emp). O campo id é PK e
auto_increment. id_emp é FK.*/
create table FolhaPagto (id int auto_increment, salario float, codemp int,
primary key(id));
alter table FolhaPagto add foreign key(codemp) references empregado(id);

DROP TRIGGER tgr_empregado_insert;


CREATE TRIGGER tgr_empregado_insert_folhapgt AFTER INSERT
ON empregado
FOR EACH ROW
INSERT INTO FolhaPagto(salario, codemp)
VALUES(NEW.salario, NEW.id);

INSERT INTO empregado VALUES (4, 'Rebeca', 4400.00, 1), (5, 'Ana', 3050.00, 1), (6, 'Ulisses', 1500.00, 2);

SELECT * FROM folhapagto;
