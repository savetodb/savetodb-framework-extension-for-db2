--#SET TERMINATOR ;

-- =============================================
-- SaveToDB Framework Extension for IBM DB2
-- Version 10.6, December 13, 2022
--
-- Copyright 2022 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE OR REPLACE VIEW XLS.VIEW_COLUMNS
AS
SELECT
    t.ID
    , t.TABLE_SCHEMA
    , t.TABLE_NAME
    , t.COLUMN_NAME
    , t.ORDINAL_POSITION
    , t.IS_PRIMARY_KEY
    , t.IS_NULLABLE
    , t.IS_IDENTITY
    , t.IS_COMPUTED
    , t.COLUMN_DEFAULT
    , t.DATA_TYPE
    , t.CHARACTER_MAXIMUM_LENGTH
    , t.PRECISION
    , t.SCALE
FROM
    XLS.COLUMNS t
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    );

CREATE OR REPLACE VIEW XLS.VIEW_FORMATS
AS
SELECT
    t.ID
    , t.TABLE_SCHEMA
    , t.TABLE_NAME
    , t.TABLE_EXCEL_FORMAT_XML
    , t.APP
FROM
    XLS.FORMATS t
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    )
    AND (NOT t.TABLE_SCHEMA IN ('XLS') OR t.TABLE_NAME IN ('VIEW_COLUMNS', 'VIEW_FORMATS', 'VIEW_HANDLERS', 'VIEW_OBJECTS', 'VIEW_TRANSLATIONS', 'VIEW_QUERIES', 'VIEW_WORKBOOKS'));

CREATE OR REPLACE VIEW XLS.VIEW_HANDLERS
AS
SELECT
    t.ID
    , t.TABLE_SCHEMA
    , t.TABLE_NAME
    , t.COLUMN_NAME
    , t.EVENT_NAME
    , t.HANDLER_SCHEMA
    , t.HANDLER_NAME
    , t.HANDLER_TYPE
    , t.HANDLER_CODE
    , t.TARGET_WORKSHEET
    , t.MENU_ORDER
    , t.EDIT_PARAMETERS
FROM
    XLS.HANDLERS t
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    )
    AND (NOT t.TABLE_SCHEMA IN ('XLS') OR t.TABLE_NAME IN ('VIEW_COLUMNS', 'VIEW_FORMATS', 'VIEW_HANDLERS', 'VIEW_OBJECTS', 'VIEW_TRANSLATIONS', 'VIEW_QUERIES', 'VIEW_WORKBOOKS'));

CREATE OR REPLACE VIEW XLS.VIEW_OBJECTS
AS
SELECT
    t.ID
    , t.TABLE_SCHEMA
    , t.TABLE_NAME
    , t.TABLE_TYPE
    , t.TABLE_CODE
    , t.INSERT_OBJECT
    , t.UPDATE_OBJECT
    , t.DELETE_OBJECT
FROM
    XLS.OBJECTS T
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    );

CREATE OR REPLACE VIEW XLS.VIEW_QUERIES
AS
SELECT
    t.TABLE_SCHEMA
    , t.TABLE_NAME
    , t.TABLE_TYPE
    , t.TABLE_CODE
    , t.INSERT_PROCEDURE
    , t.UPDATE_PROCEDURE
    , t.DELETE_PROCEDURE
    , t.PROCEDURE_TYPE
FROM
    XLS.QUERIES t
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    )
    AND NOT t.TABLE_SCHEMA IN ('XLS');

CREATE OR REPLACE VIEW XLS.VIEW_TRANSLATIONS
AS
SELECT
    t.ID
    , t.TABLE_SCHEMA
    , t.TABLE_NAME
    , t.COLUMN_NAME
    , t.LANGUAGE_NAME
    , t.TRANSLATED_NAME
    , t.TRANSLATED_DESC
    , t.TRANSLATED_COMMENT
FROM
    XLS.TRANSLATIONS t
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    );

CREATE OR REPLACE VIEW XLS.VIEW_WORKBOOKS
AS
SELECT
    t.ID
    , t.NAME
    , t.TEMPLATE
    , t.DEFINITION
    , t.TABLE_SCHEMA
FROM
    XLS.WORKBOOKS t
WHERE
    t.TABLE_SCHEMA IN (
        SELECT
            t.TABSCHEMA
        FROM
            SYSCAT.TABLES t
        WHERE
            t.TABSCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSTOOLS', 'SYSSTAT')
        UNION
        SELECT
            r.ROUTINESCHEMA
        FROM
            SYSCAT.ROUTINES r
        WHERE
            r.ROUTINESCHEMA NOT IN ('SYSCAT', 'SYSIBM', 'SYSIBMADM', 'SYSPROC', 'SYSTOOLS', 'SYSSTAT')
    );

CREATE OR REPLACE VIEW XLS.USERS
AS
SELECT
    a.AUTHID AS USER
    , r.ROLENAME AS ROLE
FROM
    SYSIBMADM.AUTHORIZATIONIDS a
    LEFT JOIN SYSCAT.DBAUTH d ON d.GRANTEE = a.AUTHID
    LEFT OUTER JOIN TABLE (SYSPROC.AUTH_LIST_ROLES_FOR_AUTHID(a.AUTHID, 'U')) AS r ON r.ROLENAME LIKE 'XLS_%'
WHERE
    AUTHIDTYPE = 'U';

--#SET TERMINATOR %%

CREATE OR REPLACE PROCEDURE XLS.XL_UPDATE_TABLE_FORMAT (
    IN SCHEMA VARCHAR(128),
    IN NAME VARCHAR(128),
    IN EXCELFORMATXML CLOB(200000),
    IN APP VARCHAR(50)
    )
    MODIFIES SQL DATA
    CALLED ON NULL INPUT
    COMMIT ON RETURN YES
    LANGUAGE SQL
P1: BEGIN

    IF SCHEMA IS NOT NULL AND NAME IS NOT NULL THEN
        IF EXCELFORMATXML IS NULL THEN
            DELETE FROM XLS.FORMATS
            WHERE
                TABLE_SCHEMA = SCHEMA AND TABLE_NAME = NAME AND COALESCE(APP, '') = COALESCE(XL_UPDATE_TABLE_FORMAT.APP, '');
        ELSE
            IF (SELECT TABLE_NAME FROM XLS.FORMATS WHERE TABLE_SCHEMA = SCHEMA AND TABLE_NAME = NAME AND COALESCE(APP, '') = COALESCE(XL_UPDATE_TABLE_FORMAT.APP, '')) IS NULL THEN
                INSERT INTO XLS.FORMATS
                    (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML, APP)
                VALUES
                    (SCHEMA, NAME, EXCELFORMATXML, APP);
            ELSE
                UPDATE XLS.FORMATS
                SET
                    TABLE_SCHEMA = SCHEMA,
                    TABLE_NAME = NAME,
                    TABLE_EXCEL_FORMAT_XML = EXCELFORMATXML
                WHERE
                    TABLE_SCHEMA = SCHEMA AND TABLE_NAME = NAME AND COALESCE(APP, '') = COALESCE(XL_UPDATE_TABLE_FORMAT.APP, '');
            END IF;
        END IF;
    END IF;
END P1
%%

CREATE OR REPLACE PROCEDURE XLS.XL_ACTIONS_SET_EXTENDED_ROLE_PERMISSIONS (
    )
    MODIFIES SQL DATA
    COMMIT ON RETURN YES
    LANGUAGE SQL
P1: BEGIN

    GRANT SELECT ON TABLE XLS.VIEW_COLUMNS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_FORMATS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_HANDLERS         TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_OBJECTS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_TRANSLATIONS     TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_QUERIES          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_WORKBOOKS        TO ROLE XLS_USERS;

    GRANT SELECT ON TABLE XLS.COLUMNS               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.FORMATS               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.HANDLERS              TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.OBJECTS               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.TRANSLATIONS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.QUERIES               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.WORKBOOKS             TO ROLE XLS_USERS;

    REVOKE SELECT ON TABLE XLS.COLUMNS              FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.FORMATS              FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.HANDLERS             FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.OBJECTS              FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.TRANSLATIONS         FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.QUERIES              FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.WORKBOOKS            FROM ROLE XLS_USERS;

    GRANT EXECUTE ON PROCEDURE XLS.XL_UPDATE_TABLE_FORMAT TO ROLE XLS_FORMATS;

    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE XLS.FORMATS TO ROLE XLS_FORMATS;

    REVOKE SELECT, INSERT, UPDATE, DELETE ON TABLE XLS.FORMATS FROM ROLE XLS_FORMATS;

END P1
%%

CREATE OR REPLACE PROCEDURE XLS.XL_ACTIONS_REVOKE_EXTENDED_ROLE_PERMISSIONS (
    )
    MODIFIES SQL DATA
    COMMIT ON RETURN YES
    LANGUAGE SQL
P1: BEGIN

    GRANT SELECT ON TABLE XLS.VIEW_COLUMNS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_FORMATS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_HANDLERS         TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_OBJECTS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_TRANSLATIONS     TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_QUERIES          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.VIEW_WORKBOOKS        TO ROLE XLS_USERS;

    REVOKE SELECT ON TABLE XLS.VIEW_COLUMNS         FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.VIEW_FORMATS         FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.VIEW_HANDLERS        FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.VIEW_OBJECTS         FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.VIEW_TRANSLATIONS    FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.VIEW_QUERIES         FROM ROLE XLS_USERS;
    REVOKE SELECT ON TABLE XLS.VIEW_WORKBOOKS       FROM ROLE XLS_USERS;

    GRANT SELECT ON TABLE XLS.COLUMNS               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.FORMATS               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.HANDLERS              TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.OBJECTS               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.TRANSLATIONS          TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.QUERIES               TO ROLE XLS_USERS;
    GRANT SELECT ON TABLE XLS.WORKBOOKS             TO ROLE XLS_USERS;

    GRANT EXECUTE ON PROCEDURE XLS.XL_UPDATE_TABLE_FORMAT TO ROLE XLS_FORMATS;

    REVOKE EXECUTE ON PROCEDURE XLS.XL_UPDATE_TABLE_FORMAT FROM ROLE XLS_FORMATS;

    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE XLS.FORMATS TO ROLE XLS_FORMATS;

END P1
%%

--#SET TERMINATOR ;

INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'SAVETODB_FRAMEWORK_EXTENSION', 'VERSION', 'Information', NULL, NULL, 'ATTRIBUTE', '10.4', NULL, NULL, NULL);

INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_COLUMNS', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-columns.htm', NULL, 13, NULL);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_FORMATS', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-formats.htm', NULL, 13, NULL);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_HANDLERS', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-handlers.htm', NULL, 13, NULL);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_OBJECTS', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-objects.htm', NULL, 13, NULL);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_TRANSLATIONS', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-translations.htm', NULL, 13, NULL);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_WORKBOOKS', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-workbooks.htm', NULL, 13, NULL);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'VIEW_QUERIES', NULL, 'Actions', 'XLS', 'Developer Guide', 'HTTP', 'https://www.savetodb.com/dev-guide/xls-queries.htm', NULL, 13, NULL);

INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'USERS', NULL, 'ACTIONS', 'XLS', 'XL_ACTIONS_SET_EXTENDED_ROLE_PERMISSIONS', 'PROCEDURE', NULL, '_MsgBox', 22, 1);
INSERT INTO XLS.HANDLERS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, EVENT_NAME, HANDLER_SCHEMA, HANDLER_NAME, HANDLER_TYPE, HANDLER_CODE, TARGET_WORKSHEET, MENU_ORDER, EDIT_PARAMETERS) VALUES ('XLS', 'USERS', NULL, 'ACTIONS', 'XLS', 'XL_ACTIONS_REVOKE_EXTENDED_ROLE_PERMISSIONS', 'PROCEDURE', NULL, '_MsgBox', 23, 1);

INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_COLUMNS', '<table name="XLS.VIEW_COLUMNS"><columnFormats><column name="" property="ListObjectName" value="columns" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="ID" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="ID" property="Address" value="$C$4" type="String"/><column name="ID" property="ColumnWidth" value="4.43" type="Double"/><column name="ID" property="NumberFormat" value="General" type="String"/><column name="ID" property="Validation.Type" value="1" type="Double"/><column name="ID" property="Validation.Operator" value="1" type="Double"/><column name="ID" property="Validation.Formula1" value="-2147483648" type="String"/><column name="ID" property="Validation.Formula2" value="2147483647" type="String"/><column name="ID" property="Validation.AlertStyle" value="2" type="Double"/><column name="ID" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="ID" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="ID" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="ID" property="Validation.ErrorMessage" value="The column requires values of the int datatype." type="String"/><column name="ID" property="Validation.ShowInput" value="True" type="Boolean"/><column name="ID" property="Validation.ShowError" value="True" type="Boolean"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$D$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="Validation.Type" value="6" type="Double"/><column name="TABLE_SCHEMA" property="Validation.Operator" value="8" type="Double"/><column name="TABLE_SCHEMA" property="Validation.Formula1" value="128" type="String"/><column name="TABLE_SCHEMA" property="Validation.AlertStyle" value="2" type="Double"/><column name="TABLE_SCHEMA" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="TABLE_SCHEMA" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="TABLE_SCHEMA" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="TABLE_SCHEMA" property="Validation.ErrorMessage" value="The column requires values of the nvarchar(128) datatype." type="String"/><column name="TABLE_SCHEMA" property="Validation.ShowInput" value="True" type="Boolean"/><column name="TABLE_SCHEMA" property="Validation.ShowError" value="True" type="Boolean"/><column name="TABLE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_NAME" property="Address" value="$E$4" type="String"/><column name="TABLE_NAME" property="ColumnWidth" value="15.43" type="Double"/><column name="TABLE_NAME" property="NumberFormat" value="General" type="String"/><column name="TABLE_NAME" property="Validation.Type" value="6" type="Double"/><column name="TABLE_NAME" property="Validation.Operator" value="8" type="Double"/><column name="TABLE_NAME" property="Validation.Formula1" value="128" type="String"/><column name="TABLE_NAME" property="Validation.AlertStyle" value="2" type="Double"/><column name="TABLE_NAME" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="TABLE_NAME" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="TABLE_NAME" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="TABLE_NAME" property="Validation.ErrorMessage" value="The column requires values of the nvarchar(128) datatype." type="String"/><column name="TABLE_NAME" property="Validation.ShowInput" value="True" type="Boolean"/><column name="TABLE_NAME" property="Validation.ShowError" value="True" type="Boolean"/><column name="COLUMN_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="COLUMN_NAME" property="Address" value="$F$4" type="String"/><column name="COLUMN_NAME" property="ColumnWidth" value="27.86" type="Double"/><column name="COLUMN_NAME" property="NumberFormat" value="General" type="String"/><column name="COLUMN_NAME" property="Validation.Type" value="6" type="Double"/><column name="COLUMN_NAME" property="Validation.Operator" value="8" type="Double"/><column name="COLUMN_NAME" property="Validation.Formula1" value="128" type="String"/><column name="COLUMN_NAME" property="Validation.AlertStyle" value="2" type="Double"/><column name="COLUMN_NAME" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="COLUMN_NAME" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="COLUMN_NAME" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="COLUMN_NAME" property="Validation.ErrorMessage" value="The column requires values of the nvarchar(128) datatype." type="String"/><column name="COLUMN_NAME" property="Validation.ShowInput" value="True" type="Boolean"/><column name="COLUMN_NAME" property="Validation.ShowError" value="True" type="Boolean"/><column name="ORDINAL_POSITION" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="ORDINAL_POSITION" property="Address" value="$G$4" type="String"/><column name="ORDINAL_POSITION" property="ColumnWidth" value="20.43" type="Double"/><column name="ORDINAL_POSITION" property="NumberFormat" value="General" type="String"/><column name="ORDINAL_POSITION" property="Validation.Type" value="1" type="Double"/><column name="ORDINAL_POSITION" property="Validation.Operator" value="1" type="Double"/><column name="ORDINAL_POSITION" property="Validation.Formula1" value="-2147483648" type="String"/><column name="ORDINAL_POSITION" property="Validation.Formula2" value="2147483647" type="String"/><column name="ORDINAL_POSITION" property="Validation.AlertStyle" value="2" type="Double"/><column name="ORDINAL_POSITION" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="ORDINAL_POSITION" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="ORDINAL_POSITION" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="ORDINAL_POSITION" property="Validation.ErrorMessage" value="The column requires values of the int datatype." type="String"/><column name="ORDINAL_POSITION" property="Validation.ShowInput" value="True" type="Boolean"/><column name="ORDINAL_POSITION" property="Validation.ShowError" value="True" type="Boolean"/><column name="IS_PRIMARY_KEY" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="IS_PRIMARY_KEY" property="Address" value="$H$4" type="String"/><column name="IS_PRIMARY_KEY" property="ColumnWidth" value="17.86" type="Double"/><column name="IS_PRIMARY_KEY" property="NumberFormat" value="General" type="String"/><column name="IS_PRIMARY_KEY" property="HorizontalAlignment" value="-4108" type="Double"/><column name="IS_PRIMARY_KEY" property="Font.Size" value="10" type="Double"/><column name="IS_NULLABLE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="IS_NULLABLE" property="Address" value="$I$4" type="String"/><column name="IS_NULLABLE" property="ColumnWidth" value="14" type="Double"/><column name="IS_NULLABLE" property="NumberFormat" value="General" type="String"/><column name="IS_NULLABLE" property="HorizontalAlignment" value="-4108" type="Double"/><column name="IS_NULLABLE" property="Font.Size" value="10" type="Double"/><column name="IS_IDENTITY" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="IS_IDENTITY" property="Address" value="$J$4" type="String"/><column name="IS_IDENTITY" property="ColumnWidth" value="13.14" type="Double"/><column name="IS_IDENTITY" property="NumberFormat" value="General" type="String"/><column name="IS_IDENTITY" property="HorizontalAlignment" value="-4108" type="Double"/><column name="IS_IDENTITY" property="Font.Size" value="10" type="Double"/><column name="IS_COMPUTED" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="IS_COMPUTED" property="Address" value="$K$4" type="String"/><column name="IS_COMPUTED" property="ColumnWidth" value="15.57" type="Double"/><column name="IS_COMPUTED" property="NumberFormat" value="General" type="String"/><column name="IS_COMPUTED" property="HorizontalAlignment" value="-4108" type="Double"/><column name="IS_COMPUTED" property="Font.Size" value="10" type="Double"/><column name="COLUMN_DEFAULT" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="COLUMN_DEFAULT" property="Address" value="$L$4" type="String"/><column name="COLUMN_DEFAULT" property="ColumnWidth" value="19.86" type="Double"/><column name="COLUMN_DEFAULT" property="NumberFormat" value="General" type="String"/><column name="COLUMN_DEFAULT" property="Validation.Type" value="6" type="Double"/><column name="COLUMN_DEFAULT" property="Validation.Operator" value="8" type="Double"/><column name="COLUMN_DEFAULT" property="Validation.Formula1" value="256" type="String"/><column name="COLUMN_DEFAULT" property="Validation.AlertStyle" value="2" type="Double"/><column name="COLUMN_DEFAULT" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="COLUMN_DEFAULT" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="COLUMN_DEFAULT" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="COLUMN_DEFAULT" property="Validation.ErrorMessage" value="The column requires values of the nvarchar(256) datatype." type="String"/><column name="COLUMN_DEFAULT" property="Validation.ShowInput" value="True" type="Boolean"/><column name="COLUMN_DEFAULT" property="Validation.ShowError" value="True" type="Boolean"/><column name="DATA_TYPE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="DATA_TYPE" property="Address" value="$M$4" type="String"/><column name="DATA_TYPE" property="ColumnWidth" value="12.71" type="Double"/><column name="DATA_TYPE" property="NumberFormat" value="General" type="String"/><column name="DATA_TYPE" property="Validation.Type" value="6" type="Double"/><column name="DATA_TYPE" property="Validation.Operator" value="8" type="Double"/><column name="DATA_TYPE" property="Validation.Formula1" value="128" type="String"/><column name="DATA_TYPE" property="Validation.AlertStyle" value="2" type="Double"/><column name="DATA_TYPE" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="DATA_TYPE" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="DATA_TYPE" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="DATA_TYPE" property="Validation.ErrorMessage" value="The column requires values of the nvarchar(128) datatype." type="String"/><column name="DATA_TYPE" property="Validation.ShowInput" value="True" type="Boolean"/><column name="DATA_TYPE" property="Validation.ShowError" value="True" type="Boolean"/><column name="CHARACTER_MAXIMUM_LENGTH" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Address" value="$N$4" type="String"/><column name="CHARACTER_MAXIMUM_LENGTH" property="ColumnWidth" value="32.71" type="Double"/><column name="CHARACTER_MAXIMUM_LENGTH" property="NumberFormat" value="General" type="String"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.Type" value="1" type="Double"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.Operator" value="1" type="Double"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.Formula1" value="-2147483648" type="String"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.Formula2" value="2147483647" type="String"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.AlertStyle" value="2" type="Double"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.ErrorMessage" value="The column requires values of the int datatype." type="String"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.ShowInput" value="True" type="Boolean"/><column name="CHARACTER_MAXIMUM_LENGTH" property="Validation.ShowError" value="True" type="Boolean"/><column name="PRECISION" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="PRECISION" property="Address" value="$O$4" type="String"/><column name="PRECISION" property="ColumnWidth" value="12" type="Double"/><column name="PRECISION" property="NumberFormat" value="General" type="String"/><column name="PRECISION" property="Validation.Type" value="1" type="Double"/><column name="PRECISION" property="Validation.Operator" value="1" type="Double"/><column name="PRECISION" property="Validation.Formula1" value="0" type="String"/><column name="PRECISION" property="Validation.Formula2" value="255" type="String"/><column name="PRECISION" property="Validation.AlertStyle" value="2" type="Double"/><column name="PRECISION" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="PRECISION" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="PRECISION" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="PRECISION" property="Validation.ErrorMessage" value="The column requires values of the tinyint datatype." type="String"/><column name="PRECISION" property="Validation.ShowInput" value="True" type="Boolean"/><column name="PRECISION" property="Validation.ShowError" value="True" type="Boolean"/><column name="SCALE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="SCALE" property="Address" value="$P$4" type="String"/><column name="SCALE" property="ColumnWidth" value="7.86" type="Double"/><column name="SCALE" property="NumberFormat" value="General" type="String"/><column name="SCALE" property="Validation.Type" value="1" type="Double"/><column name="SCALE" property="Validation.Operator" value="1" type="Double"/><column name="SCALE" property="Validation.Formula1" value="0" type="String"/><column name="SCALE" property="Validation.Formula2" value="255" type="String"/><column name="SCALE" property="Validation.AlertStyle" value="2" type="Double"/><column name="SCALE" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="SCALE" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="SCALE" property="Validation.ErrorTitle" value="Datatype Control" type="String"/><column name="SCALE" property="Validation.ErrorMessage" value="The column requires values of the tinyint datatype." type="String"/><column name="SCALE" property="Validation.ShowInput" value="True" type="Boolean"/><column name="SCALE" property="Validation.ShowError" value="True" type="Boolean"/><column name="TABLE_SCHEMA" property="FormatConditions(1).AppliesTo.Address" value="$D$4:$D$423" type="String"/><column name="TABLE_SCHEMA" property="FormatConditions(1).Type" value="2" type="Double"/><column name="TABLE_SCHEMA" property="FormatConditions(1).Priority" value="5" type="Double"/><column name="TABLE_SCHEMA" property="FormatConditions(1).Formula1" value="=ISBLANK(D4)" type="String"/><column name="TABLE_SCHEMA" property="FormatConditions(1).Interior.Color" value="65535" type="Double"/><column name="TABLE_NAME" property="FormatConditions(1).AppliesTo.Address" value="$E$4:$E$423" type="String"/><column name="TABLE_NAME" property="FormatConditions(1).Type" value="2" type="Double"/><column name="TABLE_NAME" property="FormatConditions(1).Priority" value="6" type="Double"/><column name="TABLE_NAME" property="FormatConditions(1).Formula1" value="=ISBLANK(E4)" type="String"/><column name="TABLE_NAME" property="FormatConditions(1).Interior.Color" value="65535" type="Double"/><column name="COLUMN_NAME" property="FormatConditions(1).AppliesTo.Address" value="$F$4:$F$423" type="String"/><column name="COLUMN_NAME" property="FormatConditions(1).Type" value="2" type="Double"/><column name="COLUMN_NAME" property="FormatConditions(1).Priority" value="7" type="Double"/><column name="COLUMN_NAME" property="FormatConditions(1).Formula1" value="=ISBLANK(F4)" type="String"/><column name="COLUMN_NAME" property="FormatConditions(1).Interior.Color" value="65535" type="Double"/><column name="ORDINAL_POSITION" property="FormatConditions(1).AppliesTo.Address" value="$G$4:$G$423" type="String"/><column name="ORDINAL_POSITION" property="FormatConditions(1).Type" value="2" type="Double"/><column name="ORDINAL_POSITION" property="FormatConditions(1).Priority" value="8" type="Double"/><column name="ORDINAL_POSITION" property="FormatConditions(1).Formula1" value="=ISBLANK(G4)" type="String"/><column name="ORDINAL_POSITION" property="FormatConditions(1).Interior.Color" value="65535" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).AppliesTo.Address" value="$H$4:$H$423" type="String"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).Type" value="6" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).Priority" value="4" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).ShowIconOnly" value="True" type="Boolean"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconSet.ID" value="8" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(1).Type" value="3" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(1).Operator" value="7" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(2).Type" value="0" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(2).Value" value="0.5" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(2).Operator" value="7" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(3).Type" value="0" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(3).Value" value="1" type="Double"/><column name="IS_PRIMARY_KEY" property="FormatConditions(1).IconCriteria(3).Operator" value="7" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).AppliesTo.Address" value="$I$4:$I$423" type="String"/><column name="IS_NULLABLE" property="FormatConditions(1).Type" value="6" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).Priority" value="3" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).ShowIconOnly" value="True" type="Boolean"/><column name="IS_NULLABLE" property="FormatConditions(1).IconSet.ID" value="8" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(1).Type" value="3" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(1).Operator" value="7" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(2).Type" value="0" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(2).Value" value="0.5" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(2).Operator" value="7" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(3).Type" value="0" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(3).Value" value="1" type="Double"/><column name="IS_NULLABLE" property="FormatConditions(1).IconCriteria(3).Operator" value="7" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).AppliesTo.Address" value="$J$4:$J$423" type="String"/><column name="IS_IDENTITY" property="FormatConditions(1).Type" value="6" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).Priority" value="2" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).ShowIconOnly" value="True" type="Boolean"/><column name="IS_IDENTITY" property="FormatConditions(1).IconSet.ID" value="8" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(1).Type" value="3" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(1).Operator" value="7" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(2).Type" value="0" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(2).Value" value="0.5" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(2).Operator" value="7" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(3).Type" value="0" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(3).Value" value="1" type="Double"/><column name="IS_IDENTITY" property="FormatConditions(1).IconCriteria(3).Operator" value="7" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).AppliesTo.Address" value="$K$4:$K$423" type="String"/><column name="IS_COMPUTED" property="FormatConditions(1).Type" value="6" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).Priority" value="1" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).ShowIconOnly" value="True" type="Boolean"/><column name="IS_COMPUTED" property="FormatConditions(1).IconSet.ID" value="8" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(1).Type" value="3" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(1).Operator" value="7" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(2).Type" value="0" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(2).Value" value="0.5" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(2).Operator" value="7" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(3).Type" value="0" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(3).Value" value="1" type="Double"/><column name="IS_COMPUTED" property="FormatConditions(1).IconCriteria(3).Operator" value="7" type="Double"/><column name="SortFields(1)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="2" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="TABLE_NAME" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="2" type="Double"/><column name="SortFields(3)" property="KeyfieldName" value="ORDINAL_POSITION" type="String"/><column name="SortFields(3)" property="SortOn" value="0" type="Double"/><column name="SortFields(3)" property="Order" value="1" type="Double"/><column name="SortFields(3)" property="DataOption" value="2" type="Double"/><column name="SortFields(4)" property="KeyfieldName" value="COLUMN_NAME" type="String"/><column name="SortFields(4)" property="SortOn" value="0" type="Double"/><column name="SortFields(4)" property="Order" value="1" type="Double"/><column name="SortFields(4)" property="DataOption" value="2" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_FORMATS', '<table name="XLS.VIEW_FORMATS"><columnFormats><column name="" property="ListObjectName" value="formats" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="_RowNum" property="VerticalAlignment" value="-4160" type="Double"/><column name="ID" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="ID" property="Address" value="$C$4" type="String"/><column name="ID" property="NumberFormat" value="General" type="String"/><column name="ID" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$D$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_NAME" property="Address" value="$E$4" type="String"/><column name="TABLE_NAME" property="ColumnWidth" value="30" type="Double"/><column name="TABLE_NAME" property="NumberFormat" value="General" type="String"/><column name="TABLE_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_EXCEL_FORMAT_XML" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_EXCEL_FORMAT_XML" property="Address" value="$F$4" type="String"/><column name="TABLE_EXCEL_FORMAT_XML" property="ColumnWidth" value="42.29" type="Double"/><column name="TABLE_EXCEL_FORMAT_XML" property="NumberFormat" value="General" type="String"/><column name="SortFields(1)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="0" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="TABLE_NAME" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="0" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_HANDLERS', '<table name="XLS.VIEW_HANDLERS"><columnFormats><column name="" property="ListObjectName" value="handlers" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="_RowNum" property="VerticalAlignment" value="-4160" type="Double"/><column name="ID" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="ID" property="Address" value="$C$4" type="String"/><column name="ID" property="NumberFormat" value="General" type="String"/><column name="ID" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$D$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_NAME" property="Address" value="$E$4" type="String"/><column name="TABLE_NAME" property="ColumnWidth" value="30" type="Double"/><column name="TABLE_NAME" property="NumberFormat" value="General" type="String"/><column name="TABLE_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="COLUMN_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="COLUMN_NAME" property="Address" value="$F$4" type="String"/><column name="COLUMN_NAME" property="ColumnWidth" value="17.43" type="Double"/><column name="COLUMN_NAME" property="NumberFormat" value="General" type="String"/><column name="COLUMN_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="EVENT_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="EVENT_NAME" property="Address" value="$G$4" type="String"/><column name="EVENT_NAME" property="ColumnWidth" value="21.57" type="Double"/><column name="EVENT_NAME" property="NumberFormat" value="General" type="String"/><column name="EVENT_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="HANDLER_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="HANDLER_SCHEMA" property="Address" value="$H$4" type="String"/><column name="HANDLER_SCHEMA" property="ColumnWidth" value="19.71" type="Double"/><column name="HANDLER_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="HANDLER_SCHEMA" property="VerticalAlignment" value="-4160" type="Double"/><column name="HANDLER_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="HANDLER_NAME" property="Address" value="$I$4" type="String"/><column name="HANDLER_NAME" property="ColumnWidth" value="31.14" type="Double"/><column name="HANDLER_NAME" property="NumberFormat" value="General" type="String"/><column name="HANDLER_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="HANDLER_TYPE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="HANDLER_TYPE" property="Address" value="$J$4" type="String"/><column name="HANDLER_TYPE" property="ColumnWidth" value="16.29" type="Double"/><column name="HANDLER_TYPE" property="NumberFormat" value="General" type="String"/><column name="HANDLER_TYPE" property="VerticalAlignment" value="-4160" type="Double"/><column name="HANDLER_CODE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="HANDLER_CODE" property="Address" value="$K$4" type="String"/><column name="HANDLER_CODE" property="ColumnWidth" value="70.71" type="Double"/><column name="HANDLER_CODE" property="NumberFormat" value="General" type="String"/><column name="HANDLER_CODE" property="VerticalAlignment" value="-4160" type="Double"/><column name="TARGET_WORKSHEET" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TARGET_WORKSHEET" property="Address" value="$L$4" type="String"/><column name="TARGET_WORKSHEET" property="ColumnWidth" value="21.71" type="Double"/><column name="TARGET_WORKSHEET" property="NumberFormat" value="General" type="String"/><column name="TARGET_WORKSHEET" property="VerticalAlignment" value="-4160" type="Double"/><column name="MENU_ORDER" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="MENU_ORDER" property="Address" value="$M$4" type="String"/><column name="MENU_ORDER" property="ColumnWidth" value="15.43" type="Double"/><column name="MENU_ORDER" property="NumberFormat" value="General" type="String"/><column name="MENU_ORDER" property="VerticalAlignment" value="-4160" type="Double"/><column name="EDIT_PARAMETERS" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="EDIT_PARAMETERS" property="Address" value="$N$4" type="String"/><column name="EDIT_PARAMETERS" property="ColumnWidth" value="19.57" type="Double"/><column name="EDIT_PARAMETERS" property="NumberFormat" value="General" type="String"/><column name="EDIT_PARAMETERS" property="HorizontalAlignment" value="-4108" type="Double"/><column name="EDIT_PARAMETERS" property="VerticalAlignment" value="-4160" type="Double"/><column name="EDIT_PARAMETERS" property="Font.Size" value="10" type="Double"/><column name="SortFields(1)" property="KeyfieldName" value="EVENT_NAME" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="0" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="0" type="Double"/><column name="SortFields(3)" property="KeyfieldName" value="TABLE_NAME" type="String"/><column name="SortFields(3)" property="SortOn" value="0" type="Double"/><column name="SortFields(3)" property="Order" value="1" type="Double"/><column name="SortFields(3)" property="DataOption" value="0" type="Double"/><column name="SortFields(4)" property="KeyfieldName" value="COLUMN_NAME" type="String"/><column name="SortFields(4)" property="SortOn" value="0" type="Double"/><column name="SortFields(4)" property="Order" value="1" type="Double"/><column name="SortFields(4)" property="DataOption" value="0" type="Double"/><column name="SortFields(5)" property="KeyfieldName" value="MENU_ORDER" type="String"/><column name="SortFields(5)" property="SortOn" value="0" type="Double"/><column name="SortFields(5)" property="Order" value="1" type="Double"/><column name="SortFields(5)" property="DataOption" value="0" type="Double"/><column name="SortFields(6)" property="KeyfieldName" value="HANDLER_SCHEMA" type="String"/><column name="SortFields(6)" property="SortOn" value="0" type="Double"/><column name="SortFields(6)" property="Order" value="1" type="Double"/><column name="SortFields(6)" property="DataOption" value="0" type="Double"/><column name="SortFields(7)" property="KeyfieldName" value="HANDLER_NAME" type="String"/><column name="SortFields(7)" property="SortOn" value="0" type="Double"/><column name="SortFields(7)" property="Order" value="1" type="Double"/><column name="SortFields(7)" property="DataOption" value="0" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_OBJECTS', '<table name="XLS.VIEW_OBJECTS"><columnFormats><column name="" property="ListObjectName" value="objects" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="_RowNum" property="VerticalAlignment" value="-4160" type="Double"/><column name="ID" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="ID" property="Address" value="$C$4" type="String"/><column name="ID" property="NumberFormat" value="General" type="String"/><column name="ID" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$D$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_NAME" property="Address" value="$E$4" type="String"/><column name="TABLE_NAME" property="ColumnWidth" value="30" type="Double"/><column name="TABLE_NAME" property="NumberFormat" value="General" type="String"/><column name="TABLE_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_TYPE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_TYPE" property="Address" value="$F$4" type="String"/><column name="TABLE_TYPE" property="ColumnWidth" value="13.14" type="Double"/><column name="TABLE_TYPE" property="NumberFormat" value="General" type="String"/><column name="TABLE_TYPE" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_TYPE" property="Validation.Type" value="3" type="Double"/><column name="TABLE_TYPE" property="Validation.Operator" value="1" type="Double"/><column name="TABLE_TYPE" property="Validation.Formula1" value="TABLE; VIEW; PROCEDURE; CODE; HTTP; TEXT; HIDDEN" type="String"/><column name="TABLE_TYPE" property="Validation.AlertStyle" value="1" type="Double"/><column name="TABLE_TYPE" property="Validation.IgnoreBlank" value="True" type="Boolean"/><column name="TABLE_TYPE" property="Validation.InCellDropdown" value="True" type="Boolean"/><column name="TABLE_TYPE" property="Validation.ShowInput" value="True" type="Boolean"/><column name="TABLE_TYPE" property="Validation.ShowError" value="True" type="Boolean"/><column name="TABLE_CODE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_CODE" property="Address" value="$G$4" type="String"/><column name="TABLE_CODE" property="ColumnWidth" value="13.57" type="Double"/><column name="TABLE_CODE" property="NumberFormat" value="General" type="String"/><column name="TABLE_CODE" property="VerticalAlignment" value="-4160" type="Double"/><column name="INSERT_OBJECT" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="INSERT_OBJECT" property="Address" value="$H$4" type="String"/><column name="INSERT_OBJECT" property="ColumnWidth" value="27.86" type="Double"/><column name="INSERT_OBJECT" property="NumberFormat" value="General" type="String"/><column name="INSERT_OBJECT" property="VerticalAlignment" value="-4160" type="Double"/><column name="UPDATE_OBJECT" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="UPDATE_OBJECT" property="Address" value="$I$4" type="String"/><column name="UPDATE_OBJECT" property="ColumnWidth" value="27.86" type="Double"/><column name="UPDATE_OBJECT" property="NumberFormat" value="General" type="String"/><column name="UPDATE_OBJECT" property="VerticalAlignment" value="-4160" type="Double"/><column name="DELETE_OBJECT" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="DELETE_OBJECT" property="Address" value="$J$4" type="String"/><column name="DELETE_OBJECT" property="ColumnWidth" value="27.86" type="Double"/><column name="DELETE_OBJECT" property="NumberFormat" value="General" type="String"/><column name="DELETE_OBJECT" property="VerticalAlignment" value="-4160" type="Double"/><column name="SortFields(1)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="2" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="TABLE_NAME" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="2" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_QUERIES', '<table name="XLS.VIEW_QUERIES"><columnFormats><column name="" property="ListObjectName" value="queries" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$C$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_NAME" property="Address" value="$D$4" type="String"/><column name="TABLE_NAME" property="ColumnWidth" value="30" type="Double"/><column name="TABLE_NAME" property="NumberFormat" value="General" type="String"/><column name="TABLE_TYPE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_TYPE" property="Address" value="$E$4" type="String"/><column name="TABLE_TYPE" property="ColumnWidth" value="13.14" type="Double"/><column name="TABLE_TYPE" property="NumberFormat" value="General" type="String"/><column name="TABLE_CODE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_CODE" property="Address" value="$F$4" type="String"/><column name="TABLE_CODE" property="ColumnWidth" value="13.57" type="Double"/><column name="TABLE_CODE" property="NumberFormat" value="General" type="String"/><column name="INSERT_PROCEDURE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="INSERT_PROCEDURE" property="Address" value="$G$4" type="String"/><column name="INSERT_PROCEDURE" property="ColumnWidth" value="27.86" type="Double"/><column name="INSERT_PROCEDURE" property="NumberFormat" value="General" type="String"/><column name="UPDATE_PROCEDURE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="UPDATE_PROCEDURE" property="Address" value="$H$4" type="String"/><column name="UPDATE_PROCEDURE" property="ColumnWidth" value="27.86" type="Double"/><column name="UPDATE_PROCEDURE" property="NumberFormat" value="General" type="String"/><column name="DELETE_PROCEDURE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="DELETE_PROCEDURE" property="Address" value="$I$4" type="String"/><column name="DELETE_PROCEDURE" property="ColumnWidth" value="27.86" type="Double"/><column name="DELETE_PROCEDURE" property="NumberFormat" value="General" type="String"/><column name="PROCEDURE_TYPE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="PROCEDURE_TYPE" property="Address" value="$J$4" type="String"/><column name="PROCEDURE_TYPE" property="ColumnWidth" value="18.86" type="Double"/><column name="PROCEDURE_TYPE" property="NumberFormat" value="General" type="String"/><column name="SortFields(1)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="2" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="TABLE_NAME" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="2" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_TRANSLATIONS', '<table name="XLS.VIEW_TRANSLATIONS"><columnFormats><column name="" property="ListObjectName" value="translations" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="_RowNum" property="VerticalAlignment" value="-4160" type="Double"/><column name="ID" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="ID" property="Address" value="$C$4" type="String"/><column name="ID" property="NumberFormat" value="General" type="String"/><column name="ID" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$D$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_NAME" property="Address" value="$E$4" type="String"/><column name="TABLE_NAME" property="ColumnWidth" value="32.14" type="Double"/><column name="TABLE_NAME" property="NumberFormat" value="General" type="String"/><column name="TABLE_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="COLUMN_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="COLUMN_NAME" property="Address" value="$F$4" type="String"/><column name="COLUMN_NAME" property="ColumnWidth" value="20.71" type="Double"/><column name="COLUMN_NAME" property="NumberFormat" value="General" type="String"/><column name="COLUMN_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="LANGUAGE_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="LANGUAGE_NAME" property="Address" value="$G$4" type="String"/><column name="LANGUAGE_NAME" property="ColumnWidth" value="19.57" type="Double"/><column name="LANGUAGE_NAME" property="NumberFormat" value="General" type="String"/><column name="LANGUAGE_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="TRANSLATED_NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TRANSLATED_NAME" property="Address" value="$H$4" type="String"/><column name="TRANSLATED_NAME" property="ColumnWidth" value="30" type="Double"/><column name="TRANSLATED_NAME" property="NumberFormat" value="General" type="String"/><column name="TRANSLATED_NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="TRANSLATED_DESC" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TRANSLATED_DESC" property="Address" value="$I$4" type="String"/><column name="TRANSLATED_DESC" property="ColumnWidth" value="19.57" type="Double"/><column name="TRANSLATED_DESC" property="NumberFormat" value="General" type="String"/><column name="TRANSLATED_DESC" property="VerticalAlignment" value="-4160" type="Double"/><column name="TRANSLATED_COMMENT" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TRANSLATED_COMMENT" property="Address" value="$J$4" type="String"/><column name="TRANSLATED_COMMENT" property="ColumnWidth" value="25" type="Double"/><column name="TRANSLATED_COMMENT" property="NumberFormat" value="General" type="String"/><column name="TRANSLATED_COMMENT" property="VerticalAlignment" value="-4160" type="Double"/><column name="SortFields(1)" property="KeyfieldName" value="LANGUAGE_NAME" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="2" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="2" type="Double"/><column name="SortFields(3)" property="KeyfieldName" value="TABLE_NAME" type="String"/><column name="SortFields(3)" property="SortOn" value="0" type="Double"/><column name="SortFields(3)" property="Order" value="1" type="Double"/><column name="SortFields(3)" property="DataOption" value="2" type="Double"/><column name="SortFields(4)" property="KeyfieldName" value="COLUMN_NAME" type="String"/><column name="SortFields(4)" property="SortOn" value="0" type="Double"/><column name="SortFields(4)" property="Order" value="1" type="Double"/><column name="SortFields(4)" property="DataOption" value="2" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');
INSERT INTO XLS.FORMATS (TABLE_SCHEMA, TABLE_NAME, TABLE_EXCEL_FORMAT_XML) VALUES ('XLS', 'VIEW_WORKBOOKS', '<table name="XLS.VIEW_WORKBOOKS"><columnFormats><column name="" property="ListObjectName" value="workbooks" type="String"/><column name="" property="ShowTotals" value="False" type="Boolean"/><column name="" property="TableStyle.Name" value="TableStyleMedium15" type="String"/><column name="" property="ShowTableStyleColumnStripes" value="False" type="Boolean"/><column name="" property="ShowTableStyleFirstColumn" value="False" type="Boolean"/><column name="" property="ShowShowTableStyleLastColumn" value="False" type="Boolean"/><column name="" property="ShowTableStyleRowStripes" value="False" type="Boolean"/><column name="_RowNum" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="_RowNum" property="Address" value="$B$4" type="String"/><column name="_RowNum" property="NumberFormat" value="General" type="String"/><column name="_RowNum" property="VerticalAlignment" value="-4160" type="Double"/><column name="ID" property="EntireColumn.Hidden" value="True" type="Boolean"/><column name="ID" property="Address" value="$C$4" type="String"/><column name="ID" property="NumberFormat" value="General" type="String"/><column name="ID" property="VerticalAlignment" value="-4160" type="Double"/><column name="NAME" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="NAME" property="Address" value="$D$4" type="String"/><column name="NAME" property="ColumnWidth" value="42.14" type="Double"/><column name="NAME" property="NumberFormat" value="General" type="String"/><column name="NAME" property="VerticalAlignment" value="-4160" type="Double"/><column name="TEMPLATE" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TEMPLATE" property="Address" value="$E$4" type="String"/><column name="TEMPLATE" property="ColumnWidth" value="30" type="Double"/><column name="TEMPLATE" property="NumberFormat" value="General" type="String"/><column name="TEMPLATE" property="VerticalAlignment" value="-4160" type="Double"/><column name="DEFINITION" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="DEFINITION" property="Address" value="$F$4" type="String"/><column name="DEFINITION" property="ColumnWidth" value="70.71" type="Double"/><column name="DEFINITION" property="NumberFormat" value="General" type="String"/><column name="DEFINITION" property="VerticalAlignment" value="-4160" type="Double"/><column name="TABLE_SCHEMA" property="EntireColumn.Hidden" value="False" type="Boolean"/><column name="TABLE_SCHEMA" property="Address" value="$G$4" type="String"/><column name="TABLE_SCHEMA" property="ColumnWidth" value="16.57" type="Double"/><column name="TABLE_SCHEMA" property="NumberFormat" value="General" type="String"/><column name="TABLE_SCHEMA" property="VerticalAlignment" value="-4160" type="Double"/><column name="SortFields(1)" property="KeyfieldName" value="TABLE_SCHEMA" type="String"/><column name="SortFields(1)" property="SortOn" value="0" type="Double"/><column name="SortFields(1)" property="Order" value="1" type="Double"/><column name="SortFields(1)" property="DataOption" value="0" type="Double"/><column name="SortFields(2)" property="KeyfieldName" value="NAME" type="String"/><column name="SortFields(2)" property="SortOn" value="0" type="Double"/><column name="SortFields(2)" property="Order" value="1" type="Double"/><column name="SortFields(2)" property="DataOption" value="0" type="Double"/><column name="" property="ActiveWindow.DisplayGridlines" value="False" type="Boolean"/><column name="" property="ActiveWindow.FreezePanes" value="True" type="Boolean"/><column name="" property="ActiveWindow.Split" value="True" type="Boolean"/><column name="" property="ActiveWindow.SplitRow" value="0" type="Double"/><column name="" property="ActiveWindow.SplitColumn" value="-2" type="Double"/><column name="" property="PageSetup.Orientation" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesWide" value="1" type="Double"/><column name="" property="PageSetup.FitToPagesTall" value="1" type="Double"/></columnFormats></table>');

INSERT INTO XLS.WORKBOOKS (NAME, TEMPLATE, DEFINITION, TABLE_SCHEMA) VALUES ('savetodb_user_configuration.xlsx', NULL,
'objects=XLS.VIEW_OBJECTS,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":null,"TABLE_TYPE":null},"ListObjectName":"objects"}
handlers=XLS.VIEW_HANDLERS,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":null,"EVENT_NAME":null,"HANDLER_TYPE":null},"ListObjectName":"handlers"}
columns=XLS.VIEW_COLUMNS,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":null,"TABLE_NAME":null},"ListObjectName":"columns"}
translations=XLS.VIEW_TRANSLATIONS,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":null,"LANGUAGE_NAME":null},"ListObjectName":"translations"}
workbooks=XLS.VIEW_WORKBOOKS,(Default),False,$B$3,,{"Parameters":{"TABLE_SCHEMA":null},"ListObjectName":"workbooks"}', 'XLS');

echo SaveToDB Framework Extension installed
