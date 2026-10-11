import duckdb

hasil = duckdb.sql("""
    SELECT COUNT(*) AS jumlah_invoice,
           COUNT(DISTINCT customerID) AS jumlah_customer
    FROM 'data/WA_Fn-UseC_-Accounts-Receivable.csv'
""")
print(hasil)