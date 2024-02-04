-- Update maximum DC input voltage for a specific manufacturer and product name
UPDATE specifications_inverters
SET
    max_dc_input_voltage = 750.0
WHERE
    manufacturer = 'Double Electric Ltd.'
    AND product_name_inverter = 'Invert Intelli 2.0';

-- Adjust power factor range for high-efficiency inverters from 'Effici Invert Ltd.'
UPDATE specifications_inverters
SET
    power_factor_range = '0.9 - 1.0'
WHERE
    maximum_efficiency > 95.0
    AND manufacturer = 'Effici Invert Ltd.';