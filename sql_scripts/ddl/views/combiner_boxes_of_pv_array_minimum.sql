-- Drop the view if it already exists
DROP VIEW IF EXISTS combiner_boxes_of_pv_array_minimum;

/*
Name: combiner_boxes_of_pv_array_minimum
Description: The combiner_boxes_of_pv_array_minimum view is designed to provide a list of combiner boxes associated with 
specific panel arrays, combining smallest possible amount of information from the used_pv_combiner_box, specifications_pv_combiner_boxes, and panel_arrays tables. 
This view offers an minimum overview of utilized combiner boxes within the context of their respective panel arrays. 
Please use combiner_boxes_of_pv_array_maximum view for a more extended view integrating various attributes.
 */
CREATE VIEW
    combiner_boxes_of_pv_array_minimum AS
SELECT
    *
FROM
    used_pv_combiner_box
    JOIN specifications_pv_combiner_boxes ON used_pv_combiner_box.pv_combiner_box_id = specifications_pv_combiner_boxes.id
    JOIN panel_arrays ON used_pv_combiner_box.panel_array_id = panel_arrays.id;