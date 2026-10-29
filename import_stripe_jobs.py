
import pandas as pd
import mysql.connector

csv_path = r"C:\Users\lenovo\Desktop\project\Project 6\Stripe_Job_Postings_Import.csv"

# Read CSV
df = pd.read_csv(csv_path, encoding="utf-8")
print("CSV rows:", len(df))
print("CSV columns:", len(df.columns))

password = input("Enter MySQL root password: ")

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password=password,
    database="stripe_job_analytics"
)
cursor = conn.cursor()

# Create a table with text columns to preserve the CSV values
column_definitions = ", ".join(
    f"`{col}` LONGTEXT"
    for col in df.columns
)
create_sql = f"CREATE TABLE IF NOT EXISTS stripe_jobs_import ({column_definitions})"
cursor.execute(create_sql)

# Insert rows in batches
columns = ", ".join(f"`{col}`" for col in df.columns)
placeholders = ", ".join(["%s"] * len(df.columns))
insert_sql = f"INSERT INTO stripe_jobs_import ({columns}) VALUES ({placeholders})"

df = df.astype(object).where(pd.notna(df), None)

batch_size = 50
for start in range(0, len(df), batch_size):
    batch = df.iloc[start:start + batch_size]
    cursor.executemany(insert_sql, batch.values.tolist())
    conn.commit()
    print(f"Imported {min(start + batch_size, len(df))}/{len(df)}")

cursor.execute("SELECT COUNT(*) FROM stripe_jobs_import")
print("Total rows in table:", cursor.fetchone()[0])

cursor.close()
conn.close()
