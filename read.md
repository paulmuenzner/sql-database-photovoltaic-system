# Design Document

Databases with SQL by Harvard University <br>
Final project <br>
Project name: PV System Data Hub <br>
Designed by Paul Münzner

Video overview: https://youtu.be/DB64KK1rPFU

## Scope

This database for a photovoltaic (PV) grid system serves as an organized repository of crucial information related to the system's components, their relationships, historical data, and real-time operational parameters. This database plays a pivotal role in monitoring, managing, and optimizing the performance of the PV system, enabling efficient decision-making and ensuring the system operates at its full potential. Additionally, it provides an overview of the main components used including their technical characteristics and details.

![My Image](pv-grid-block-diagram_paul-muenzner.png)

The database contains essential relations that model the structure and connections among the various components of the PV system. For instance, it maintains tables representing detailed parameters and technical information of the panel arrays, PV combiner boxes, charge controllers, inverters, and batteries. These tables hold details about each component, such as date of installation, product name and manufacturer, plenty of device-specific technical characteristics.

In addition to static information, the database logs real-time values that provide critical insights into the system's operation. This includes data on state of battery charge, irradiance levels, voltage and current input and output of the inverter. Real-time monitoring of these parameters allows for immediate assessment of system performance, detection of potential issues, and timely interventions to optimize efficiency and maximize energy production.

The database's role extends beyond real-time monitoring to historical data storage. It keeps records of past performance and system events. Analyzing historical data can uncover patterns, trends, and irregularities in system behavior, facilitating predictive maintenance, performance forecasting, and identifying areas for improvement.

Moreover, the database facilitates reporting and analysis, generating meaningful insights through queries, reports, and data visualization. This aids stakeholders in understanding the PV system's overall performance, optimizing battery usage, and planning for system expansions or upgrades.

In summary, the database for a PV system acts as a centralized hub, housing plenty critical information pertaining to the system's components, relationships, real-time data, and historical records. Its purpose is to ensure efficient management, enhance system performance, and contribute to the sustainable and effective utilization of solar energy.

The database can hold all the afore-mentioned information for any number of photovoltaic systems independent from each other.

It should be noted, however, that this design does not claim to be complete. It does, however, provide an understanding of key components and the operation of PV systems that feed energy into the grid or store it temporarily in batteries. Possible other components, such as a vault rapid shutdown, surge protection devices, energy meter or residual current circuit breakers, have been omitted for the sake of clarity. This would go beyond the scope of this final project set by Harvard University and get lost in too much technical detail. This final project is about SQL databases - not electrical engineering.

The database includes information about the following devices within a photovoltaic system:
-Each independent photovoltaic system has an own entry in table pv_systems.
-Each photovoltaic system can have many solar panel arrays. Each solar panel array can be assigned to only one photovoltaic system.
-Each photovoltaic system has one battery of any size to store or extract energy in/from the battery
-A data logger table called log_status_pv_system_minutes stores critical, time-dependent and changing measured values at minute intervals
-With product listing tables for solar panel products, pv combiner boxes, solar charge controllers and inverters, it is possible to define all these installed components for each/one panel array and generate an equipment overview sort by panel array and pv system

#### Entity Relationship Diagram

![My Image](er-diagram_paul-muenzner.png)

## Limitations
The database for the photovoltaic (PV) system focuses on storing and managing information related to system components, real-time data, historical performance, and operational parameters. However, it does not handle aspects beyond this scope, such as:

1. **External Weather Data:**
Weather data such as wind, precipitation, or outdoor temperature, which may influence system performance, is typically sourced from external weather services rather than stored within this database.

2. **Financial Transactions:**
Details regarding financial transactions, billing, payments, or financial accounts related to the PV system are managed in a separate financial database or system not covered here.

3. **Environmental Policies and Regulations:**
Information regarding environmental policies, regulations, compliance, or legal matters related to the PV system and its location is outside the database's focus.

4. **Geographical Data:**
Geographic information like maps, topography, or geographic analysis are managed by specialized geographic information systems (GIS) and sparsely covered in this database by only noting the pv system's address with one set of longitude. Details are beyond the scope of this database.

5. **User Authentication and Access Control:**
User authentication, access control policies, and user account management fall under a separate authentication and access control system not covered here.

6. **Energy Grid Integration:**
Integration and communication with the broader energy grid, including synchronization, demand-response mechanisms, and grid management, are handled through specialized grid integration systems. Also information about the transmission grid or local grid are not covered in this database.

7. **Manufacturing and Supply Chain Information:**
Detailed data about the procurement, or vendor management for PV system components are typically managed in dedicated enterprise resource planning (ERP) systems. Also information on maintenance management, any kind of support tickets or task and contract management are not covered here.

8. **Scope of technical devices:**
This design does not claim to be complete. It does, however, provide an understanding of key components and the operation of PV systems that feed energy into the grid or store it temporarily in batteries. Possible other components, such as a vault rapid shutdown, surge protection devices, energy meter or residual current circuit breakers, have been omitted for the sake of clarity. This would go beyond the scope of this final project set by Harvard University and get lost in too much technical detail. This final project is about SQL databases - not electrical engineering.

In summary, the database's scope is limited to the PV system's technical and operational aspects, excluding broader contextual data or functionalities handled by other specialized systems.

## Functional Requirements

A user interacting with a database for a photovoltaic (PV) system can retrieve detailed technical parameter of implemented components and should be able to perform various tasks and actions that are essential for monitoring, managing, and optimizing the performance of the PV system. Here are some key actions a user should be able to undertake:

1. **Monitor Real-Time Data:**
   - View real-time values of key parameters such as irradiance, battery charge state, power input/output, and more.
   - Monitor the system's performance and energy production in real-time.

2. **Access Historical Data:**
   - Retrieve historical performance data to analyze trends, identify patterns, and make informed decisions based on past system behavior.

3. **Analyze System Performance:**
   - Conduct performance analysis to identify inefficiencies, optimize energy production, and improve overall system performance.

4. **Generate Reports:**
   - Generate customized reports summarizing system performance, energy production, and other relevant metrics over specific time periods.

5. **Plan and Optimize Battery Usage:**
   - Analyze battery charge/discharge patterns and plan optimal usage to maximize battery life and ensure reliable energy storage.

6. **Manage Components and Specifications:**
   - Access and update information about system components and technical specifications useful for installation details and maintenance requirements.

7. **Plan for Upgrades and Expansions:**
   - Evaluate the database to plan system upgrades, expansions, or integration of new components by analyzing existing data and performance trends.

9. **Integrate with Other Systems:**
    - Integrate data from the PV system database with other enterprise systems, such as financial databases or energy grid management systems, to facilitate seamless operation and data exchange.

10. **Set Alerts and Notifications:**
    - Configure alerts and notifications based on predefined thresholds or conditions to receive timely updates on system performance or anomalies.

Overall, the database should empower users to make informed decisions, optimize energy generation and consumption, ensure system reliability, modernize devices and contribute to the effective and sustainable utilization of solar energy in the PV system. <br>

For example, a user can...
- check the charging status of a pv systems battery
- retrieve many different technical data as well as manufacturer and product name of implemented solar panels in each solar array of pv system. It is not recommended to use different types of solar panels within a pv panel array. However, it is possible with this database to represent this scenario
- retrieve information of installation dates of each component and compare them with scheduled life cycle data and experienced real lifetime
- get a list of all main devices part of a pv system.
- query names of pv systems where operators maintain more than one pv system
- delete all logged real time values older than, for example, two years in order to reduce the amount of stored data
- query all entries in the table for logged real time data where battery charge is too low. Charging a PV (Photovoltaic) battery too low can lead to various issues, including potential damage to the battery and a reduction in its overall lifespan. The threshold for a low state of charge (SoC) largely depends on the type of battery chemistry being used (e.g., lead-acid, lithium-ion) and the specific manufacturer's recommendations.

A user can not...
- retrieve separated measured data on each pv panel array assigned to a pv system or even each installed panel. Any logs of measured real time values are related to the entire pv system. However, it is of course possible to expand the database and add further tables (including data and sensor devices) to log data more precisely separated for each solar panel array for example.
- save or query data relating to integration and communication with the broader energy grid, including synchronization, demand-response mechanisms, and grid management. This is definitely out of scope.
- query or insert any weather data, i.e. for forecasts, relevant for the pv system. This is out of scope.
- query or insert financial transactions, billing, payments, or financial accounts related to the PV system


## Representation

### Entities

In this section you should answer the following questions:

As per the entity relationship diagram, the database is represented by the following tables:
- pv_systems: On top of the ER diagram. Directly linked to its panel arrays, battery table, and measured real values in log_status_pv_system_minutes
- panel_arrays containing one or more panels made up of idealy one type of panel with specifications and technical details listed in specifications_panel_products linked via panel_usage
- battery containing technical details
- log_status_pv_system_minutes containing real time log data such as state of battery charge, power input and output of the inverter, power flow in and out of the battery, electric energy distribution from the PV combiner box, and irradiance levels
- used_pv_combiner_box: linking used combiner boxes for each panel array
- panel_usage: linking installed solar panel types for each panel array
- used_charge_controller: linking panel array with charge controller
- used_inverter: linking implemented inverter for each pv system
- specifications_pv_combiner_boxes: listing characteristic technical data on combiner boxes
- specifications_panel_products: listing characteristic technical data on solar panels
- specifications_solar_charge_controller: listing characteristic technical data on charge controllers
- specifications_inverters: listing characteristic technical data on inverter

More details on attributes of each table can be found in the entity relationship diagram. Listing all and each attribute would go beyond the scope of this article and not yield any additional information.

All these afore-mentioned attributes and entities describe, log and store photovoltaic systems and its main technical devices as well as real time data. It provides a profound overview on its technical components and real time data as described above.

Constraints:
Constraints in a database schema model, as described in the database for the photovoltaic (PV) system, are crucial for ensuring data integrity, enforcing business rules, maintaining consistency, and preventing erroneous or invalid data from entering the database. Constraints help maintain data integrity by ensuring that only valid and appropriate data is inserted into the database. This includes enforcing rules on data types, null values, and range of allowed values for attributes. Many floating number values are limited to a certain size with a certain or maximum number of fractional digits in order to increase readability and reduce the amount of data storage.

Constraints like foreign keys maintain referential integrity by ensuring that relationships between entities are valid. For example, a foreign key linking a panel array to a PV system ensures that the panel array is associated with an existing PV system.

Constraints maintain consistency by enforcing rules that the data must follow. For instance, a constraint can ensure that every panel in the panel_arrays table must have a valid corresponding entry in the specifications_panel_products table.

By enforcing constraints, you can prevent redundancy and inconsistencies in the data. For instance, constraints can ensure that a PV system's inverter is properly linked to an existing inverter specification. The same converter with its specifications can be linked to other pv systems where it might be used too.

Constraints help prevent and detect errors at the database level, providing an early warning system for potential issues before they impact the system or application. For example, it does not make sense to add any device in a table as new row without its installation date.

### Relationships

As per the entity-relationship diagram, the database is represented through the following tables:

1. **pv_systems:**
   - Positioned at the top of the ER diagram and directly linked to panel arrays, the battery table, and real-time measured values in log_status_pv_system_minutes.

2. **panel_arrays:**
   - Contains one or more panels, ideally of the same type, with specifications and technical details listed in specifications_panel_products and linked via panel_usage.

3. **battery:**
   - Holds technical details related to batteries.

4. **log_status_pv_system_minutes:**
   - Stores real-time log data, including state of battery charge, inverter power input and output, battery power flow, electric energy distribution from the PV combiner box, and irradiance levels.

5. **used_pv_combiner_box:**
   - Links used combiner boxes to each panel array.

6. **panel_usage:**
   - Links installed solar panel types to each panel array.

7. **used_charge_controller:**
   - Links panel arrays with their respective charge controllers.

8. **used_inverter:**
   - Links implemented inverters to each PV system.

9. **specifications_pv_combiner_boxes:**
   - Lists characteristic technical data related to combiner boxes.

10. **specifications_panel_products:**
    - Lists characteristic technical data related to solar panels.

11. **specifications_solar_charge_controller:**
    - Lists characteristic technical data related to charge controllers.

12. **specifications_inverters:**
    - Lists characteristic technical data related to inverters.

Linking is realized with primary keys in each table and foreign additional keys where needed and useful.

## Optimizations

Creating efficient indexes, enabling faster data retrieval and optimizing database queries. This is especially the case for the tables linking the panel arrays or pv system with the specification tables. So foreign keys in used_pv_combiner_box, panel_usage, used_charge_controller or used_inverter are marked as index. PV_system_id in the log table called log_status_pv_system_minutes is also indexed as this table can contain 10,000s of values. Without an indexed value, it is likely taking too much time to search for certain data.

Currently, the schema provides two views of likely often used or interesting combinations and related information:
1. extended_pv_system_overview: Providing all directly connected systems and devices of a pv system. This are inverter, panel arrays and the battery.
2. panel_list_of_pv_array: Providing all available information of a panel array within one row from three different tables.

With a delete query inside queries.sql one can, for example, delete all log data older than two years. This can be very useful to reduce query time and the need of data storage as the logging table collects a lot of data - one row per minute and pv system.
