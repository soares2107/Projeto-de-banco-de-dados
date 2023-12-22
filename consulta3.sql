1- SELECT f.id_filme, f.titulo, a.nome
FROM filmes f
JOIN participacao p ON f.id_filme = p.id_filme
JOIN atores a ON p.id_ator = a.id_ator;

2-SELECT f.id_filme, a.nome, a.data_nasc
FROM filmes f
JOIN participacao p ON f.id_filme = p.id_filme
JOIN atores a ON p.id_ator = a.id_ator;

3-SELECT m.id_filme, l.id_cliente, c.nome
FROM locacao l
JOIN midias m ON l.id_midia = m.id_midia
JOIN cliente c ON l.id_cliente = c.id_cliente
WHERE l.id_cliente = 5;

4-SELECT DISTINCT f.titulo
FROM filmes f
JOIN midias m ON f.id_filme = m.id_filme
JOIN locacao l ON m.id_midia = l.id_midia;

5-SELECT c.nome
FROM cliente c
JOIN locacao l ON c.id_cliente = l.id_cliente
JOIN midias m ON l.id_midia = m.id_midia
JOIN filmes f ON m.id_filme = f.id_filme
WHERE f.titulo = 'O vento levou';

6-SELECT f.titulo
FROM filmes f
LEFT JOIN locacao l ON f.id_filme = l.id_midia
WHERE l.id_midia IS NULL;



