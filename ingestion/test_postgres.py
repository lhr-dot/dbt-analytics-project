import psycopg

connection = psycopg.connect(
    "dbname=pharma_clinical_trials user=loubna host=localhost port=5432"
)

print("Connexion PostgreSQL réussie !")

connection.close()
