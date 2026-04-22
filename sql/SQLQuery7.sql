-- sql/07_payment_methods.sql
use EcommerceDB;

SELECT
    payment_type,
    COUNT(*)                          AS total_transactions,
    ROUND(SUM(payment_value), 2)      AS total_value,
    ROUND(AVG(payment_value), 2)      AS avg_value
FROM olist_payments_dataset
GROUP BY payment_type
ORDER BY total_value DESC;