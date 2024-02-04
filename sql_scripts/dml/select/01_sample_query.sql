/* 
Table: log_status_pv_system_minutes
 */
-- Select logged parameters about pv system with name 'Fifth Suburb District' from last 24 hours
SELECT
    lspm.state_of_battery_charge,
    lspm.pv_combiner_box_power_out,
    lspm.battery_in,
    lspm.inverter_power_in,
    lspm.inverter_power_out,
    lspm.battery_out,
    lspm.datetime
FROM
    log_status_pv_system_minutes lspm
    JOIN pv_systems ps ON lspm.pv_system_id = ps.id
WHERE
    ps.name = 'Fifth Suburb District'
    AND lspm.datetime_log >= NOW () - INTERVAL 24 HOUR;

-- Retrieve entries with the 100 highest battery charge entries during last 80 days.
SELECT
    *
FROM
    log_status_pv_system_minutes
WHERE
    datetime_log <= NOW () - INTERVAL 80 DAY
ORDER BY
    state_of_battery_charge DESC
LIMIT
    100;

-- Find all entries in log_status_pv_system_minutes where battery is charged below 20%
SELECT
    *
FROM
    log_status_pv_system_minutes
WHERE
    state_of_battery_charge < 20;