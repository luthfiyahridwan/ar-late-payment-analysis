-- Q2: How does late payment trend month by month?
SELECT
    STRFTIME(InvoiceDate, '%Y-%m') AS invoice_month,
    COUNT(*) AS total_invoices,
    COUNT_IF(DaysLate > 0) AS late_invoices,
    ROUND(100.0 * COUNT_IF(DaysLate > 0) / COUNT(*), 1) AS late_pct,
    ROUND(AVG(CASE WHEN DaysLate > 0 THEN DaysLate END), 1) AS avg_days_late
FROM 'data/WA_Fn-UseC_-Accounts-Receivable.csv'
GROUP BY invoice_month
ORDER BY invoice_month;