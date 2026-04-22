-- sql/08_rfm_base.sql
use EcommerceDB;

SELECT
    c.customer_unique_id,
    DATEDIFF(DAY, MAX(CAST(o.order_purchase_timestamp AS DATE)), '2018-10-17')   AS recency_days,
    COUNT(DISTINCT o.order_id)        AS frequency,
    ROUND(SUM(i.price), 2)            AS monetary
FROM olist_order_dataset o
JOIN olist_order_items_dataset i    ON o.order_id    = i.order_id
JOIN olist_customers_dataset c      ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY monetary DESC;