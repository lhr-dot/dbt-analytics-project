import json
import urllib.request

import psycopg


API_URL = "https://clinicaltrials.gov/api/v2/studies?format=json&pageSize=10"

DB_CONNECTION = (
    "dbname=pharma_clinical_trials "
    "user=loubna "
    "host=localhost "
    "port=5432"
)


# 1. Récupérer les études depuis ClinicalTrials.gov
response = urllib.request.urlopen(API_URL)
data = json.load(response)

studies = data["studies"]

print(f"Études récupérées depuis l'API : {len(studies)}")


# 2. Se connecter à PostgreSQL
with psycopg.connect(DB_CONNECTION) as connection:

    # 3. Insérer chaque étude dans la table RAW
    with connection.cursor() as cursor:

        for study in studies:

            nct_id = study["protocolSection"]["identificationModule"]["nctId"]

            cursor.execute(
                """
                INSERT INTO raw.clinical_trials_raw (
                    nct_id,
                    raw_json
                )
                VALUES (%s, %s)
                ON CONFLICT (nct_id)
                DO UPDATE SET
                    raw_json = EXCLUDED.raw_json,
                    ingested_at = CURRENT_TIMESTAMP;
                """,
                (nct_id, json.dumps(study))
            )


print("Données chargées dans PostgreSQL.")
