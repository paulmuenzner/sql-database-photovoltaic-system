-- Drop the table if it already exists
DROP TABLE IF EXISTS panel_arrays;

-- Name: panel_arrays
-- Description: Create the "panel_arrays" table to enumerate and store information about all panel arrays owned by a photovoltaic (PV) system, as indicated in the "pv_systems" table.
CREATE TABLE
    panel_arrays (
        id INT AUTO_INCREMENT PRIMARY KEY,
        pv_system_id INT,
        panel_array_name VARCHAR(64) NOT NULL UNIQUE,
        address VARCHAR(256) NOT NULL UNIQUE,
        date_installation_panel_array DATETIME NOT NULL,
        latitude FLOAT NOT NULL,
        longitude FLOAT NOT NULL,
        orientation INT NOT NULL,
        inclination INT NOT NULL,
        FOREIGN KEY (pv_system_id) REFERENCES pv_systems (id)
    );