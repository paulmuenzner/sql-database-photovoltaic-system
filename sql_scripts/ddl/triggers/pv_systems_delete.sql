-- Trigger Name: pv_systems_delete
/* 
Description

Purpose of this trigger is to automatically delete all to a pv_system related panel arrays, inverters, logs and battery
if a a certain pv system is deleted and removed from table 'pv_systems'.
 */
DELIMITER / / CREATE TRIGGER pv_systems_delete AFTER DELETE ON pv_systems FOR EACH ROW BEGIN
-- Delete from used_inverter
DELETE FROM used_inverter
WHERE
    pv_system_id = OLD.id;

-- Delete from battery
DELETE FROM battery
WHERE
    pv_system_id = OLD.id;

-- Delete from panel_arrays
DELETE FROM panel_arrays
WHERE
    pv_system_id = OLD.id;

-- Delete from log_status_pv_system_minutes
DELETE FROM log_status_pv_system_minutes
WHERE
    pv_system_id = OLD.id;

END / / DELIMITER;