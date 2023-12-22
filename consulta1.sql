--CONSULTA 01
1- SELECT * FROM midias;
2- SELECT titulo FROM filmes;
3- SELECT nome FROM atores ORDER BY nome;
4- SELECT titulo FROM filmes ORDER BY titulo DESC;
5- SELECT nome FROM atores WHERE nome LIKE '%John%';
6- SELECT titulo,nome FROM filmes,atores WHERE nome = 'John Ford';
7- SELECT id_categoria,titulo FROM filmes WHERE id_categoria = 1; 
8- SELECT id_categoria,titulo FROM filmes WHERE id_categoria < 1 AND id_categoria > 2;
9- SELECT * FROM atores WHERE data_nasc IS NULL;
10- SELECT titulo FROM filmes WHERE titulo LIKE '%amanhecer%'; 
11- SELECT titulo FROM filmes WHERE titulo LIKE 'O%';
12- SELECT titulo FROM filmes WHERE titulo LIKE '_o%';
13- SELECT nome FROM atores WHERE data_nasc BETWEEN '1970-02-01' AND '1970-02-05' ORDER BY data_nasc;
14- SELECT nome FROM atores WHERE nome LIKE '%nh%';
