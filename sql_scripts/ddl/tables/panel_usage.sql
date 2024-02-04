-- Drop the table if it already exists
DROP TABLE IF EXISTS panel_usage;

-- Name: panel_usage
-- Description: Create the "panel_usage" table to establish connections between all installed panel types and their respective panel arrays, as illustrated in the Entity-Relationship (ER) diagram.
CREATE TABLE
    panel_usage (
        id INT AUTO_INCREMENT PRIMARY KEY,
        panel_array_id INT,
        panel_product_id INT,
        quantity SMALLINT NOT NULL,
        FOREIGN KEY (panel_array_id) REFERENCES panel_arrays (id),
        FOREIGN KEY (panel_product_id) REFERENCES specifications_panel_products (id)
    );