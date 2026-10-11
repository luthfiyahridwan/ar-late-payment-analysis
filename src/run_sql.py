import sys
import duckdb

# Read the SQL file name from the terminal command
file_sql = sys.argv[1]

with open(file_sql, encoding="utf-8") as f:
    query = f.read()

# Run the query and convert the result to a table
result = duckdb.sql(query).df()

# Show whole numbers without ".0"
result = result.convert_dtypes()

# Print the full table without the row index
print(result.to_string(index=False))