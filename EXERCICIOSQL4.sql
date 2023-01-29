CREATE TABLE Medico (cod integer, nome varchar(20), telefone varchar(15),
PRiMARY KEY(cod)) Engine=iNNODB;

CREATE TABLE Especialidade(cod integer, nome varchar(20),
PRiMARY KEY(cod)) Engine=iNNODB;

CREATE TABLE Clinica (cod integer, nome varchar(20), endereco varchar(15),
PRiMARY KEY(cod)) Engine=iNNODB;

CREATE TABLE Consulta(cod integer, data date, hora time, especialidade_cod integer, medico_cod integer, clinica_cod integer,
PRiMARY KEY(cod),
FOREIGN KEY(especialidade_cod) REFERENCES Especialidade(cod),
FOREIGN KEY(medico_cod) REFERENCES Medico(cod),
FOREIGN KEY(clinica_cod) REFERENCES Clinica(cod)
) Engine=iNNODB;


CREATE TABLE MedicoEspecialidade(            
medico_cod integer,        
especialidade_cod integer, 
PRIMARY KEY (medico_cod,especialidade_cod),          
FOREIGN KEY (medico_cod) REFERENCES Medico(cod),             
FOREIGN KEY (especialidade_cod) REFERENCES Especialidade(cod))Engine=INNODB;

CREATE TABLE EspecialidadeClinica(
especialidade_cod integer,
clinica_cod integer,
PRIMARY KEY  (especialidade_cod, clinica_cod),
FOREIGN KEY (especialidade_cod)  REFERENCES Especialidade(cod),
FOREIGN KEY (clinica_cod) REFERENCES Clinica(cod))Engine=INNODB;
             

CREATE TABLE MedicoClinica(
medico_cod integer,
clinica_cod integer,
PRIMARY KEY  (medico_cod, clinica_cod),
FOREIGN KEY   (medico_cod) REFERENCES  Medico(cod),
FOREIGN KEY (clinica_cod) REFERENCES Clinica(cod) )Engine=INNODB;





iNSERT iNTO Medico VALUES (1,'Andre', '1111-1111');
iNSERT iNTO Medico VALUES (2,'Arthur', '2222-2222');
iNSERT iNTO Medico VALUES (3, 'Marcia', '3333-3333');
iNSERT iNTO Medico VALUES (4, 'Jessica', '4444-4444' );
iNSERT iNTO Medico VALUES (5, 'Leonardo', '5555-5555');
iNSERT iNTO Medico VALUES (6, 'Paulo', '6666-6666');
iNSERT iNTO Medico VALUES (7, 'Joao', '7777-7777');
iNSERT iNTO Medico VALUES (8, 'Soraia', '8888-8888');
iNSERT iNTO Medico VALUES  (9, 'Elaine', '9999-9999');
iNSERT iNTO Medico VALUES (10, 'Jose Maria', '1010-1010');


iNSERT iNTO Especialidade VALUES (1, 'OTORRiNOLARiNGOLOGiA');
iNSERT iNTO Especialidade VALUES (2, 'PEDiATRiA');
iNSERT iNTO Especialidade VALUES (3, 'GiNECOLOGiA');
iNSERT iNTO Especialidade VALUES (4, 'CARDiOLOGiA');
iNSERT iNTO Especialidade VALUES (5, 'UROLOGiA');
iNSERT iNTO Especialidade VALUES (6, 'DERMATOLOGiA');
iNSERT iNTO Especialidade VALUES (7, 'OFTALMOLOGiA');
iNSERT iNTO Especialidade VALUES (8, 'GERiATRiA');
iNSERT iNTO Especialidade VALUES (9, 'ORTOPEDiA');
iNSERT iNTO Especialidade VALUES (10,'CLiNiCO GERAL');


iNSERT iNTO Clinica VALUES (1, 'centro de otorrino', 'Centro');
iNSERT iNTO Clinica VALUES (2, 'clinica pediatrica', 'barro preto');
iNSERT iNTO Clinica VALUES (3, 'clinica papa nicolau',  'barro preto');
iNSERT iNTO Clinica VALUES (4, 'clinica sagrado', 'sagrada familia');
iNSERT iNTO Clinica VALUES (5, 'clinica urológica', 'sagrada familia');
iNSERT iNTO Clinica VALUES (6, 'clinica flor da pele',  'funcionarios');
iNSERT iNTO Clinica VALUES (7, 'ortocentro', 'padre eustaquio');
iNSERT iNTO Clinica VALUES (8, 'clinica bem estar', 'mangabeiras');
iNSERT iNTO Clinica VALUES(9, 'clinica oftalmo', 'santa efigenia');
iNSERT iNTO Clinica VALUES(10, 'centro de geriatria', 'centro' );



iNSERT iNTO Consulta VALUES (1, '2010-05-06', '2010-05-06 13:00:00.0', 4, 1, 4);
iNSERT iNTO Consulta VALUES (2, '2010-05-06', '2010-05-06 15:00:00.0', 8, 1, 10 );
iNSERT iNTO Consulta VALUES (3, '2010-06-09', '2010-06-09 13:00:00.0', 2, 2, 2 );

iNSERT iNTO Consulta VALUES (4, '2010-06-09', '2010-06-09 09:30:00.0', 10, 2, 8 );

iNSERT iNTO Consulta VALUES (5, '2010-03-30', '2010-03-30 10:00:00.0', 1, 3, 1 );
iNSERT iNTO Consulta VALUES (6, '2010-03-30', '2010-03-30 21:30:00.0', 3, 4, 3 );
iNSERT iNTO Consulta VALUES (7, '2010-03-15', '2010-03-15 15:00:00.0', 5, 5, 5 );

iNSERT iNTO Consulta VALUES (8, '2010-03-21', '2010-03-21 18:00:00.0', 7, 6, 9 );
iNSERT iNTO Consulta VALUES(9, '2010-03-20', '2010-03-20 22:00:00.0', 9, 7, 7 );
iNSERT iNTO Consulta VALUES (10, '2010-03-20', '2010-03-20 22:00:00.0', 6, 8, 6 );

iNSERT iNTO Consulta VALUES (11,'2010-03-14', '2010-03-14 13:00:00.0', 10, 9, 8 );
iNSERT iNTO Consulta VALUES (12, '2010-03-30', '2010-03-30 09:00:00.0', 4, 10, 4 );




INSERT INTO MedicoEspecialidade VALUES (1,4 );
INSERT INTO MedicoEspecialidade VALUES (1, 8);
INSERT INTO MedicoEspecialidade VALUES (2, 2);
INSERT INTO MedicoEspecialidade VALUES (2, 10);
INSERT INTO MedicoEspecialidade VALUES (3, 1);
INSERT INTO MedicoEspecialidade VALUES (4, 3);
INSERT INTO MedicoEspecialidade VALUES (5, 5);
INSERT INTO MedicoEspecialidade VALUES (6, 7);
INSERT INTO MedicoEspecialidade VALUES (7, 9);
INSERT INTO MedicoEspecialidade VALUES (8, 6);
INSERT INTO MedicoEspecialidade VALUES (9,10);
INSERT INTO MedicoEspecialidade VALUES (10, 4);




INSERT INTO EspecialidadeClinica VALUES (1, 1);
INSERT INTO EspecialidadeClinica VALUES (2, 2);
INSERT INTO EspecialidadeClinica VALUES (3, 3);
INSERT INTO EspecialidadeClinica VALUES (4, 4);
INSERT INTO EspecialidadeClinica VALUES (5, 5);
INSERT INTO EspecialidadeClinica VALUES (6, 6);
INSERT INTO EspecialidadeClinica VALUES (7, 9);
INSERT INTO EspecialidadeClinica VALUES (8, 10);
INSERT INTO EspecialidadeClinica VALUES (9, 7);
INSERT INTO EspecialidadeClinica VALUES (10,8);





INSERT INTO MedicoClinica VALUES (1,4);
INSERT INTO MedicoClinica VALUES (1, 10);
INSERT INTO MedicoClinica VALUES (2, 2);
INSERT INTO MedicoClinica VALUES (2, 8);
INSERT INTO MedicoClinica VALUES (3, 1);
INSERT INTO MedicoClinica VALUES (4, 3);
INSERT INTO MedicoClinica VALUES (5, 5);
INSERT INTO MedicoClinica VALUES (6, 9);
INSERT INTO MedicoClinica VALUES (7, 7);
INSERT INTO MedicoClinica VALUES (8, 6);
INSERT INTO MedicoClinica VALUES (9, 8);
INSERT INTO MedicoClinica VALUES (10, 4);

/*1. Obter as especialidades do Dr Paulo*/
SELECT e.nome FROM especialidade e, medico m, medicoespecialidade me WHERE m.nome = "Paulo" AND me.medico_cod = m.cod AND e.cod = me.especialidade_cod;
/*2. Obter as datas das consultas do dr Arthur*/
SELECT c.data FROM consulta c, medico m WHERE m.nome = "Arthur" AND c.medico_cod = m.cod;
/*3. Selecione o nome do médico, o nome e endereço da clínica para todas as consultas que possuem especialidade ‘CLINICO GERAL’.*/
SELECT m.nome, c.nome, c.endereco FROM medico m, clinica c, consulta con, especialidade e WHERE e.nome = "CLiNiCO GERAL" AND e.cod = con.especialidade_cod AND m.cod = con.medico_cod AND c.cod = con.clinica_cod;
/*5. Mostre o nome e o endereço das clínicas que possuem consulta marcada para 30/03/2010;*/
SELECT c.nome, c.endereco FROM clinica c, consulta con WHERE con.data = '2010-03-30' AND con.clinica_cod = c.cod;
/*6. Recuperar nome dos médicos que atendem na Clínica Bem Estar;*/
SELECT m.nome FROM medico m, medicoclinica mc, clinica c WHERE c.nome = "Clínica Bem Estar" AND c.cod = mc.clinica_cod AND mc.medico_cod = m.cod;
/*7. Exiba o nome e endereço das clínicas onde o médico André trabalha;*/
SELECT c.nome, c.endereco FROM clinica c, medico m, medicoclinica mc WHERE m.nome = "André" AND m.cod = mc.medico_cod AND mc.clinica_cod = c.cod;
/*8. Insira 2 clinicas*/
iNSERT iNTO Clinica VALUES(11, 'cura tudo', 'jardim sul' );
iNSERT iNTO Clinica VALUES(12, 'olhos do bem', 'morumbi' );
/*9. Insira 2 médicos*/
iNSERT iNTO Medico VALUES (11, 'Mantonio', '7070-7009');
iNSERT iNTO Medico VALUES (12, 'Matue', '777-666');
/*10. Liste o Nome das Clinicas e suas especialidades*/
SELECT c.nome, e.nome FROM clinica c JOIN especialidadeclinica ec ON c.cod = ec.clinica_cod JOIN especialidade e ON ec.especialidade_cod = e.cod;
/*11. Liste o Nome de todas as clinicas e suas Especialidade.Clinicas que não possuem especialidade devem aparecer. Ordenar o resultado pelo nome da Clinica e Especialidade.*/
SELECT c.nome, e.nome FROM clinica c LEFT JOIN especialidadeclinica ec ON c.cod = ec.clinica_cod LEFT JOIN especialidade e ON ec.especialidade_cod = e.cod ORDER BY c.nome, e.nome;
/*12. Liste o nome de todos os médicos cadastrados e para aqueles que tem consulta, listar a data e hora da consulta.*/
SELECT m.nome, c.data, c.hora FROM medico m LEFT JOIN consulta c ON m.cod = c.medico_cod;
/*13. Liste para cada médico, o seu nome e a quantidade de consultas que ele possui.*/
SELECT m.nome, COUNT(c.cod) FROM medico m JOIN consulta c ON m.cod = c.medico_cod GROUP BY m.nome;
/*14. Liste para cada médico, o seu nome e a quantidade de consultas que ele possui. Médicos que não possuem consulta também devem aparecer no resultado.*/
SELECT m.nome, COUNT(c.cod) FROM medico m LEFT JOIN consulta c ON m.cod = c.medico_cod GROUP BY m.nome;
/*15. Liste o nome dos médicos e nome da clinicas. Os nomes das clinicas que não possuem medico, devem aparecer. Ordenado pelo nome da clinica, nome do médico*/
SELECT c.nome, m.nome FROM clinica c LEFT JOIN medicoclinica mc ON c.cod = mc.clinica_cod LEFT JOIN medico m ON m.cod = mc.medico_cod ORDER BY c.nome, m.nome;
/*16. Listar nomes das Clinicas que tem especialidade*/
SELECT c.nome FROM clinica c WHERE c.cod IN (SELECT ec.clinica_cod FROM especialidadeclinica ec);
/*17. Listar nomes dos médicos que não tem consulta*/
SELECT m.nome FROM medico m WHERE m.cod NOT IN (SELECT c.medico_cod FROM consulta c);
/*18. Listar nomes dos médicos que atendem na Clinica ortocentro*/
SELECT m.nome FROM medico m WHERE m.cod IN (SELECT mc.medico_cod FROM medicoclinica mc WHERE mc.clinica_cod = (SELECT c.cod FROM clinica c WHERE c.nome = "ortocentro"));
/*19. Listar nome do médico que teve a consulta mais antiga – usar min(data)*/
SELECT m.nome FROM medico m WHERE m.cod IN (SELECT c.medico_cod FROM consulta c WHERE c.data = (SELECT MIN(c.data) FROM consulta c));
/*20. Crie a tabela Folha_pagto e insira os dados:*/
CREATE TABLE Folha_Pagto ( medico_cod int, consulta_cod int, valor float,
primary key(medico_cod, consulta_cod),
foreign key (medico_cod) references Medico(cod),
foreign key (consulta_cod) references Consulta(cod) );
INSERT INTO Folha_Pagto VALUES (1,1,100), (1,2,150),(2,3,100), (2, 4, 150), (3,5,50);
/*21. Listar nomes dos médicos que recebem valor da consulta maior que a média*/
SELECT m.nome FROM medico m WHERE m.cod IN (SELECT f.medico_cod FROM folha_pagto f WHERE f.valor > (SELECT AVG(f.valor) FROM folha_pagto f));
