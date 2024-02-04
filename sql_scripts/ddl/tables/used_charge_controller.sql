-- Drop the table if it already exists
DROP TABLE IF EXISTS used_charge_controller;

-- Name: used_charge_controller
-- Description: Create the "used_charge_controller" table to list and assign a charge controller to its respective panel array.
CREATE TABLE
    used_charge_controller (
        id INT AUTO_INCREMENT PRIMARY KEY,
        panel_array_id INT,
        charge_controller_id INT,
        date_installation_charge_controller DATETIME NOT NULL,
        FOREIGN KEY (panel_array_id) REFERENCES panel_arrays (id),
        FOREIGN KEY (charge_controller_id) REFERENCES specifications_solar_charge_controllers (id)
    );