/*João Pedro Assumpção Evaristo			147887

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
