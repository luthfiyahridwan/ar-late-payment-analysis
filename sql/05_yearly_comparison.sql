-- Q2b: Did late payment improve from 2012 to 2013?
SELECT
    YEAR(InvoiceDate) AS invoice_year,
    COUNT(*) AS total_invoices,
    COUNT_IF(DaysLate > 0) AS late_invoices,
    ROUND(100.0 * COUNT_IF(DaysLate > 0) / COUNT(*), 1) AS late_pct,
    ROUND(AVG(CASE WHEN DaysLate > 0 THEN DaysLate END), 1) AS avg_days_late,
    ROUND(AVG(DaysToSettle), 1) AS avg_days_to_settle
FROM 'data/WA_Fn-UseC_-Accounts-Receivable.csv'
GROUP BY invoice_year
ORDER BY invoice_year;