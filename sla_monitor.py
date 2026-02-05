import pandas as pd

# Load daily operations data
df = pd.read_csv("daily_jobs.csv")

# Calculate SLA breach rate
df["breached_sla"] = df["turnaround_minutes"] > df["sla_minutes"]

sla_summary = (
    df.groupby("workflow_stage")["breached_sla"]
    .mean()
    .reset_index()
    .rename(columns={"breached_sla": "breach_rate"})
)

print(sla_summary)
