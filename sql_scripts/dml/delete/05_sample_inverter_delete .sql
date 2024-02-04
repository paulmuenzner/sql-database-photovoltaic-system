-- Delete records where the installation date is before 2023-04-21 and the associated inverter is of type 'mppt'
DELETE FROM used_inverter u
JOIN specifications_inverters si ON u.inverter_id = si.id
WHERE
    u.date_installation_inverter < '2023-04-21'
    AND si.charge_controller_type = 'mppt';

-- Delete records where the associated pv_system_id is from a specific region and the inverter manufacturer is 'Endro Load'
DELETE u
FROM
    used_inverter u
    JOIN pv_systems p ON u.pv_system_id = p.id
    JOIN specifications_inverters si ON u.inverter_id = si.id
WHERE
    p.region = 'Ohio'
    AND si.manufacturer = 'Endro Load';

-- Delete records where the installation date is in the past month and the inverter has a power factor range of '0.9 - 1.0'
DELETE FROM used_inverter
WHERE
    date_installation_inverter >= DATE_SUB (CURDATE (), INTERVAL 1 MONTH)
    AND inverter_id IN (
        SELECT
            id
        FROM
            specifications_inverters
        WHERE
            power_factor_range = '0.9 - 1.0'
    );