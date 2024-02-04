-- Procedure that inserts a new record into the panel_arrays table
DELIMITER / / CREATE PROCEDURE InsertPanelArray (
    IN p_pv_system_id INT,
    IN p_panel_array_name VARCHAR(64),
    IN p_address VARCHAR(256),
    IN p_date_installation_panel_array DATETIME,
    IN p_latitude FLOAT,
    IN p_longitude FLOAT,
    IN p_orientation INT,
    IN p_inclination INT
) BEGIN
INSERT INTO
    panel_arrays (
        pv_system_id,
        panel_array_name,
        address,
        date_installation_panel_array,
        latitude,
        longitude,
        orientation,
        inclination
    )
VALUES
    (
        p_pv_system_id,
        p_panel_array_name,
        p_address,
        p_date_installation_panel_array,
        p_latitude,
        p_longitude,
        p_orientation,
        p_inclination
    );

END / / DELIMITER;