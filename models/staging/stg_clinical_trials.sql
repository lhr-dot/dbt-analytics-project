SELECT
    nct_id,

    -- Identification
    raw_json->'protocolSection'->'identificationModule'->>'briefTitle' AS brief_title,
    raw_json->'protocolSection'->'identificationModule'->>'officialTitle' AS official_title,

    -- Status
    raw_json->'protocolSection'->'statusModule'->>'overallStatus' AS overall_status,
    raw_json->'protocolSection'->'statusModule'->'startDateStruct'->>'date' AS start_date,
    raw_json->'protocolSection'->'statusModule'->'completionDateStruct'->>'date' AS completion_date,

    -- Design
    raw_json->'protocolSection'->'designModule'->>'studyType' AS study_type,
    (raw_json->'protocolSection'->'designModule'->'enrollmentInfo'->>'count')::INTEGER AS enrollment_count,

    -- Lead sponsor
    raw_json->'protocolSection'->'sponsorCollaboratorsModule'->'leadSponsor'->>'name' AS lead_sponsor,
    raw_json->'protocolSection'->'sponsorCollaboratorsModule'->'leadSponsor'->>'class' AS sponsor_class

FROM {{ source('clinical_trials', 'clinical_trials_raw') }}
