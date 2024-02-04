-- Delete records where the manufacturer is 'SolarRich Electronics' and the charge controller type is 'simple'
DELETE FROM specifications_solar_charge_controllers
WHERE
    manufacturer = 'SolarRich Electronics'
    AND charge_controller_type = 'simple';

-- Delete records where the rated charge current is less than 20 and the protection category is 'Outdoor'
DELETE FROM specifications_solar_charge_controllers
WHERE
    rated_charge_current < 20
    AND protection_category = 'Outdoor';

-- Delete records where aut_load_disconnect is enabled (1) and the peak efficiency is less than 90%
DELETE FROM specifications_solar_charge_controllers
WHERE
    aut_load_disconnect = 1
    AND peak_efficiency < 90.0;

-- Delete records where the nominal_pv_power is 100 and the data port type is 'USB'
DELETE FROM specifications_solar_charge_controllers
WHERE
    nominal_pv_power = 100
    AND data_port_type = 'USB';