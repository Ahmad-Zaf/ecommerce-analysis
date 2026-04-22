-- sql/05_delay_vs_review.sql
use EcommerceDB;
SELECT
    r.review_score,
    ROUND(AVG(DATEDIFF(DAY,
        CAST(o.order_estimated_delivery_date AS DATE),
        CAST(o.order_delivered_customer_date AS DATE)
    )), 2)                           AS avg_delay_days,
    COUNT(*)                         AS order_count
FROM olist_order_dataset o
JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;