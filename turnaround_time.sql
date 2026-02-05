-- Calculate average and p90 turnaround time by workflow stage

SELECT
    workflow_stage,
    COUNT(*) AS items_processed,
    AVG(TIMESTAMP_DIFF(completed_at, started_at, MINUTE)) AS avg_minutes,
    APPROX_QUANTILES(
        TIMESTAMP_DIFF(completed_at, started_at, MINUTE),
        10
    )[OFFSET(9)] AS p90_minutes
FROM production_jobs
WHERE completed_at IS NOT NULL
GROUP BY workflow_stage
ORDER BY avg_minutes DESC;
