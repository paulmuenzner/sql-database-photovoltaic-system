-- Drop the table if it already exists
DROP TABLE IF EXISTS specifications_panel_products;

-- Name: specifications_panel_products
-- Description: Create the "specifications_panel_products" table to store information about solar panel products, no matter they are utilized for a specific panel array or not.
CREATE TABLE
    specifications_panel_products (
        id INT PRIMARY KEY,
        manufacturer VARCHAR(64) NOT NULL,
        panel_type VARCHAR(20) NOT NULL CHECK (
            panel_type IN (
                'mono',
                'poly',
                'tfsc',
                'amorph',
                'bio_hybrid',
                'cdte',
                'cvp'
            )
        ),
        max_power_current FLOAT (6, 2) NOT NULL,
        open_circuit_voltage FLOAT (6, 2) NOT NULL,
        maximum_voltage FLOAT (6, 2) NOT NULL,
        short_circuit_current FLOAT (6, 2) NOT NULL,
        power_max FLOAT (6, 2) NOT NULL,
        name VARCHAR(256) NOT NULL
    );