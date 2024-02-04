/* 
Table: pv_systems
 */
-- Select names of pv systems where operators maintain more than one pv system
SELECT
    name
FROM
    pv_systems
GROUP BY
    name
HAVING
    COUNT(DISTINCT operator) > 1;