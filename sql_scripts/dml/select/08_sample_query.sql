/* 
Table: specifications_panel_products
 */
-- Retrieve records for 'mono' and 'poly' panel types
SELECT
    *
FROM
    specifications_panel_products
WHERE
    panel_type IN ('mono', 'poly');

-- Retrieve records with power max greater than 100 and order by maximum voltage in descending order
SELECT
    *
FROM
    specifications_panel_products
WHERE
    power_max > 100
ORDER BY
    maximum_voltage DESC;

-- Retrieve detailed information for panels with 'poly' type and maximum voltage above 50
SELECT
    spp.id,
    spp.manufacturer,
    spp.panel_type,
    spp.maximum_voltage,
    spp.short_circuit_current,
    spp.power_max,
    spp.name,
    pa.panel_array_name,
    pa.address AS panel_array_address,
    pa.date_installation_panel_array,
    pi.manufacturer AS inverter_manufacturer,
    pi.product_name_inverter,
    pi.max_dc_input_voltage AS inverter_max_dc_input_voltage
FROM
    specifications_panel_products spp
    JOIN panel_usage pu ON spp.id = pu.panel_product_id
    JOIN panel_arrays pa ON pu.panel_array_id = pa.id
    JOIN used_inverter ui ON pa.pv_system_id = ui.pv_system_id
    JOIN specifications_inverters pi ON ui.inverter_id = pi.id
WHERE
    spp.panel_type = 'poly'
    AND spp.maximum_voltage > 50
ORDER BY
    spp.manufacturer,
    spp.name;