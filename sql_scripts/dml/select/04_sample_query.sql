/* 
View: extended_pv_system_overview
 */
-- Select all panel arrays installed within the last 24 days from generated view called extended_pv_system_overview
SELECT
    *
FROM
    extended_pv_system_overview
WHERE
    date_installation_panel_array >= NOW () - INTERVAL 24 DAY;