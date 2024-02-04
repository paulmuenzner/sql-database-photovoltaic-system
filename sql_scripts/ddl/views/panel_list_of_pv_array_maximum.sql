-- Drop the view if it already exists
DROP VIEW IF EXISTS panel_list_of_pv_array_maximum;

/*
Name: panel_list_of_pv_array_maximum
Description: The panel_list_of_pv_array_maximum view is designed to provide a comprehensive list of solar panels associated with 
specific panel arrays, combining information from the panel_usage, specifications_panel_products, and panel_arrays tables. 
This view offers an integrated overview of various attributes related to 
the usage and specifications of solar panels within the context of their respective panel arrays. 
If you require only the relationship information of the panel types used in a PV array, 
without additional attributes, please refer to "panel_list_of_pv_array_minimum."
 */
CREATE VIEW
    panel_list_of_pv_array_maximum AS
SELECT
    panel_usage.id AS panel_usage_id,
    panel_arrays.id AS panel_array_id,
    panel_arrays.panel_array_name,
    panel_arrays.address AS panel_array_address,
    panel_arrays.date_installation_panel_array,
    specifications_panel_products.id AS panel_product_id,
    specifications_panel_products.manufacturer AS panel_manufacturer,
    specifications_panel_products.panel_type,
    specifications_panel_products.max_power_current,
    specifications_panel_products.open_circuit_voltage,
    specifications_panel_products.maximum_voltage,
    specifications_panel_products.short_circuit_current,
    specifications_panel_products.power_max,
    specifications_panel_products.name AS panel_product_name,
    panel_usage.quantity
FROM
    panel_usage
    JOIN specifications_panel_products ON panel_usage.panel_product_id = specifications_panel_products.id
    JOIN panel_arrays ON panel_usage.panel_array_id = panel_arrays.id;