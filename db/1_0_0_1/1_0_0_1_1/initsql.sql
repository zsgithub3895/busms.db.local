DROP TABLE IF EXISTS `SECURITY_DEFAULT_PRIVILEGE`;
CREATE TABLE `SECURITY_DEFAULT_PRIVILEGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(256) DEFAULT NULL,
  `LAST_MODIFY_TIME` datetime DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `SECURITY_DEFAULT_USER`;
CREATE TABLE `SECURITY_DEFAULT_USER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `LOGIN_NAME` varchar(32) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_MODIFY_TIME` datetime DEFAULT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `SALT` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SYSTEM` varchar(32) DEFAULT NULL,
  `ADPROVIDERCODE` varchar(256) DEFAULT NULL,
  `CITYCODE` varchar(256) DEFAULT NULL, 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `SECURITY_ROLE`;
CREATE TABLE `SECURITY_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(32) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `SECURITY_ROLE_TO_PRIVILEGE`;
CREATE TABLE `SECURITY_ROLE_TO_PRIVILEGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRIVILEGE_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  `CREATOR` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `SECURITY_USER_TO_DOMAIN`;
CREATE TABLE `SECURITY_USER_TO_DOMAIN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `DOMAIN_ID` int(11) DEFAULT NULL,
  `CREATER` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `DOMAIN_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `SECURITY_USER_TO_ROLE`;
CREATE TABLE `SECURITY_USER_TO_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  `CREATOR` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `SECURITY_USERGROUP`;
CREATE TABLE `SECURITY_USERGROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `CODE` varchar(256) DEFAULT NULL,
  `CREATOR` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_MODIFY_TIME` datetime DEFAULT NULL,
  `SYSTEM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `SECURITY_USERGROUP_MAPPING`;
CREATE TABLE `SECURITY_USERGROUP_MAPPING` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `sub_user_id` int(11) DEFAULT NULL,
  `sub_usergroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `SECURITY_LOGIN_TOKEN`;
CREATE TABLE `SECURITY_LOGIN_TOKEN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(32) DEFAULT NULL,
  `SALT` varchar(32) DEFAULT NULL,
  `TOKEN_ENCRYPTED` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `T_OPERATE_LOG`;
CREATE TABLE `T_OPERATE_LOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATOR_ID` int(11) DEFAULT NULL COMMENT '操作者ID',
  `MODULE_NAME` varchar(256) DEFAULT NULL COMMENT '模块名称',
  `OPERATOR_TYPE` int(4) DEFAULT NULL COMMENT '操作类型',
  `IPADDRESS` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `OPERATION_TYPE` varchar(2048) DEFAULT NULL COMMENT '操作类型',
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table COMMON_ENUM  (
   ID                   int(18)                      not null AUTO_INCREMENT,
   NAME                 VARCHAR(255)                   not null comment '枚举值名称',
   CODE                 VARCHAR(64)                    not null comment '枚举值标识',
   DESCRIPTION          VARCHAR(1024)                  comment '说明',
   READ_ONLY            int(2)                      default 1 comment '是否只读 1 否 2 是',
   constraint PK_COMMON_ENUM primary key (ID),
   constraint AK_KEY_CODE_COMMON_E unique (CODE)
)DEFAULT CHARSET=utf8;

create table COMMON_ENUM_ITEM  (
   ID                   int(18)                      not null AUTO_INCREMENT,
   PARENT_ID            int(18)                      not null comment '父级id',
   ENUM_ID              int(18)                      not null comment '枚举ID',
   CODE                 VARCHAR(255)                   not null comment '标识',
   NAME                 VARCHAR(255)                   not null comment '名称',
   STATUS               int(2)                      default 1 not null comment '状态, 1: 正常 2:暂停 3:停止',
   DESCRIPTION          VARCHAR(1024)               comment '描述',
   SORT_INDEX           int(8)                      default 1 comment '排序索引',
   DEFAULT_SELECTED     int(2)                      default 1 comment '默认选中1:否,2:是',
   READ_ONLY            int(2)                      default 1 comment '是否只读 1否 2是',
   constraint PK_COMMON_ENUM_ITEM primary key (ID),
   constraint AK_KEY_2_COMMON_E unique (CODE, ENUM_ID,PARENT_ID)
)DEFAULT CHARSET=utf8;

/********************定时任务************************************************/
CREATE TABLE `OW_COMM_TASK` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TASKCODE` varchar(1024) NOT NULL,
  `GROUPNAME` varchar(1024) DEFAULT NULL,
  `OWNERID` int(12) DEFAULT NULL,
  `CREATEOPERATOR` int(12) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `DURATION` int(12) DEFAULT NULL COMMENT '最后一次运行的持续时间，单位秒',
  `RUN` int(2) DEFAULT NULL COMMENT '立即执行 0:否 1:是',
  `STARTDATE` date DEFAULT NULL,
  `EXPIREDATE` date DEFAULT NULL,
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `CRONSTRING` varchar(1024) NOT NULL COMMENT '时间设定， 和Cron规则一样',
  `LASTRUNTIME` datetime DEFAULT NULL,
  `LASTRUNSTATUS` int(2) DEFAULT NULL COMMENT '最后一次运行状态0：未运行过 1：开始运行 2；运行错误结束  3;运行正常结束',
  `SEQUENCE` int(12) DEFAULT NULL COMMENT '任务的序列号：反复运行的后台任务，SEQ自动加1',
  `DESCRIPTION` varchar(1024) DEFAULT NULL COMMENT '描述信息',
  `TASK_DEFID` int(12) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `OW_COMM_TASK_DEF` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TYPECODE` varchar(64) NOT NULL COMMENT 'Task类型,自定义',
  `NAME` varchar(256) DEFAULT NULL,
  `CLASSNAME` varchar(1024) DEFAULT NULL,
  `PRIORITY` int(2) DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPECODE` (`TYPECODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `OW_COMM_TASK_LOG` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TASKID` int(12) DEFAULT NULL,
  `TASKSEQUENCE` int(12) DEFAULT NULL,
  `STARTTIME` datetime DEFAULT NULL,
  `ENDTIME` datetime DEFAULT NULL,
  `STATUS` int(12) DEFAULT NULL COMMENT '状态  1: 执行中 2：执行正确结束 3：执行失败 4：部分失败',
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `OW_COMM_TASK_LOGDETAIL` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TASKID` int(12) DEFAULT NULL,
  `TASKSEQUENCE` int(12) DEFAULT NULL COMMENT '对应TaskLog表中的ID',
  `TASKLOGID` int(12) DEFAULT NULL COMMENT '日志的具体序列号，从0开始',
  `LOGSEQUENCE` int(12) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `OW_COMM_TASK_PARAM` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TASKID` int(12) DEFAULT NULL,
  `NAME` varchar(128) NOT NULL,
  `VALUE` varchar(4000) NOT NULL,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/********************************************************************/

CREATE TABLE `T_INTERFACE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '接口代码',
  `name` varchar(255) DEFAULT NULL COMMENT '接口名称',
  `businessPlatform` varchar(255) DEFAULT NULL COMMENT '业务平台',
  `type` varchar(255) DEFAULT NULL COMMENT '接口类型',
  `cityCode` varchar(255) DEFAULT NULL COMMENT '所属城市',
  `requestExam` varchar(2000) DEFAULT NULL COMMENT '接口请求样例',
  `strategyCode` varchar(100) DEFAULT NULL COMMENT '接口绑定验证策略',
  `taskId` int(11) DEFAULT NULL COMMENT '接口绑定定时任务',
  `protocol` varchar(255) DEFAULT NULL COMMENT '访问接口的方式',
  `url` varchar(255) DEFAULT NULL COMMENT '访问接口的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `T_MONITOR_HISTORY` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cityCode` varchar(255) DEFAULT NULL COMMENT '城市代码',
  `interfaceType` varchar(255) DEFAULT NULL COMMENT '接口类型',
  `sentTime` datetime DEFAULT NULL COMMENT '发送时间',
  `delay` bigint(10) DEFAULT NULL COMMENT '延迟时间',
  `respCorrect` int(10) DEFAULT NULL COMMENT '报文返回正确性',
  `interfaceCode` varchar(255) DEFAULT NULL COMMENT '接口代码',
  `interfaceName` varchar(255) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;



CREATE TABLE `T_CITY` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '城市名称',
  `code` varchar(200) DEFAULT NULL COMMENT '城市代码',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息',
  `postaddress` varchar(200) DEFAULT NULL COMMENT '通讯地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `T_MONITOR_STATUS` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cityCode` varchar(255) DEFAULT NULL COMMENT '城市代码',
  `delay` bigint(255) DEFAULT NULL COMMENT '延迟时间',
  `respCorrect` int(255) DEFAULT NULL COMMENT '报文返回正确性',
  `interfaceType` varchar(255) DEFAULT NULL COMMENT '接口类型',
  `interfaceName` varchar(255) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `T_OPERATION_LOG` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `OPERATORID` int(18) DEFAULT NULL COMMENT '操作人id',
  `OPERATORNAME` varchar(80) DEFAULT NULL COMMENT '操作人姓名',
  `OPERATORIP` varchar(128) DEFAULT NULL COMMENT '操作人ip',
  `DESCRIPTION` varchar(1024) DEFAULT NULL COMMENT '增、删、改等操作说明及描述',
  `OPERATIONTYPE` int(5) DEFAULT NULL COMMENT '操作类型 枚举值:1,首页;2,用户管理;3,角色管理;4,榜单指数;5,效果评估;6,枚举值管理',
  `OPERATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='日志表';

CREATE TABLE `T_CHECK` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strategyname` varchar(100) DEFAULT NULL COMMENT '策略名字',
  `strategycode` varchar(100) DEFAULT NULL COMMENT '策略CODE',
  `ckeckcode` varchar(100) DEFAULT NULL COMMENT '匹配节点',
  `interfacetype` varchar(100) DEFAULT NULL COMMENT '接口类型',
  `checkrule` varchar(100) DEFAULT NULL COMMENT '匹配规则',
  `rulevalue` varchar(100) DEFAULT NULL COMMENT '匹配值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
