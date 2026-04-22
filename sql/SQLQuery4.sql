-- sql/03_top_categories.sql
USE EcommerceDB;
SELECT TOP 10
    p.product_category_name           AS category,
    COUNT(DISTINCT o.order_id)        AS total_orders,
    ROUND(SUM(i.price), 2)            AS total_revenue,
    ROUND(AVG(i.price), 2)            AS avg_price
FROM olist_order_dataset o
JOIN olist_order_items_dataset i    ON o.order_id   = i.order_id
JOIN olist_products_dataset p       ON i.product_id = p.product_id
WHERE o.order_status = 'delivered'
  AND p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;