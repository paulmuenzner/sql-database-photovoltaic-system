-- Update the operator of an existing pv system in the database
UPDATE pv_systems
SET
    operator = 'PV Askatom'
WHERE
    id = 222593;

-- Update the operator for a specific PV system by its name
UPDATE pv_systems
SET
    operator = 'New Operator Ltd.'
WHERE
    name = 'Ohio Homeland 3';