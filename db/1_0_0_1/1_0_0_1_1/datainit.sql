insert into SECURITY_ROLE (CODE, NAME, STATUS, CREATE_TIME, LAST_MODIFY_TIME) values ('ADMIN', '超级管理员', 1, NOW(), NOW());
insert into SECURITY_DEFAULT_USER (NAME, LOGIN_NAME, STATUS, CREATE_TIME, LAST_MODIFY_TIME , SALT, PASSWORD) values ( '超级管理员', 'admin', 1, NOW(), NOW(), 'FD151D8B', 'IDcXAGcuCcEDmXK9Dy23AQ==');
insert into SECURITY_USER_TO_ROLE (USER_ID, ROLE_ID, CREATOR, CREATE_TIME) values  ((select id from SECURITY_DEFAULT_USER where login_name = 'admin'),  (select id from SECURITY_ROLE where code = 'ADMIN'), (select id from SECURITY_DEFAULT_USER where login_name = 'admin'),  NOW());
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('系统管理', 'SYSTEM_ALL', NOW(), NOW(), 0);
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('用户', 'USER_ADMIN', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'SYSTEM_ALL') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('角色', 'ROLE_ADMIN', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'SYSTEM_ALL') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('基础数据', 'BASIC_DATA', NOW(), NOW(), 0);
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('地区管理', 'AREA_ALL', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'BASIC_DATA') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('枚举值管理', 'ENUM_ALL', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'BASIC_DATA') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('接口管理', 'INTERFACE_ALL', NOW(), NOW(), 0);
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('接口配置', 'INTERFACE_CONFIG', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'INTERFACE_ALL') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('接口校验', 'INTERFACE_CHECK', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'INTERFACE_ALL') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('结果查询', 'RESULT_ALL', NOW(), NOW(), 0);
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('结果信息', 'RESULT_CHECK', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'RESULT_ALL') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('策略管理', 'POLICY_MANAGE', NOW(), NOW(),0);
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('定时任务', 'SCHEDULE_TASK', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'POLICY_MANAGE') b));
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('监控页面', 'MONITOR_ALL', NOW(), NOW(), 0);
insert into SECURITY_DEFAULT_PRIVILEGE (NAME, CODE, LAST_MODIFY_TIME, CREATE_TIME, PARENT_ID) values ('监控界面', 'MONITOR', NOW(), NOW(), (select id from (select a.id from SECURITY_DEFAULT_PRIVILEGE a where a.code = 'MONITOR_ALL') b));

INSERT INTO COMMON_ENUM (name,code,READ_ONLY) VALUES ('接口类型','interfaceType',1);
INSERT INTO COMMON_ENUM (name,code,READ_ONLY) VALUES ('平台类型','businessPlatform',1);

INSERT INTO SECURITY_ROLE_TO_PRIVILEGE (privilege_id, role_id,CREATOR) select p.id, r.id,0 from SECURITY_DEFAULT_PRIVILEGE p, SECURITY_ROLE r where r.code='ADMIN' ;
INSERT INTO OW_COMM_TASK_DEF (TYPECODE, NAME, CLASSNAME, PRIORITY) VALUES ('通知地市监控任务', '监控任务', 'com.sihuatech.task.CenterTimeTask', 1);
commit;