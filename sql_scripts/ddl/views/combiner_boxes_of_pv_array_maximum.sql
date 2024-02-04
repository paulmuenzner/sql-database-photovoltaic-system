-- Drop the view if it already exists
DROP VIEW IF EXISTS combiner_boxes_of_pv_array_maximum;

/*
Name: combiner_boxes_of_pv_array_maximum
Description: The combiner_boxes_of_pv_array_maximum view is designed to provide a comprehensive list of combiner boxes associated with 
specific panel arrays, combining information from the used_pv_combiner_box, specifications_pv_combiner_boxes, and panel_arrays tables. 
This view offers an integrated overview of various attributes related to 
the usage and specifications of combiner boxes within the context of their respective panel arrays. 
If you require only the relationship information of combiner boxes used in a PV array, 
without additional attributes, please refer to combiner_boxes_of_pv_array_minimum view.
 */
CREATE VIEW
    combiner_boxes_of_pv_array_maximum AS
SELECT
    used_pv_combiner_box.id AS used_combiner_box_id,
    panel_arrays.id AS panel_array_id,
    panel_arrays.panel_array_name,
    panel_arrays.address AS panel_array_address,
    panel_arrays.date_installation_panel_array,
    specifications_pv_combiner_boxes.id AS combiner_box_id,
    specifications_pv_combiner_boxes.manufacturer AS combiner_box_manufacturer,
    specifications_pv_combiner_boxes.product_name_combiner_box,
    specifications_pv_combiner_boxes.max_voltage AS combiner_box_max_voltage,
    specifications_pv_combiner_boxes.number_dc_input AS combiner_box_number_dc_input,
    specifications_pv_combiner_boxes.spd_protection AS combiner_box_spd_protection,
    specifications_pv_combiner_boxes.string_protection AS combiner_box_string_protection,
    specifications_pv_combiner_boxes.max_output_current AS combiner_box_max_output_current,
    specifications_pv_combiner_boxes.operating_humidity_range AS combiner_box_operating_humidity_range,
    specifications_pv_combiner_boxes.operating_temperature_range AS combiner_box_operating_temperature_range,
    specifications_pv_combiner_boxes.input_cable_entry AS combiner_box_input_cable_entry,
    specifications_pv_combiner_boxes.fuse_type AS combiner_box_fuse_type,
    used_pv_combiner_box.date_installation_combiner_box
FROM
    used_pv_combiner_box
    JOIN specifications_pv_combiner_boxes ON used_pv_combiner_box.pv_combiner_box_id = specifications_pv_combiner_boxes.id
    JOIN panel_arrays ON used_pv_combiner_box.panel_array_id = panel_arrays.id;