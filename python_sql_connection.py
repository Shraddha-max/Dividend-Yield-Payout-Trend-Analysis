import mysql.connector
import pandas as pd

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="dividend_analysiss"
)

print("MySQL connection successful!")

# SQL query
query = """
SELECT *
FROM nifty
LIMIT 10;
"""

# Retrieve data
df = pd.read_sql(query, connection)

print("\nData retrieved successfully!")
print(df)

# Close connection
connection.close()

print("\nMySQL connection closed.")