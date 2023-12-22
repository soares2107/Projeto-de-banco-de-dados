1- SELECT CURRENT_DATE;
2- SELECT id_filme, valor, valor*1.1 AS valor_aumento FROM filmes,locacao;
3- SELECT id_filme, valor, valor*1.1 AS valor_aumento, valor*1.1-valor AS diferenca FROM filmes,locacao;
4- SELECT UPPER (nome) FROM atores;
5- SELECT LOWER (nome) FROM atores;
6- SELECT nome || ' - ' || data_nasc FROM atores;
7- SELECT titulo FROM filmes WHERE titulo LIKE '%A%';
8- SELECT SUBSTRING(titulo, 1, 1) AS primeira_letra, id_categoria FROM filmes;
9- SELECT * FROM locacao WHERE data > CURRENT_DATE - INTERVAL '10 days';
10- SELECT * FROM locacao WHERE data BETWEEN CURRENT_DATE - INTERVAL '20 days' AND CURRENT_DATE - INTERVAL '15 days';
11- SELECT * FROM atores WHERE EXTRACT(WEEK FROM data_nasc) = EXTRACT(WEEK FROM CURRENT_DATE);


