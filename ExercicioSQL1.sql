CREATE DATABASE EXERCICIO;
/*Criação da tabela ATOR*/
CREATE TABLE ATOR (
						coda integer,
                        nomeart varchar(25),
                        nomereal varchar(25),
                        nacionalidade varchar(25),
                        sexo char,
                        indicacoesoscar integer,
                        num_oscar integer,
	PRIMARY KEY(coda));
    
/*Criação da tabela FILME*/

CREATE TABLE FILME (
						codf integer,
                        nome varchar(25),
                        ano date,
                        orcamento float,
                        tempo float,
	PRIMARY KEY(codf));
    
/*Criação da tabela PERSONAGEM*/

CREATE TABLE PERSONAGEM(
						coda integer,
                        codf integer,
                        personagem varchar(25),
                        cache float,
PRIMARY KEY(coda, codf),
FOREIGN KEY (coda) REFERENCES ATOR(coda),
FOREIGN KEY (codf) REFERENCES FILME(codf));

/*Inserção na tabela ATOR */
INSERT INTO ATOR(coda, nomeart, nomereal, nacionalidade, sexo, indicacoesoscar, c)
VALUES(
		1,
        'DemiMoore',
        'MariadaSilva',
        'USA',
        'f',
        0,
        0
	),
    (
		2,
        'BradPitt',
        'JoaoPaulo',
        'USA',
        'f',
        1,
        0
    ),
    (
		3,
        'DustinHoffman',
        'DustinHoffman',
        'USA',
        'm',
        2,
        0
    ),
    (
		4,
        'JessicaLange',
        'JessicaLange',
        'USA',
        'f',
        4,
        2
    ),
    (
		5,
        'SoniaBraga',
        'SoniaBraga',
        'Brasil',
        'f',
        0,
        0 
    );
    
/*Inserção na tabela FILME */
INSERT INTO FILME(codf, nome, ano, orcamento, tempo)
VALUES(
		1,
        'AJurada',
        '1996-01-01',
        1000000,
        18
	),
    (
		2,
        'ALetraEscarlate',
        '1995-01-01',
        10000000,
        24
    ),
    (
		3,
        'Seven',
        '1995-01-01',
        1500000,
        20
    ),
    (
		4,
        'Tootsie',
        '1982-01-01',
        50000,
        16
    ),
    (
		5,
        'Tieta',
        '1995-01-01',
        200000,
        18
    );
    
/*Inserção na tabela PERSONAGEM*/
INSERT INTO PERSONAGEM(coda, codf, personagem, cache)
VALUES(
		1,
        1,
        'Mary',
        3.000
	),
    (
		1,
        2,
        'Sandy',
        5.000
    ),
    (
		2,
        3,
        'John',
        5.000
    ),
    (
		3,
        4,
        'Mary',
        1000
    ),
    (
		4,
        4,
        'Tootsie',
        2.000
    ),
    (
		5,
        5,
        'Tieta',
        500
    );

/*Comando para deabilitar o modo de atualização segura e evitar o erro 1175*/
SET SQL_SAFE_UPDATES = 0;
/*1) Altere o sexo do ator Brad Pitt*/
UPDATE ATOR
SET sexo = 'm'
WHERE coda = 2;

/*2) Altere o cache dos personagens em 10%*/
UPDATE PERSONAGEM
SET cache = cache * 1.10;

/*3) Exclua o filme tieta. É possível? Explique*/
DELETE FROM FILME
WHERE codf = 5;
/*Não é possível deletar o filme Tieta porque ele possui uma relação parental,
sendo FK do personagem Tieta da tabela PERSONAGEM. Como não foi estabelecido uma cláusula ON DELETE,
o sgbd impede a exclusão.*/

/*4) Exclua o personagem Tootsie. É possível? Explique*/
DELETE FROM PERSONAGEM
WHERE personagem = 'Tootsie';
/*Nesse caso, depois de desativo o modo de atualizações seguras, é possível sim
deletar o personagem pois a tabela PERSONAGEM não possui relação parental de FK com outras tabelas, isto é,
nenhuma tabela possui chaves dependentes de PERSONAGEM.*/

/*1. os dados de todas as atrizes;*/
SELECT * FROM ATOR WHERE sexo = 'f';

/*2. o nome e sexo dos artistas;*/
SELECT nomereal, sexo FROM ATOR;

/*3. o nome e o número de oscars indicados e recebidos; (fazer um calculo, ex: select num +5 > total)*/
SELECT nomereal, indicacoesoscar + num_oscar AS totaloscar FROM ATOR;

/*4. o código dos filmes onde houve  artista com cachê menor  que 1000;*/
SELECT PERSONAGEM.codf FROM PERSONAGEM WHERE PERSONAGEM.cache<1000; 

/*5. o nome dos personagens desempenhados por Demi Moore; não usar o código da Demi Moore, procurar pelo nome.*/
SELECT personagem FROM PERSONAGEM WHERE PERSONAGEM.coda = (SELECT ATOR.coda FROM ATOR WHERE nomeart = 'DemiMoore');

/*6. o nome dos filmes desempenhados por Demi Moore;*/
SELECT nome FROM FILME WHERE codf  IN (SELECT codf FROM PERSONAGEM WHERE PERSONAGEM.coda = 1);

/*7. o nome artístico completo de todas as atrizes chamadas Jessica; use LIKE*/
SELECT nomeart FROM ATOR WHERE nomereal LIKE '%Jessica%';

/*8. o nome dos artistas que tem duas indicações a mais que oscar ganhos;*/
SELECT nomereal FROM ATOR WHERE indicacoesoscar - num_oscar >=2;

/*9. o nome de todos os artistas em ordem alfabética; usar order by*/
SELECT nomereal FROM ATOR order by nomereal;

/*10. O nome dos personagens desempenhados por cada atriz;*/
SELECT personagem FROM PERSONAGEM WHERE coda IN (SELECT coda FROM ATOR WHERE sexo = 'f');

/*11. o número de atrizes;*/
SELECT COUNT(nomereal) FROM ATOR WHERE sexo = 'f';

/*12. a soma dos orçamentos dos filmes;*/
SELECT SUM(orcamento) FROM FILME;
 