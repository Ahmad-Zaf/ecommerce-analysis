-- sql/02_monthly_revenue.sql
use EcommerceDB;

SELECT
    FORMAT(CAST(o.order_purchase_timestamp AS DATE), 'yyyy-MM') AS month,
    ROUND(SUM(i.price), 2)                                      AS revenue,
    COUNT(DISTINCT o.order_id)                                  AS total_orders
FROM olist_order_dataset o
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY FORMAT(CAST(o.order_purchase_timestamp AS DATE), 'yyyy-MM')
ORDER BY month;