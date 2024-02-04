/* 
View: panel_list_of_pv_array_maximum
 */
-- Select query to receive all solar panel specifications for solar panel array called 'Happy Car Parking Lot' using view called panel_list_of_pv_array
SELECT
    *
FROM
    panel_list_of_pv_array_maximum
WHERE
    panel_array_name LIKE 'Happy Car Parking Lot';