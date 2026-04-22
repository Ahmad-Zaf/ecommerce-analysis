-- sql/06_revenue_by_state.sql
use EcommerceDB;

SELECT TOP 10
    c.customer_state                  AS state,
    COUNT(DISTINCT o.order_id)        AS total_orders,
    ROUND(SUM(i.price), 2)            AS total_revenue
FROM olist_order_dataset o
JOIN olist_order_items_dataset i    ON o.order_id    = i.order_id
JOIN olist_customers_dataset c      ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_revenue DESC;