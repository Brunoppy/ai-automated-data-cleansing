# AI-Driven Automated Data Cleansing Pipeline
import json
import pymysql

# Connect to database
conn = pymysql.connect(host='localhost', user='root', password='password', db='ai_data_cleansing')
cursor = conn.cursor()

# Fetch raw data
cursor.execute("SELECT id, data FROM raw_data")
raw_records = cursor.fetchall()

# Simple cleansing example (removing empty fields)
cleaned_records = []
for record in raw_records:
    data = json.loads(record[1])
    cleaned_data = {k: v for k, v in data.items() if v}  # Remove empty fields
    
    # Insert cleaned data
    cursor.execute("INSERT INTO cleaned_data (original_id, cleaned_data) VALUES (%s, %s)", 
                   (record[0], json.dumps(cleaned_data)))
    cleaned_records.append(cleaned_data)

conn.commit()
cursor.close()
conn.close()

print("Data cleansing completed successfully!")
