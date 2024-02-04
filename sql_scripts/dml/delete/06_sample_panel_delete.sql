-- Delete records where the manufacturer is 'High Panels Ltd.' and the power max is less than 300
DELETE spp
FROM
    specifications_panel_products spp
WHERE
    spp.manufacturer = 'High Panels Ltd.'
    AND spp.power_max < 300.0
    AND NOT EXISTS (
        SELECT
            1
        FROM
            used_inverter ui
            JOIN pv_systems ps ON ui.pv_system_id = ps.id
        WHERE
            ps.operator = 'Fast Power Ltd.'
            AND ui.inverter_id = 5 -- Example additional condition based on used_inverter and pv_systems
    );

-- Delete records where the open circuit voltage is greater than 30 and the panel type is 'cdte' or 'tfsc'
DELETE spp
FROM
    specifications_panel_products spp
WHERE
    spp.open_circuit_voltage > 30
    AND spp.panel_type IN ('cdte', 'tfsc')
    AND EXISTS (
        SELECT
            1
        FROM
            specifications_solar_charge_controllers ssc
        WHERE
            ssc.max_self_consumption > 5.0 -- Example additional condition based on specifications_solar_charge_controllers
    );

-- Delete records where the maximum voltage is less than 50 and the panel type is 'mono' or 'poly'
DELETE FROM specifications_panel_products
WHERE
    maximum_voltage < 50
    AND panel_type IN ('mono', 'poly');

-- Delete records where the manufacturer is 'Effiecient Panels 4 Ltd.' and the power max is less than 300
DELETE FROM specifications_panel_products
WHERE
    manufacturer = 'Effiecient Panels 4 Ltd.'
    AND power_max < 300.0;

-- Delete records where the open circuit voltage is greater than 30 and the panel type is 'cdte' or 'tfsc'
DELETE FROM specifications_panel_products
WHERE
    open_circuit_voltage > 30
    AND panel_type IN ('cdte', 'tfsc');

-- Delete records where the short circuit current is less than 10 and the maximum power current is greater than 5
DELETE FROM specifications_panel_products
WHERE
    short_circuit_current < 10
    AND max_power_current > 5.0;

-- Delete records where the name contains the word 'obsolete' and the manufacturer is 'Miami Solar Ltd.'
DELETE FROM specifications_panel_products
WHERE
    name LIKE '%obsolete%'
    AND manufacturer = 'Miami Solar Ltd.';