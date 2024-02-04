-- Drop the table if it already exists
DROP TABLE IF EXISTS specifications_pv_combiner_boxes;

-- Name: specifications_pv_combiner_boxes
-- Description: Create the "specifications_pv_combiner_boxes" table to store information about PV combiner box products, no matter they are utilized for a specific panel array or not. Each installed/used combiner box must be listed in this table.
CREATE TABLE
    specifications_pv_combiner_boxes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        manufacturer VARCHAR(256) NOT NULL,
        product_name_combiner_box VARCHAR(64) NOT NULL,
        max_voltage FLOAT (6, 2) NOT NULL,
        number_dc_input TINYINT NOT NULL,
        spd_protection VARCHAR(64) NOT NULL,
        string_protection VARCHAR(64) NOT NULL,
        max_output_current FLOAT (6, 2) NOT NULL,
        operating_humidity_range VARCHAR(64) NOT NULL,
        operating_temperature_range VARCHAR(64) NOT NULL,
        input_cable_entry VARCHAR(64) NOT NULL,
        fuse_type VARCHAR(64) NOT NULL
    );