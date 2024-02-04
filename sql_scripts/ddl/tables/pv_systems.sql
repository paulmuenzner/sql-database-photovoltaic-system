-- Drop the table if it already exists
DROP TABLE IF EXISTS pv_systems;

-- Name: pv_systems
-- Description: Create the "pv_systems" table to initiate the setup of an entire PV system, encompassing components such as inverters, panels, controllers, etc.
CREATE TABLE
    pv_systems (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(64) NOT NULL UNIQUE,
        operator VARCHAR(64) NOT NULL
    );