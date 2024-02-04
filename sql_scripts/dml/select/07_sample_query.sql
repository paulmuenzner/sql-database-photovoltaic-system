/* 
Table: specifications_solar_charge_controllers
 */
-- Select charge controllers with high efficiency and aut load disconnect feature
SELECT
    ssc.id,
    ssc.manufacturer,
    ssc.product_name_charge_controller,
    ssc.rated_charge_current,
    ssc.battery_voltage_range,
    ssc.max_self_consumption,
    ssc.nominal_pv_power,
    ssc.aut_load_disconnect
FROM
    specifications_solar_charge_controllers ssc
    JOIN pv_systems ps ON ssc.manufacturer = ps.operator
WHERE
    ssc.peak_efficiency > 90.0
    AND ssc.aut_load_disconnect = 1
    AND ps.name LIKE 'Solar%';

-- Select charge controllers where first letter of product name is between A and G no matter if upper or lower case
SELECT
    *
FROM
    specifications_solar_charge_controllers
WHERE
    product_name_charge_controller COLLATE utf8_general_ci BETWEEN 'A%' AND 'G%';

-- Select charge controllers in table product_name_charge_controller without Automatic Load Disconnect (ALD) function
SELECT
    product_name_charge_controller
FROM
    specifications_solar_charge_controllers
WHERE
    aut_load_disconnect = 0;