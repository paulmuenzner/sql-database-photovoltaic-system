-- Drop the table if it already exists
DROP TABLE IF EXISTS battery;

-- Name: battery
-- Description: Create a table named "battery" to store information about the batteries utilized within a photovoltaic (PV) system.
CREATE TABLE
    battery (
        id INT AUTO_INCREMENT PRIMARY KEY,
        pv_system_id INT,
        manufacturer VARCHAR(64) NOT NULL,
        battery_name VARCHAR(64) NOT NULL UNIQUE,
        type VARCHAR(64) NOT NULL CHECK (
            type IN (
                'Lithium-ion',
                'Nickel Metal Hydride',
                'Flow Battery',
                'Saltwater Battery',
                'Graphene Battery',
                'Aluminum-air Battery',
                'Zinc-air Battery',
                'Lead Acid'
            )
        ),
        max_capacity FLOAT (8, 2) NOT NULL,
        charge_rate VARCHAR(20) NOT NULL,
        discharge_rate VARCHAR(20) NOT NULL,
        max_depth_discharge FLOAT (4, 2) NOT NULL,
        FOREIGN KEY (pv_system_id) REFERENCES pv_systems (id)
    );