-- Drop the table if it already exists
DROP TABLE IF EXISTS specifications_solar_charge_controllers;

-- Name: specifications_solar_charge_controllers
-- Description: Create a table named "specifications_solar_charge_controllers" to store information about charge controller products, no matter they are utilized for a specific panel array or not. Each installed/used charge controller must be listed in this table.
CREATE TABLE
    specifications_solar_charge_controllers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        manufacturer VARCHAR(64) NOT NULL,
        product_name_charge_controller VARCHAR(64) NOT NULL,
        charge_controller_type VARCHAR(20) NOT NULL CHECK (
            charge_controller_type IN ('mppt', 'pwm', 'simple')
        ),
        rated_charge_current FLOAT (8, 2) NOT NULL,
        battery_voltage_range VARCHAR(64) NOT NULL,
        max_self_consumption FLOAT (4, 2) NOT NULL,
        nominal_pv_power SMALLINT NOT NULL,
        aut_load_disconnect TINYINT (1) NOT NULL CHECK (aut_load_disconnect IN (0, 1)), -- 0 False, 1 True
        peak_efficiency FLOAT (4, 2) NOT NULL,
        operating_humidity VARCHAR(64) NOT NULL,
        operating_temperature VARCHAR(64) NOT NULL,
        protection_category VARCHAR(64) NOT NULL,
        data_port_type VARCHAR(64) NOT NULL
    );