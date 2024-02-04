-- Drop the table if it already exists
DROP TABLE IF EXISTS used_pv_combiner_box;

-- Name: used_pv_combiner_box
-- Description: Create the "used_pv_combiner_box" table to list and assign a combiner box to its respective panel array.
CREATE TABLE
    used_pv_combiner_box (
        id INT AUTO_INCREMENT PRIMARY KEY,
        panel_array_id INT,
        pv_combiner_box_id INT,
        date_installation_combiner_box DATETIME NOT NULL,
        FOREIGN KEY (panel_array_id) REFERENCES panel_arrays (id),
        FOREIGN KEY (pv_combiner_box_id) REFERENCES specifications_pv_combiner_boxes (id)
    );