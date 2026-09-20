SELECT
    nct_id,
    location->>'facility' AS facility,
    location->>'city' AS city,
    location->>'state' AS state,
    location->>'country' AS country,
    location->>'status' AS status,
    (location->'geoPoint'->>'lat')::DOUBLE PRECISION AS latitude,
    (location->'geoPoint'->>'lon')::DOUBLE PRECISION AS longitude
FROM {{ source('clinical_trials', 'clinical_trials_raw') }},
     jsonb_array_elements(
         raw_json->'protocolSection'
                 ->'contactsLocationsModule'
                 ->'locations'
     ) AS location
