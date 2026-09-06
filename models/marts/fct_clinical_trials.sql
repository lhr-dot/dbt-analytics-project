SELECT
    nct_id,
    brief_title,
    official_title,
    overall_status,
    study_type,
    start_date,
    completion_date,
    enrollment_count,
    lead_sponsor,
    sponsor_class
FROM {{ ref('stg_clinical_trials') }}
