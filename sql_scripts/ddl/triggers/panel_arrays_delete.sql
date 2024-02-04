-- Trigger Name: panel_arrays_delete
/* 
Description

Purpose of this trigger is to automatically delete all to a pannel array related entries for and in  
used_charge_controller, panel_usage, used_pv_combiner_box and used_inverter
if a a certain pv panel array is deleted and removed from table 'panel_arrays'.
 */
DELIMITER / / CREATE TRIGGER panel_arrays_delete AFTER DELETE ON panel_arrays FOR EACH ROW BEGIN
-- Delete from used_charge_controller
DELETE FROM used_charge_controller
WHERE
    panel_array_id = OLD.id;

-- Delete from panel_usage
DELETE FROM panel_usage
WHERE
    panel_array_id = OLD.id;

-- Delete from used_pv_combiner_box
DELETE FROM used_pv_combiner_box
WHERE
    panel_array_id = OLD.id;

-- Delete from used_inverter
DELETE FROM used_inverter
WHERE
    panel_array_id = OLD.id;

END / / DELIMITER;