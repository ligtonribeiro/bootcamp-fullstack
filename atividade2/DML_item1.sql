USE Vendas;

INSERT INTO tb_vendas (ID_NF,
                       ID_ITEM,
                       COD_PROD,
                       VALOR_UNIT,
                       QUANTIDADE,
                       DESCONTO) VALUES (1, 1, 1, 25, 10, 5),
                                        (1, 2, 2, 13.5, 3, NULL),
                                        (1, 3, 3, 10, 1, NULL),
                                        (1, 5, 5, 30, 1, NULL),
                                        (2, 1, 3, 15, 4, NULL),
                                        (2, 2, 4, 10, 5, NULL),
                                        (2, 3, 5, 30, 7, NULL),
                                        (3, 1, 1, 25, 5, NULL),
                                        (3, 2, 4, 10, 4, NULL),
                                        (3, 5, 5, 30, 5, NULL),
                                        (3, 4, 2, 13.5, 7, NULL),
                                        (4, 1, 5, 30, 10, 15),
                                        (4, 2, 4, 10, 12, 5),
                                        (4, 3, 1, 25, 13, 5),
                                        (4, 4, 2, 13.5, 15, 5),
                                        (5, 1, 3, 15, 3, NULL),
                                        (5, 2, 5, 30, 6, NULL),
                                        (6, 1, 1, 25, 22, 15),
                                        (6, 2, 3, 15, 25, 20),
                                        (7, 1, 1, 25, 10, 3),
                                        (7, 2, 2, 13.5, 10, 4),
                                        (7, 3, 3, 15, 10, 4),
                                        (7, 4, 5, 30, 10, 1);

# Item A) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT FROM tb_vendas WHERE DESCONTO IS NULL;

# Item B) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       ID_ITEM,
       COD_PROD,
       VALOR_UNIT,
       VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100)) AS VALOR_COM_DESCONTO
FROM tb_vendas
WHERE
    DESCONTO IS NOT NULL;

# Item C) -------------------------------------------------------------------------------------------------------------
UPDATE tb_vendas SET DESCONTO = 0 WHERE DESCONTO IS NULL;
SELECT * FROM tb_vendas;

# Item D) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       ID_ITEM,
       COD_PROD,
       VALOR_UNIT,
       VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100)) AS VALOR_COM_DESCONTO,
       QUANTIDADE * VALOR_UNIT AS VALOR_TOTAL
FROM tb_vendas;

# Item E) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM tb_vendas
GROUP BY ID_NF
ORDER BY VALOR_TOTAL DESC

# Item F) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       SUM(VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100))) AS VALOR_VENDIDO
FROM tb_vendas
GROUP BY ID_NF
ORDER BY VALOR_VENDIDO DESC

# Item G) -------------------------------------------------------------------------------------------------------------
SELECT COD_PROD,
       SUM(QUANTIDADE) AS QUANTIDADE
FROM tb_vendas
GROUP BY COD_PROD
ORDER BY QUANTIDADE DESC

# Item H) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       COD_PROD,
       SUM(QUANTIDADE) AS QUANTIDADE
FROM tb_vendas
WHERE QUANTIDADE > 10
GROUP BY ID_NF, COD_PROD

# Item I) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM tb_vendas
GROUP BY ID_NF
HAVING VALOR_TOTAL > 500;

# Item I) -------------------------------------------------------------------------------------------------------------
SELECT COD_PROD,
       MIN(VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100))) AS MENOR,
       MAX(VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100))) AS MAIOR,
       AVG(VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100))) AS MEDIA
FROM tb_vendas
GROUP BY COD_PROD;

# Item J) -------------------------------------------------------------------------------------------------------------
SELECT ID_NF,
       SUM(QUANTIDADE) AS QTDE_ITENS
FROM tb_vendas
GROUP BY ID_NF
ORDER BY QTDE_ITENS DESC
