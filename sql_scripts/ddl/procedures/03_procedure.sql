-- Procedure that retrieves information from the panel_arrays and panel_usage tables. This procedure takes a pv_system_id parameter and returns details about the panel arrays associated with that system.
DELIMITER / / CREATE PROCEDURE GetPanelArraysBySystem (IN pvSystemId INT) BEGIN
SELECT
    pa.id,
    pa.panel_array_name,
    pa.address,
    pa.date_installation_panel_array,
    pa.latitude,
    pa.longitude,
    pa.orientation,
    pa.inclination,
    pu.quantity
FROM
    panel_arrays pa
    JOIN panel_usage pu ON pa.id = pu.panel_array_id
WHERE
    pa.pv_system_id = pvSystemId;

END / / DELIMITER;