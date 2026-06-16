-- Projeto: E-commerce Olist Data Analysis --
-- EDA - Análise Exploratória de Dados --
-- Autor: Ana Carolina Itacarambi --
-- 06/2026 --

-- 1. VISÃO GERAL DOS DADOS
-- Contagem de registros
SELECT 'customers' AS tabela, COUNT(*) AS registros FROM customers UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews UNION ALL
SELECT 'orders', COUNT(*) FROM orders UNION ALL
SELECT 'product_category_name_translation', COUNT(*) FROM product_category_name_translation UNION ALL
SELECT 'products', COUNT(*) FROM products UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers;

-- Período/datas
SELECT 
    MIN(order_purchase_timestamp) AS data_primeiro_pedido,
    MAX(order_purchase_timestamp) AS data_ultimo_pedido
FROM orders;

-- Quantidade de anos disponíveis nos dados
SELECT DISTINCT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS ano
FROM orders
ORDER BY ano;

-- 2. IDENTIFICANDO SE HÁ VALORES NULOS
-- Tabela ORDERS
SELECT COUNT(*) AS total_registros,
	COUNT(order_delivered_customer_date) AS delivered_not_null,
	COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS delivered_nulls,
	COUNT(order_estimated_delivery_date) AS estimated_date_not_null,
	COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS estimated_date_nulls
FROM orders;

-- Há valores nulos na coluna order_delivered_customer_date o que não necessariamente é um problema, pois pode indicar que a entrega ainda não aconteceu.

-- Tabela PRODUCTS
SELECT COUNT(*) AS total_registros,
	COUNT(product_category_name) AS category_not_null,
	COUNT(product_photos_qty) AS product_photo_not_null,
	COUNT(product_weight_g) AS weight_not_null,
	COUNT(product_length_cm) AS length_not_null,
	COUNT(product_height_cm) AS height_not_null,
	COUNT(product_width_cm) AS width_not_null
FROM products;

SELECT
	COUNT(*) FILTER (WHERE product_category_name IS NULL) AS category_nulls,
	COUNT(*) FILTER (WHERE product_photos_qty IS NULL) AS product_photos_nulls
FROM products;

-- Nem todos os produtos estão categorizados e com foto.

-- Tabela ORDER_REVIEWS
SELECT COUNT(*) AS total_registros,
	COUNT(review_score) AS review_score_not_null,
	COUNT(review_comment_title) AS reviews_title_not_null,
	COUNT(review_comment_message) AS review_message_not_null,
	COUNT(review_creation_date) AS review_date_not_null,
	COUNT(review_answer_timestamp) AS review_answer_timestamp_not_null
FROM order_reviews;

SELECT 
	COUNT(*) FILTER (WHERE review_comment_title IS NULL) AS review_title_nulls,
	COUNT(*) FILTER (WHERE review_comment_message IS NULL) AS review_message_nulls
FROM order_reviews;

-- Nem todas as avaliações possuem título e messagens.

-- 3. VALORES DISTINTOS
SELECT DISTINCT order_status FROM orders;
SELECT DISTINCT payment_type AS formas_pagamento FROM order_payments;
SELECT DISTINCT review_score FROM order_reviews ORDER BY review_score ASC;
SELECT DISTINCT product_category_name AS categorias FROM products;

-- 4. DISTRIBUIÇÃO DOS DADOS
-- Avaliações
SELECT review_score, COUNT(*) AS quantidade
FROM order_reviews
GROUP BY review_score
ORDER BY quantidade DESC;

-- Status dos pedidos
SELECT order_status, COUNT(*) AS quantidade
FROM orders
GROUP BY order_status
ORDER BY quantidade DESC;

-- Tipos de pagamento
SELECT payment_type, COUNT(*) AS quantidade
FROM order_payments
GROUP BY payment_type
ORDER BY quantidade DESC;

-- Distribuição geográfica dos clientes
SELECT customer_state, COUNT(*) AS total_clientes
FROM customers
GROUP BY customer_state
ORDER BY total_clientes DESC;

-- 5. ESTATÍSTICAS DESCRITIVAS
SELECT 
	MIN(payment_value) AS menor_pagamento,
	MAX(payment_value) AS maior_pagamento,
	ROUND(AVG(payment_value), 2) AS ticket_medio
FROM order_payments;

SELECT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY payment_value)
    AS mediana
FROM order_payments;