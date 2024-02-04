-- Drop the table if it already exists
DROP TABLE IF EXISTS log_status_pv_system_minutes;

/*
Name: log_status_pv_system_minutes
Description: The log_status_pv_system_minutes table is designed to store minute-level log entries related to the status and performance metrics of a photovoltaic (PV) system. 
Each entry in the table represents a snapshot of various parameters recorded at minute intervals, providing a detailed overview of the PV system's operational characteristics. 
Note that a similar logging table can be created and maintained for each array if needed (not covered here).
 */
CREATE TABLE
    log_status_pv_system_minutes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        battery_id INT,
        pv_system_id INT,
        state_of_battery_charge FLOAT (5, 2) NOT NULL,
        irradiance FLOAT (6, 2) NOT NULL,
        pv_combiner_box_dc_voltage_out FLOAT (6, 2) NOT NULL,
        pv_combiner_box_dc_current_in FLOAT (6, 2) NOT NULL,
        inverter_dc_voltage_in FLOAT (6, 2) NOT NULL,
        inverter_dc_current_in FLOAT (6, 2) NOT NULL,
        temperature_inverter FLOAT (5, 2) NOT NULL,
        inverter_ac_voltage_out FLOAT (6, 2) NOT NULL,
        inverter_ac_current_out FLOAT (6, 2) NOT NULL,
        inverter_ac_frequency_out FLOAT (4, 2) NOT NULL,
        inverter_power_factor FLOAT (4, 2) NOT NULL,
        inverter_efficiency FLOAT (4, 2) NOT NULL,
        battery_dc_voltage_in FLOAT (6, 2) NOT NULL,
        battery_dc_current_in FLOAT (5, 2) NOT NULL,
        battery_dc_voltage_out FLOAT (6, 2) NOT NULL,
        battery_dc_current_out FLOAT (5, 2) NOT NULL,
        datetime_log DATETIME NOT NULL
    );