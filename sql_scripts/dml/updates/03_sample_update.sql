-- Update the charge rate for a specific battery based on its name
UPDATE battery
SET
    charge_rate = '5C'
WHERE
    battery_name = 'Glory 30';

-- Update the maximum depth of discharge for a specific battery based on its ID
UPDATE battery
SET
    max_depth_discharge = 10
WHERE
    id = 1;

-- Update the discharge rate for batteries with a certain type and maximum capacity range
UPDATE battery
SET
    discharge_rate = '1C'
WHERE
    type = 'Lithium-ion'
    AND manufacturer = 'Double High Ltd.'
    AND max_capacity BETWEEN 180.0 AND 200.0;