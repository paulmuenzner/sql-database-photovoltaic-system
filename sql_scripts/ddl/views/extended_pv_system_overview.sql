-- Drop the view if it already exists
DROP VIEW IF EXISTS extended_pv_system_overview;

/*
Name: extended_pv_system_overview
Description: The extended_pv_system_overview view is designed to provide an extended overview of a photovoltaic (PV) 
system by combining information from multiple related tables. 
This view amalgamates data from the pv_systems, used_inverter, panel_arrays, and battery tables, 
offering a consolidated perspective on various components and attributes of the PV system.

By combining information from these tables, the extended_pv_system_overview view offers a comprehensive snapshot of a PV system, 
encompassing details about its components such as inverters, panel arrays, and batteries. 
This consolidated view is useful for monitoring and analyzing the key attributes of a PV system in a more accessible and informative manner.
 */
CREATE VIEW
    extended_pv_system_overview AS
SELECT
    *
FROM
    pv_systems
    JOIN used_inverter ON used_inverter.pv_system_id = pv_systems.id
    JOIN panel_arrays ON panel_arrays.pv_system_id = pv_systems.id
    JOIN battery ON battery.pv_system_id = pv_systems.id;