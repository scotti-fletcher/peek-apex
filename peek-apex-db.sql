CREATE TABLE  "COMPARTMENTS"
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	"NAME_PATH" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"OCID_PATH" VARCHAR2(4000) COLLATE "USING_NLS_COMP", 
	"DESCRIPTION" VARCHAR2(4000) COLLATE "USING_NLS_COMP", 
	"OCID" VARCHAR2(255) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP";

CREATE TABLE  "GRANTS" 
   (	"ID" NUMBER, 
	"PERMISSION" VARCHAR2(4000) COLLATE "USING_NLS_COMP", 
	"RESOURCE_NAME" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"GRANT_TYPE" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"COMPARTMENT_ID" NUMBER, 
	"GROUP_ID" NUMBER, 
	"STATEMENT" VARCHAR2(500) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP";

CREATE TABLE  "GROUPS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"IDP_GROUP_NAME" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"OCID" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"USER_ID" NUMBER, 
	"DESCRIPTION" VARCHAR2(4000) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP";

CREATE TABLE  "TREES" 
   (	"ID" NUMBER, 
	"PARENT_NODES" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"NODE_NAME" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"NODE_COLOR" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"NODE_SIZE" NUMBER, 
	"NODE_TOOLTIP" VARCHAR2(4000) COLLATE "USING_NLS_COMP", 
	"PATH_HELPER" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"TREE_NAME" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	"TREE_TYPE" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"NODE_LINK" VARCHAR2(4000) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP";

CREATE TABLE  "USERS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"DESCRIPTION" VARCHAR2(4000) COLLATE "USING_NLS_COMP", 
	"OCID" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"EXTERNAL_IDENTIFIER" VARCHAR2(255) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP";
BEGIN
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'peek',
                       p_object => 'COMPARTMENTS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'compartment',
                       p_auto_rest_auth => true);
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'peek',
                       p_object => 'GRANTS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'grant',
                       p_auto_rest_auth => true);
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'peek',
                       p_object => 'GROUPS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'group',
                       p_auto_rest_auth => true);
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'peek',
                       p_object => 'TREES',
                       p_object_type => 'TABLE',
                       p_object_alias => 'tree',
                       p_auto_rest_auth => true);
    ORDS.ENABLE_OBJECT(p_enabled => TRUE,
                       p_schema => 'peek',
                       p_object => 'USERS',
                       p_object_type => 'TABLE',
                       p_object_alias => 'user',
                       p_auto_rest_auth => true);
    APEX_UTIL.CREATE_USER(
        p_user_name    => 'API',
        p_web_password => 'secret99',
        p_email_address => 'changeme@example.com');

    APEX_UTIL.CREATE_USER_GROUP (
        p_id                => null,
        p_group_name        => 'oracle.dbtools.role.autorest.PEEK.COMPARTMENTS',
        p_security_group_id => null);

    APEX_UTIL.CREATE_USER_GROUP (
        p_id                => null,
        p_group_name        => 'oracle.dbtools.role.autorest.PEEK.GRANTS',
        p_security_group_id => null);
    APEX_UTIL.CREATE_USER_GROUP (
        p_id                => null,
        p_group_name        => 'oracle.dbtools.role.autorest.PEEK.GROUPS',
        p_security_group_id => null);
    APEX_UTIL.CREATE_USER_GROUP (
        p_id                => null,
        p_group_name        => 'oracle.dbtools.role.autorest.PEEK.TREES',
        p_security_group_id => null);
    APEX_UTIL.CREATE_USER_GROUP (
        p_id                => null,
        p_group_name        => 'oracle.dbtools.role.autorest.PEEK.USERS',
        p_security_group_id => null);
COMMIT;
END;


