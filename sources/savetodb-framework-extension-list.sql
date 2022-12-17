--#SET TERMINATOR ;

-- =============================================
-- SaveToDB Framework Extension for IBM DB2
-- Version 10.6, December 13, 2022
--
-- Copyright 2022 Gartle LLC
--
-- License: MIT
-- =============================================

SELECT
    TABSCHEMA AS SCHEMA
    , TABNAME AS NAME
    , CASE "TYPE"
        WHEN 'T' THEN 'TABLE'
        WHEN 'V' THEN 'VIEW'
        ELSE "TYPE"
        END AS "TYPE"
FROM
    SYSCAT.TABLES
WHERE
    TABSCHEMA IN ('XLS')
UNION ALL
SELECT
    PROCSCHEMA AS SCHEMA
    , PROCNAME AS NAME
    , 'PROCEDURE' AS "TYPE"
FROM
    SYSCAT.PROCEDURES
WHERE
    PROCSCHEMA IN ('XLS')
ORDER BY
    SCHEMA, NAME;
