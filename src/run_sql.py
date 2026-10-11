import sys
import duckdb

file_sql = sys.argv[1]

with open(file_sql, encoding='utf-8') as f:
    query = f.read()

print(duckdb.sql(query).df().to_string())