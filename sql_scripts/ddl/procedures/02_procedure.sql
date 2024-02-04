-- Procedure for inserting data into the used_pv_combiner_box table
DELIMITER / / CREATE PROCEDURE InsertUsedPVCombinerBox (
    IN p_panel_array_id INT,
    IN p_pv_combiner_box_id INT,
    IN p_date_installation_combiner_box DATETIME
) BEGIN
INSERT INTO
    used_pv_combiner_box (
        panel_array_id,
        pv_combiner_box_id,
        date_installation_combiner_box
    )
VALUES
    (
        p_panel_array_id,
        p_pv_combiner_box_id,
        p_date_installation_combiner_box
    );

END / / DELIMITER;