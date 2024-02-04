/* 
Table: used_inverter
 */
-- Select product name, manufacturer, startup voltage details of inverter in table specifications_inverters by name of pv system (here 'Clean Air Community') using indexes and JOINs
SELECT
    ui.product_name_inverter,
    ui.manufacturer_inverter,
    ui.startup_voltage
FROM
    used_inverter ui
    JOIN panel_systems ps ON ps.id = ui.pv_system_id
    JOIN specifications_inverters si ON si.id = ui.inverter_id
WHERE
    ps.name = 'Clean Air Community';