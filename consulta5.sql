1- SELECT *
FROM imoveis
WHERE bairro = (SELECT bairro FROM imoveis WHERE codigo = 2)
  AND codigo <> 2;
2-SELECT *
FROM imoveis
WHERE preco > (SELECT AVG(preco) FROM imoveis);
3-SELECT c.*
FROM compradores c
JOIN ofertas o ON c.codigo = o.codigo_comprador
WHERE o.valor > 70000;

SELECT * 
FROM imoveis 
WHERE codigo IN (
    SELECT codigo_imovel 
    FROM ofertas 
    WHERE valor > (SELECT AVG(valor) FROM ofertas)
);

SELECT i.*
FROM imoveis i
WHERE preco > (
    SELECT AVG(preco) 
    FROM imoveis 
    WHERE bairro = i.bairro
);

SELECT bairro, MAX(preco) AS maior_preco
FROM imoveis
GROUP BY bairro
HAVING MAX(preco) > (SELECT AVG(preco) FROM imoveis);


WITH MenorPrecoVendedor AS (
    SELECT codigo_vendedor, MIN(preco) AS menor_preco
    FROM imoveis
    GROUP BY codigo_vendedor
)
SELECT i.*
FROM imoveis i
JOIN MenorPrecoVendedor mpv ON i.codigo_vendedor = mpv.codigo_vendedor AND i.preco = mpv.menor_preco;

SELECT o.*
FROM ofertas o
JOIN imoveis i ON o.codigo_imovel = i.codigo
WHERE i.data_lancamento > current_date - 180 AND i.data_lancamento < current_date - 30 AND i.codigo_vendedor = 2;

WITH MenorPrecoVendedor AS (
    SELECT codigo_vendedor, MIN(preco) AS menor_preco
    FROM imoveis
    GROUP BY codigo_vendedor
)
SELECT i.*
FROM imoveis i
JOIN MenorPrecoVendedor mpv ON i.codigo_vendedor <> mpv.codigo_vendedor AND i.preco = mpv.menor_preco;

WITH MenorOfertaComprador2 AS (
    SELECT MIN(valor) AS menor_oferta
    FROM ofertas
    WHERE codigo_comprador = 2
)
SELECT o.*
FROM ofertas o
JOIN MenorOfertaComprador2 moc ON o.valor < moc.menor_oferta AND o.codigo_comprador <> 2;

SELECT i.*
FROM imoveis i
JOIN imoveis iv3 ON i.estado = iv3.estado AND i.cidade = iv3.cidade
WHERE iv3.codigo_vendedor = 3 AND i.codigo_vendedor <> 3;

SELECT DISTINCT bairro
FROM imoveis
WHERE estado = (SELECT estado FROM imoveis WHERE codigo = 5)
  AND cidade = (SELECT cidade FROM imoveis WHERE codigo = 5)
  AND bairro = (SELECT bairro FROM imoveis WHERE codigo = 5);

