-- Drop the view if it already exists
DROP VIEW IF EXISTS panel_list_of_pv_array_minimum;

/*
Name: panel_list_of_pv_array_minimum
Description: The panel_list_of_pv_array_minimum view is designed to provide a list of solar panels associated with 
specific panel arrays, combining smallest possible amount of information from the panel_usage, specifications_panel_products, and panel_arrays tables. 
This view offers an minimum overview of utilized solar panels within the context of their respective panel arrays. 
Please use panel_list_of_pv_array_maximum for a more extended view integrating various attributes.
 */
CREATE VIEW
    panel_list_of_pv_array_minimum AS
SELECT
    *
FROM
    panel_usage
    JOIN specifications_panel_products ON panel_usage.panel_product_id = specifications_panel_products.id
    JOIN panel_arrays ON panel_usage.panel_array_id = panel_arrays.id;