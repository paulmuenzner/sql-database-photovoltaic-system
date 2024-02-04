-- Delete records where the operator is 'Green Electrification Ltd.' and the name starts with 'Old'
DELETE FROM pv_systems
WHERE
    operator = 'Green Electrification Ltd.'
    AND name LIKE 'Old%';

-- Delete records where the operator is 'Better Power Ltd.' and there are no associated batteries
DELETE FROM pv_systems
WHERE
    operator = 'Better Power Ltd.'
    AND id NOT IN (
        SELECT
            pv_system_id
        FROM
            battery
    );

-- Delete records where the name is 'Community One' and the operator is 'Effi Grid Ltd.'
DELETE FROM pv_systems
WHERE
    name = 'Community One'
    AND operator = 'Effi Grid Ltd.';