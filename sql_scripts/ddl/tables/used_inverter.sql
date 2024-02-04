-- Drop the table if it already exists
DROP TABLE IF EXISTS used_inverter;

-- Name: used_inverter
-- Description: Create a table named "used_inverter" to list and assign an inverter to its respective panel array.
CREATE TABLE
    used_inverter (
        id INT AUTO_INCREMENT PRIMARY KEY,
        pv_system_id INT,
        inverter_id INT,
        date_installation_inverter DATETIME NOT NULL,
        FOREIGN KEY (pv_system_id) REFERENCES pv_systems (id),
        FOREIGN KEY (inverter_id) REFERENCES specifications_inverters (id)
    );