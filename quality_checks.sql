-- Identify failed or low-quality outputs by reason

SELECT
    failure_reason,
    COUNT(*) AS total_issues
FROM quality_reviews
WHERE review_status = 'failed'
GROUP BY failure_reason
ORDER BY total_issues DESC;
