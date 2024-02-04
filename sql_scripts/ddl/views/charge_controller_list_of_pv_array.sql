-- Drop the view if it already exists
DROP VIEW IF EXISTS charge_controller_list_of_pv_array;

/*
Name: charge_controller_list_of_pv_array
Description: The charge_controller_list_of_pv_array view is designed to provide a comprehensive list of solar panels associated with 
specific panel arrays, combining information from the panel_usage, specifications_panel_products, and panel_arrays tables. 
This view offers an integrated overview of various attributes related to 
the usage and specifications of solar panels within the context of their respective panel arrays. 
 */
CREATE VIEW
    charge_controller_list_of_pv_array AS
SELECT
    *
FROM
    used_charge_controller
    JOIN specifications_solar_charge_controller ON used_charge_controller.charge_controller_id = specifications_solar_charge_controller.id
    JOIN panel_arrays ON used_charge_controller.panel_array_id = panel_arrays.id;