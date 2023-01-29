 /*1. a soma das idades das atrizes.*/
 SELECT SUM(idade) FROM ator WHERE sexo = 'f';
/*2. o nome do artista e o número de filmes em que participou;*/
SELECT ator.nomeart, COUNT(*) FROM ator, personagem WHERE personagem.coda = ator.coda GROUP BY ator.nomeart;

/*3. para cada ator que não ganhou oscar, listar o seu nome, ano de seu filme mais antigo e do mais novo;*/
SELECT nomeart, max(ano) as mais_recente, min(ano) as mais_velho
FROM ator a, filme f, personagem p
WHERE a.coda = p.coda and p.codf = f.codf and a.oscar = 0
GROUP BY a.nomeart;

/*4. para cada filme listar: o nome do filme, média de cachês pagos por filme, cachê mais alto, cachê
mais baixo, e total dos cachês pagos;*/
SELECT f.nome, avg(p.cache) as cache_medio, max(p.cache) as cache_alto, min(p.cache) as cache_minimo, sum(p.cache) as cache_total
FROM filme f, personagem p
WHERE f.codf = p.codf
GROUP BY f.nome;

/*5. o nome do artista e o número de filmes em que participou, para todo artista que participou de
no mínimo 2 filmes;*/
SELECT nomeart, count(p.coda)
FROM ator a, personagem p
WHERE a.coda = p.coda
GROUP BY a.nomeart
HAVING count(codf) >= 2;

/*6. o número de caches distintos maiores do que 2000 pagos em cada filme, para todo filme onde
a soma dos cachês destes artistas foi inferior a 8000. ( use count (distinct cache) )*/
SELECT f.nome, count(distinct cache)
FROM filme f, personagem p
WHERE f.codf = p.codf and p.cache > 2000
GROUP BY f.codf
HAVING sum(p.cache)<8000;