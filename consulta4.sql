1-SELECT MAX(valor) AS maior_valor, MIN(valor) AS menor_valor, AVG(valor) AS valor_medio
FROM locacao;

2-SELECT nome, data_nasc
FROM atores
ORDER BY data_nasc ASC NULLS LAST
LIMIT 1; -- Ator mais novo

SELECT nome, data_nasc
FROM atores
ORDER BY data_nasc DESC NULLS LAST
LIMIT 1; -- Ator mais velho

3-SELECT STDDEV(valor) AS desvio_padrao, VARIANCE(valor) AS variancia
FROM locacao;

4-SELECT
  ROUND(MAX(valor)::numeric, 2) AS maior_valor,
  ROUND(MIN(valor)::numeric, 2) AS menor_valor,
  ROUND(AVG(valor)::numeric, 2) AS valor_medio
FROM locacao;


SELECT
  ROUND(STDDEV(valor)::numeric, 2) AS desvio_padrao,
  ROUND(VARIANCE(valor)::numeric, 2) AS variancia
FROM locacao;

5-SELECT
  c.nome AS nome_cliente,
  SUM(l.valor) AS valor_total_pago
FROM
  cliente c
JOIN
  locacao l ON c.id_cliente = l.id_cliente
GROUP BY
  c.nome;

6-SELECT
  c.nome AS nome_cliente,
  SUM(l.valor) AS valor_total_pago
FROM
  cliente c
JOIN
  locacao l ON c.id_cliente = l.id_cliente
GROUP BY
  c.nome
ORDER BY
  valor_total_pago DESC;

7-SELECT a.nome, COUNT(p.id_ator) AS numero_participacoes
FROM atores a
LEFT JOIN participacao p ON a.id_ator = p.id_ator
GROUP BY a.nome;

8-SELECT ROUND((SELECT MAX(valor) - MIN(valor) FROM locacao)::numeric, 2) AS diferenca_entre_max_e_min;

9-SELECT c.nome, MIN(l.valor) AS menor_valor_locacao
FROM cliente c
JOIN locacao l ON c.id_cliente = l.id_cliente
GROUP BY c.nome;

