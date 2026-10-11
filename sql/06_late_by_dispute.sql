-- Q3: Are disputed invoices more likely to be paid late?
SELECT
    Disputed,
    COUNT(*) AS total_invoices,
    COUNT_IF(DaysLate > 0) AS late_invoices,
    ROUND(100.0 * COUNT_IF(DaysLate > 0) / COUNT(*), 1) AS late_pct,
    ROUND(AVG(CASE WHEN DaysLate > 0 THEN DaysLate END), 1) AS avg_days_late,
    ROUND(AVG(DaysToSettle), 1) AS avg_days_to_settle
FROM 'data/WA_Fn-UseC_-Accounts-Receivable.csv'
GROUP BY Disputed
ORDER BY Disputed;