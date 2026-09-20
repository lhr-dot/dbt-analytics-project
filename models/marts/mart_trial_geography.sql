SELECT
    nct_id,
    country,
    COUNT(*) AS location_count
FROM {{ ref('stg_clinical_trial_locations') }}
GROUP BY
    nct_id,
    country
