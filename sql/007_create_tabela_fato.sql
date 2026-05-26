------------------------------
-- TABELA FATO PARA POWER BI
------------------------------

SELECT
	o.order_id,
	DATE(o.order_purchase_timestamp) AS order_date,
	o.order_status,
	COALESCE(p.product_category_name, 'unknown') AS category,
	ore.review_score,
	oi.price,
	oi.freight_value,
	c.customer_city,
	c.customer_state
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN customers c
    ON o.customer_id = c.customer_id
LEFT JOIN order_reviews ore
	ON o.order_id = ore.order_id;