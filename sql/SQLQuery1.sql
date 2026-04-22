USE EcommerceDB;
SELECT
    COUNT(DISTINCT o.order_id)        AS total_orders,
    ROUND(SUM(i.price), 2)            AS total_revenue,
    ROUND(AVG(i.price), 2)            AS avg_order_value,
    ROUND(AVG(r.review_score), 1)     AS avg_review_score
FROM olist_order_dataset o
JOIN olist_order_items_dataset i        ON o.order_id = i.order_id
LEFT JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered';