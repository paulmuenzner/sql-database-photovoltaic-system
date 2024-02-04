-- Drop the table if it already exists
DROP TABLE IF EXISTS specifications_inverters;

-- Name: specifications_inverters
-- Description: Create the "specifications_inverters" table to store information about inverters, no matter they are utilized in a specific PV system or not. Each installed/used inverter must be listed in this table.
CREATE TABLE
    specifications_inverters (
        id INT AUTO_INCREMENT PRIMARY KEY,
        manufacturer VARCHAR(64) NOT NULL,
        product_name_inverter VARCHAR(64) NOT NULL,
        max_dc_input_voltage FLOAT (8, 2) NOT NULL,
        nominal_ac_output_power FLOAT (8, 2) NOT NULL,
        max_ac_output_power FLOAT (8, 2) NOT NULL,
        ac_output_voltage_range VARCHAR(64) NOT NULL,
        mppt_voltage_range VARCHAR(64) NOT NULL,
        max_dc_input_current FLOAT (8, 2) NOT NULL,
        startup_voltage FLOAT (8, 2) NOT NULL,
        power_factor_range VARCHAR(64) NOT NULL,
        maximum_efficiency FLOAT (4, 2) NOT NULL,
        grid_connection_requirements VARCHAR(518) NOT NULL,
        operating_temperature_range VARCHAR(64) NOT NULL,
        operating_humidity_range VARCHAR(64) NOT NULL,
        max_number_dc_inputs TINYINT NOT NULL
    );