-- Delete records from log_status_pv_system_minutes where the state_of_battery_charge is below 20.0,
-- and the irradiance is less than 100.0, or the inverter power factor is below 0.9.
DELETE lspm
FROM
    log_status_pv_system_minutes lspm
WHERE
    lspm.state_of_battery_charge < 20.0
    AND (
        lspm.irradiance < 100.0
        OR lspm.inverter_power_factor < 0.9
    );

-- Delete log records from log_status_pv_system_minutes where the associated pv_systems operator is 'Operator XYZ'
DELETE lspm
FROM
    log_status_pv_system_minutes lspm
    JOIN pv_systems ps ON lspm.pv_system_id = ps.id
WHERE
    ps.operator = 'Operator XYZ';

-- Delete log records from log_status_pv_system_minutes where the associated pv_systems name contains the word 'Test'
DELETE lspm
FROM
    log_status_pv_system_minutes lspm
    JOIN pv_systems ps ON lspm.pv_system_id = ps.id
WHERE
    ps.name LIKE '%Test%';

-- Delete log records from log_status_pv_system_minutes where the associated pv_systems operator is 'Confident Current Ltd.' and the battery voltage is below 5.0
DELETE lspm
FROM
    log_status_pv_system_minutes lspm
    JOIN pv_systems ps ON lspm.pv_system_id = ps.id
WHERE
    ps.operator = 'Confident Current Ltd.'
    AND lspm.battery_dc_voltage_out < 5.0;

-- Delete log records from log_status_pv_system_minutes where the associated pv_systems name is 'Ohio Greenfield 22' and the irradiance is above 800
DELETE lspm
FROM
    log_status_pv_system_minutes lspm
    JOIN pv_systems ps ON lspm.pv_system_id = ps.id
WHERE
    ps.name = 'Ohio Greenfield 22'
    AND lspm.irradiance > 1300.0;

-- Delete log records from log_status_pv_system_minutes where the associated pv_systems operator is 'Fast Power Ltd.' and the inverter efficiency is below 90
DELETE lspm
FROM
    log_status_pv_system_minutes lspm
    JOIN pv_systems ps ON lspm.pv_system_id = ps.id
WHERE
    ps.operator = 'Fast Power Ltd.'
    AND lspm.inverter_efficiency < 90.0;

-- Delete log records from log_status_pv_system_minutes which are older than two years
DELETE FROM log_status_pv_system_minutes
WHERE
    datetime_log < NOW () - INTERVAL 2 YEAR;