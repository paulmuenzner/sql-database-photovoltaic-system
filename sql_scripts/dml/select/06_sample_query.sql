/* 
Table: used_charge_controller
 */
-- Select product name, manufacturer, charge controller type details of charge controller in table specifications_solar_charge_controller by name of pv system (here 'Clean Air Community') using indexes and JOINs
SELECT
    ucc.product_name_charge_controller,
    ucc.manufacturer_charge_controller,
    ucc.charge_controller_type
FROM
    used_charge_controller ucc
    JOIN panel_systems ps ON ps.id = ucc.pv_system_id
    JOIN specifications_solar_charge_controller scc ON scc.id = ucc.charge_controller_id
WHERE
    ps.name LIKE 'Clean Air Community';