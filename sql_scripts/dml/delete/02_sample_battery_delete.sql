-- Delete records where max_capacity is less than 50 and discharge_rate is 'Low'
DELETE FROM battery
WHERE
    max_capacity < 50
    AND discharge_rate = 'Low';

-- Delete records where type is 'Lead Acid' and max_depth_discharge is greater than 3.0
DELETE FROM battery
WHERE
    type = 'Lead Acid'
    AND max_depth_discharge > 10.0;

-- Delete records where manufacturer is 'Compact Batteries Ltd.' and charge_rate is 'High'
-- and the associated pv_system_id is from a specific region
DELETE b
FROM
    battery b
    JOIN pv_systems p ON b.pv_system_id = p.id
WHERE
    b.manufacturer = 'Compact Batteries Ltd.'
    AND b.charge_rate = '3C'
    AND p.region = 'Nevada';

-- Delete records from battery table where there is no corresponding pv_system_id in pv_systems table
DELETE FROM battery
WHERE
    pv_system_id NOT IN (
        SELECT
            id
        FROM
            pv_systems
    );