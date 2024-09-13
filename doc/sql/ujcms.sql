/*
 Navicat Premium Dump SQL

 Source Server         : mysql.root
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : 127.0.0.1:3306
 Source Schema         : ujcms

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 13/09/2024 18:11:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('batch.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('eventsubscription.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.8.1.0)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.8.1.0', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.8.1.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_` ASC, `ACT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_` ASC, `ACT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_` ASC, `REF_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_` ASC, `ROOT_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_SUPER_PROCINST`(`SUPER_PROCESS_INSTANCE_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PRIORITY_` int NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_tsk_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_` ASC, `VAR_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.8.1.0', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_` ASC, `VERSION_` ASC, `DERIVED_VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_` ASC, `ACT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_` ASC, `ACT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_TASK`(`TASK_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_` ASC, `REF_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_` ASC, `ROOT_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_` ASC) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_SCOPEREF_`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int NULL DEFAULT NULL,
  `TASK_COUNT_` int NULL DEFAULT NULL,
  `JOB_COUNT_` int NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int NULL DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int NULL DEFAULT NULL,
  `VAR_COUNT_` int NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_` ASC) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EXEC_REF_ID_`(`REFERENCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_external_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_external_job`;
CREATE TABLE `act_ru_external_job`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_EJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_external_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PRIORITY_` int NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint NULL DEFAULT NULL,
  `VAR_COUNT_` int NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_DUEDATE`(`DUEDATE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('1657513930480-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 1, 'EXECUTED', '8:7aec773ceafb63f79369922c207b3538', 'createTable tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 2, 'EXECUTED', '8:44cf4cb6f0396350a3553c21b6e55391', 'createTable tableName=ujcms_article_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 3, 'EXECUTED', '8:d074ce6f9ac2be6ace557f4348ba602f', 'createTable tableName=ujcms_article_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-4', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 4, 'EXECUTED', '8:c4c5c07123d2a20e287f4c8fdeac9d30', 'createTable tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-5', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 5, 'EXECUTED', '8:d31cf73ae5d215ba8e72eedca75f13ab', 'createTable tableName=ujcms_article_file', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-6', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 6, 'EXECUTED', '8:066cf5fd94538227925a36fc3f2fa78f', 'createTable tableName=ujcms_article_image', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-7', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 7, 'EXECUTED', '8:17a44d5544b618991c57f31a80694b9d', 'createTable tableName=ujcms_article_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-8', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 8, 'EXECUTED', '8:60de499fb7463243cbc318c6f8182f61', 'createTable tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-9', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 9, 'EXECUTED', '8:ce4d8b6bbd29f999347076bd8311f0a8', 'createTable tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-10', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 10, 'EXECUTED', '8:d27971eceb08f17b777e02b30fbd4451', 'createTable tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-11', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:37', 11, 'EXECUTED', '8:08c36b9e2926a6dc620d7eefc020efbc', 'createTable tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-12', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 12, 'EXECUTED', '8:7df0e3ef07c326bec8ff7490345ef13b', 'createTable tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-13', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 13, 'EXECUTED', '8:a32b26e15531c3b1592479d32ecb0351', 'createTable tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-14', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 14, 'EXECUTED', '8:40b36091095d8cd02bdbd8cc202ac75d', 'createTable tableName=ujcms_channel_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-15', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 15, 'EXECUTED', '8:4726d1e91853af3e430535e5cd74c216', 'createTable tableName=ujcms_channel_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-16', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 16, 'EXECUTED', '8:a7ed02e89cfe174bf1884ad01630baa3', 'createTable tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-17', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 17, 'EXECUTED', '8:17fa1f8536ac25ddf775a49362d8fe2a', 'createTable tableName=ujcms_channel_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-18', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 18, 'EXECUTED', '8:3ce647147fecd1e0646ffc8614881da4', 'createTable tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-19', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 19, 'EXECUTED', '8:7f76eb67f5e7b5b9586a225226906291', 'createTable tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-20', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 20, 'EXECUTED', '8:4cea66ab20e1825cea08d093fd6f9a03', 'createTable tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-21', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 21, 'EXECUTED', '8:9ce1bc677ab9dae4a7b914012ef5dd75', 'createTable tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-22', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 22, 'EXECUTED', '8:44937ea20b427f80090c83e6b11c9e99', 'createTable tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-23', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 23, 'EXECUTED', '8:41aec87f49927d0d290969bc74d28d15', 'createTable tableName=ujcms_login_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-24', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 24, 'EXECUTED', '8:d46666d3bbc7fd2742fb5f91f37fe0a7', 'createTable tableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-25', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 25, 'EXECUTED', '8:e0433fc47fe85f207addb9bea2b22a10', 'createTable tableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-26', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 26, 'EXECUTED', '8:372569e397ee493eaa7333725ecc0552', 'createTable tableName=ujcms_org_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-27', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 27, 'EXECUTED', '8:c784f0897429b72d3f76d3fa532bab9b', 'createTable tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-28', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 28, 'EXECUTED', '8:a19a99d260df7cdf85f908597017d060', 'createTable tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-29', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 29, 'EXECUTED', '8:f3be1ea1ecefc45081ddca1e6023cc06', 'createTable tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-30', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 30, 'EXECUTED', '8:74014b0b1114bd69c0b61acb506310fa', 'createTable tableName=ujcms_seq', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-31', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 31, 'EXECUTED', '8:359598d1d60dbb7fb3f8330fbefb1ed1', 'createTable tableName=ujcms_short_message', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-32', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 32, 'EXECUTED', '8:19c0372904dc92124216dbd87d8716f4', 'createTable tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-33', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 33, 'EXECUTED', '8:c6fbfb1ec5634cd2856000d04668dbfb', 'createTable tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-34', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 34, 'EXECUTED', '8:9d3cd23640d1ca8606daaf11d5a0d148', 'createTable tableName=ujcms_site_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-35', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 35, 'EXECUTED', '8:fca82abea2fc8c9b4a5ec19bddd76938', 'createTable tableName=ujcms_site_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-36', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 36, 'EXECUTED', '8:0df51a2740220850319a63ced3d01f43', 'createTable tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-37', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 37, 'EXECUTED', '8:ca6c57f5ca396c09553706f76603b60b', 'createTable tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-38', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 38, 'EXECUTED', '8:99fa9df5d4f3286b9d825dfb6a46e1b0', 'createTable tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-39', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 39, 'EXECUTED', '8:1a379669d9ebea219b282e6d08f19959', 'createTable tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-40', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 40, 'EXECUTED', '8:b44b93abd8c89a0454f8b01195ee45c2', 'createTable tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-41', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 41, 'EXECUTED', '8:6543751c5f38eb00c066b0f001574119', 'createTable tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-42', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 42, 'EXECUTED', '8:7e39cd94e573a82039cc55acba70eb5c', 'addUniqueConstraint constraintName=idx_attachmentrefer_unique, tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-43', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 43, 'EXECUTED', '8:54e23238f9c1e74b0f775ed2d065ab87', 'addUniqueConstraint constraintName=uk_blockitem_block_article, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-44', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 44, 'EXECUTED', '8:d10bd6a538ed61a1198cf6fb1316c9e1', 'addUniqueConstraint constraintName=uk_channel_alias_site, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-45', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 45, 'EXECUTED', '8:b1b4df1544e9c1185ba73afa9f25161c', 'createIndex indexName=idx_aritcle_channel, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-46', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 46, 'EXECUTED', '8:978a2dd27fcec50caf2514a6b3934d6d', 'createIndex indexName=idx_article_org, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-47', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 47, 'EXECUTED', '8:3a57a47a7646a34fd49124979323bd96', 'createIndex indexName=idx_article_publish_date, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-48', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 48, 'EXECUTED', '8:bc12253ecdb4bd34f08ec877fa48ede1', 'createIndex indexName=idx_article_user, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-49', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 49, 'EXECUTED', '8:c11dede445b728b291e0170c6459cfb5', 'createIndex indexName=idx_article_user_modified, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-50', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:38', 50, 'EXECUTED', '8:461185c1d2255295b1cd8bc35c70012b', 'createIndex indexName=idx_article_website, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-51', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 51, 'EXECUTED', '8:d37fb1dc631b2d8f22242fc5097ed28b', 'createIndex indexName=idx_articlecustom_article, tableName=ujcms_article_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-52', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 52, 'EXECUTED', '8:16e91b0e10935e89bc73cafcc46d769b', 'createIndex indexName=idx_articlefile_article, tableName=ujcms_article_file', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-53', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 53, 'EXECUTED', '8:5da1e5ab825c7f871b015bc15840d83e', 'createIndex indexName=idx_articleimage_article, tableName=ujcms_article_image', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-54', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 54, 'EXECUTED', '8:b8fb1a57a6d5c8730a5859a7f70d2780', 'createIndex indexName=idx_articletag_composite, tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-55', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 55, 'EXECUTED', '8:36b4fbd5ab4a86586bcc0e06b9810501', 'createIndex indexName=idx_attachment_site, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-56', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 56, 'EXECUTED', '8:b0cb60445d876fe83c06d420863606d8', 'createIndex indexName=idx_attachment_user, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-57', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 57, 'EXECUTED', '8:42e37e2e461b650cfb5b7fd2deb19b4e', 'createIndex indexName=idx_attachmentrefer_type_id, tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-58', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 58, 'EXECUTED', '8:9b65028a796cb83565029c09777e62f6', 'createIndex indexName=idx_block_site, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-59', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 59, 'EXECUTED', '8:015c82f2b9d519724c6666de70516334', 'createIndex indexName=idx_blockitem_block, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-60', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 60, 'EXECUTED', '8:8a775778825990509864573116758289', 'createIndex indexName=idx_blockitem_site, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-61', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 61, 'EXECUTED', '8:c0b86402a5cec9e3ed2483a958f688bf', 'createIndex indexName=idx_channel_model_article, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-62', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 62, 'EXECUTED', '8:9d2de2dcd41b068aafb18231bbbec7ea', 'createIndex indexName=idx_channel_model_channel, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-63', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 63, 'EXECUTED', '8:e1e373dfe85775f48e21e85f97a00a11', 'createIndex indexName=idx_channel_order, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-64', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 64, 'EXECUTED', '8:a79a2402c25ac68d9f03fe4d0ef4d7c5', 'createIndex indexName=idx_channel_parent, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-65', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 65, 'EXECUTED', '8:b42c6e60087a7f8f2edb9f8690956250', 'createIndex indexName=idx_channel_site, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-66', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 66, 'EXECUTED', '8:992460d43fa36ee0cf1dbf20433c6205', 'createIndex indexName=idx_channelcustom_channel, tableName=ujcms_channel_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-67', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 67, 'EXECUTED', '8:2e048e40c1a48fe4235f30b908f5f2b1', 'createIndex indexName=idx_channeltree_composite, tableName=ujcms_channel_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-68', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 68, 'EXECUTED', '8:86caeefae729c7be596bf9eea4d559ea', 'createIndex indexName=idx_dict_dicttype, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-69', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 69, 'EXECUTED', '8:345e4149d9534cdb8fcee5180c36609b', 'createIndex indexName=idx_dict_parent, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-70', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 70, 'EXECUTED', '8:cbd51c7b2a45d6f1c405baa56aa78d8e', 'createIndex indexName=idx_dicttype_site, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-71', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 71, 'EXECUTED', '8:39b9ac6f49297d079231aa4d3d87e16a', 'createIndex indexName=idx_groupaccess_composite, tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-72', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 72, 'EXECUTED', '8:666144eaaebeff530e5ce6ef71d93c9f', 'createIndex indexName=idx_groupaccess_site, tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-73', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 73, 'EXECUTED', '8:7ec33601a904a449a00a4c9e1f4e6f99', 'createIndex indexName=idx_loginlog_user, tableName=ujcms_login_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-74', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 74, 'EXECUTED', '8:0d73bceb7d6a9712c7881f6d9c416409', 'createIndex indexName=idx_org_order, tableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-75', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 75, 'EXECUTED', '8:b96293ddd665387dc7e58b5afb077348', 'createIndex indexName=idx_org_parent, tableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-76', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 76, 'EXECUTED', '8:68b5b13d5c6693a57a09f5eafadc5701', 'createIndex indexName=idx_orgtree_composite, tableName=ujcms_org_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-77', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 77, 'EXECUTED', '8:369483b9fe1e0de0b8593eada6796c63', 'createIndex indexName=idx_push_article_from, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-78', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 78, 'EXECUTED', '8:3aae081f034d7c307d905380b40b13ef', 'createIndex indexName=idx_push_article_to, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-79', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 79, 'EXECUTED', '8:10300bda5e015555a498796ff320cb59', 'createIndex indexName=idx_push_site_from, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-80', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 80, 'EXECUTED', '8:d19a008372ecefc396cc99e68404542e', 'createIndex indexName=idx_push_site_to, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-81', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 81, 'EXECUTED', '8:d343ebb16dfe28acfb83ffad40ce3167', 'createIndex indexName=idx_push_user, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-82', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 82, 'EXECUTED', '8:3aa79399e21b89029052bd2b93e171f7', 'createIndex indexName=idx_role_site, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-83', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 83, 'EXECUTED', '8:cde856ea15acad72bfd58dc12ee77fe8', 'createIndex indexName=idx_rolearticle_composite, tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-84', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 84, 'EXECUTED', '8:63d84a1ba97bd021f5089e47c76c9542', 'createIndex indexName=idx_rolearticle_site, tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-85', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 85, 'EXECUTED', '8:ea03db031d8cdede5895ddcfc6067094', 'createIndex indexName=idx_site_model, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-86', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 86, 'EXECUTED', '8:280554ba8fea0c21b6b5461e664566bb', 'createIndex indexName=idx_site_order, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-87', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 87, 'EXECUTED', '8:a69a3ad57b102580873ccd7efe2510cc', 'createIndex indexName=idx_site_org, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-88', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 88, 'EXECUTED', '8:931bb6d16c8b92dd886eb0eec751098f', 'createIndex indexName=idx_site_parent, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-89', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 89, 'EXECUTED', '8:7f5d47e3dc8f196323f3023ad1517406', 'createIndex indexName=idx_sitecustom_site, tableName=ujcms_site_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-90', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 90, 'EXECUTED', '8:2744123bbcb354a788e1c185f8660c07', 'createIndex indexName=idx_sitetree_composite, tableName=ujcms_site_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-91', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 91, 'EXECUTED', '8:633b35df99be0bcf1440d8eddc6b0f5c', 'createIndex indexName=idx_tag_site, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-92', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 92, 'EXECUTED', '8:ca1a4357d3a3159d2b47276dfcd61a52', 'createIndex indexName=idx_tag_user, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-93', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 93, 'EXECUTED', '8:c0fc96c0e45fa54aea5c3e4d479addd3', 'createIndex indexName=idx_task_site, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-94', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 94, 'EXECUTED', '8:50062db81c8033bd2ba274c737713f8f', 'createIndex indexName=idx_task_user, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-95', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 95, 'EXECUTED', '8:a71ced8075084a2532416542c96b0a0f', 'createIndex indexName=idx_user_group, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-96', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 96, 'EXECUTED', '8:6e0628314b5dc7ea97acb460964402ca', 'createIndex indexName=idx_user_org, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-97', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 97, 'EXECUTED', '8:f6bc7f445a8bd72ba45d82d4615282c6', 'createIndex indexName=idx_userrole_composite, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-98', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 98, 'EXECUTED', '8:65ea15c23c6363fd25a3495344f96bcd', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-99', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 99, 'EXECUTED', '8:23064ad8890d74d944bf4794b311e8a3', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-100', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:39', 100, 'EXECUTED', '8:15dd7c8efd75ee882920bbbeed4f7417', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-101', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 101, 'EXECUTED', '8:611a81164ba6f067bee3b41ff071fdd2', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_user_modified, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-102', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 102, 'EXECUTED', '8:b86bc83d17cb1c1533655c9ea758ae0f', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_website, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-103', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 103, 'EXECUTED', '8:35218c94a26191d5f990a6db6063093e', 'addForeignKeyConstraint baseTableName=ujcms_article_buffer, constraintName=fk_articlebuffer_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-104', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 104, 'EXECUTED', '8:56b5bf7221f7606fb95f1f4a60f85726', 'addForeignKeyConstraint baseTableName=ujcms_article_custom, constraintName=fk_articlecustom_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-105', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 105, 'EXECUTED', '8:f17f75060becfb7e4d4f2f3c83dae821', 'addForeignKeyConstraint baseTableName=ujcms_article_ext, constraintName=fk_articleext_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-106', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 106, 'EXECUTED', '8:c465be97eeb5d96dce08cae35e83299a', 'addForeignKeyConstraint baseTableName=ujcms_article_file, constraintName=fk_articlefile_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-107', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 107, 'EXECUTED', '8:77f6d99e9d0df8e48403d9d9d0f6443b', 'addForeignKeyConstraint baseTableName=ujcms_article_image, constraintName=fk_articleimage_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-108', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 108, 'EXECUTED', '8:3010f7c6ae3a561acbd2dd1ba38e50bb', 'addForeignKeyConstraint baseTableName=ujcms_article_stat, constraintName=fk_articlestat_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-109', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 109, 'EXECUTED', '8:ec32c5fb039506c86ae7d8781f0d1e0d', 'addForeignKeyConstraint baseTableName=ujcms_article_tag, constraintName=fk_articletag_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-110', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 110, 'EXECUTED', '8:ea6d9eeb6f13407bbbfc7cf027cc1460', 'addForeignKeyConstraint baseTableName=ujcms_article_tag, constraintName=fk_articletag_tag, referencedTableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-111', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 111, 'EXECUTED', '8:379ede00ec0fc8d547de1dc75b1c02b0', 'addForeignKeyConstraint baseTableName=ujcms_attachment, constraintName=fk_attachment_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-112', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 112, 'EXECUTED', '8:32099cb3912cdaa0c25226f7b364f9d0', 'addForeignKeyConstraint baseTableName=ujcms_attachment, constraintName=fk_attachment_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-113', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 113, 'EXECUTED', '8:a746b79a99b4f978f3086bbf0e671996', 'addForeignKeyConstraint baseTableName=ujcms_attachment_refer, constraintName=fk_attachmentrefer_attachment, referencedTableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-114', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 114, 'EXECUTED', '8:9ca8a046da88f8b58e0b4a0be5879e25', 'addForeignKeyConstraint baseTableName=ujcms_block, constraintName=fk_block_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-115', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 115, 'EXECUTED', '8:f3a2a5f34f767e648fa3419f40665cd8', 'addForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-116', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 116, 'EXECUTED', '8:99483bf2fe331c5fbedcb0dc2dd315ce', 'addForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_block, referencedTableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-117', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 117, 'EXECUTED', '8:99fdc7d2032263cb0f097cf9daafe603', 'addForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-118', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 118, 'EXECUTED', '8:e42cb7fbdfa125106c2a5297d72b0114', 'addForeignKeyConstraint baseTableName=ujcms_channel_custom, constraintName=fk_channel_custom, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-119', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 119, 'EXECUTED', '8:1e614a6d5111d0e40a823b93da6d4e23', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_model_article, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-120', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:40', 120, 'EXECUTED', '8:86cd074ad4d4362fdcecd98983ee8e96', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_model_channel, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-121', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 121, 'EXECUTED', '8:a7e7d5558235167b3b52faa17e86126e', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_parent, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-122', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 122, 'EXECUTED', '8:529e03010d34734abe93df7927602a91', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-123', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 123, 'EXECUTED', '8:a8fff291e9a13d7cfc37c45c0f571b4d', 'addForeignKeyConstraint baseTableName=ujcms_channel_buffer, constraintName=fk_channelbuffer_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-124', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 124, 'EXECUTED', '8:cae8cd913dcc64c40a086ede59bcdbfb', 'addForeignKeyConstraint baseTableName=ujcms_channel_ext, constraintName=fk_channelext_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-125', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 125, 'EXECUTED', '8:2e08628ea0009171b46a28d9017b11dc', 'addForeignKeyConstraint baseTableName=ujcms_channel_tree, constraintName=fk_channeltree_ancestor, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-126', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 126, 'EXECUTED', '8:6361bfc11070e47043bc128e8ebac587', 'addForeignKeyConstraint baseTableName=ujcms_channel_tree, constraintName=fk_channeltree_descendant, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-127', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 127, 'EXECUTED', '8:1d445d5074ba1f90c34e81382fbc6128', 'addForeignKeyConstraint baseTableName=ujcms_dict, constraintName=fk_dict_dicttype, referencedTableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-128', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 128, 'EXECUTED', '8:54720fd73d3e612b5a026d0e6de85fd3', 'addForeignKeyConstraint baseTableName=ujcms_dict, constraintName=fk_dict_parent, referencedTableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-129', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 129, 'EXECUTED', '8:99af812a2e7804c66e7f4332acd1364f', 'addForeignKeyConstraint baseTableName=ujcms_dict_type, constraintName=fk_dicttype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-130', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 130, 'EXECUTED', '8:488adee3776724929d7a17e0b0467e43', 'addForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-131', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 131, 'EXECUTED', '8:849dbfeb17e4ad71591ed3a6d91b1091', 'addForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_group, referencedTableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-132', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 132, 'EXECUTED', '8:38643ff8b69ba872a7a4c09a50f5804c', 'addForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-133', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 133, 'EXECUTED', '8:e49d8e05b574cbf784101e657242cb8c', 'addForeignKeyConstraint baseTableName=ujcms_login_log, constraintName=fk_loginlog_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-134', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 134, 'EXECUTED', '8:82a2087616daf5abb3c9719c5f91cec2', 'addForeignKeyConstraint baseTableName=ujcms_org, constraintName=fk_org_parent, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-135', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 135, 'EXECUTED', '8:fe21a3586660f9e9a29f3c452f2c9bdc', 'addForeignKeyConstraint baseTableName=ujcms_org_tree, constraintName=fk_orgtree_ancestor, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-136', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 136, 'EXECUTED', '8:cb4c764694ecab7ab3667a6d20250916', 'addForeignKeyConstraint baseTableName=ujcms_org_tree, constraintName=fk_orgtree_descendant, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-137', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 137, 'EXECUTED', '8:6c9e17974a7484f76df78172b8bc4e6b', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_article_from, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-138', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 138, 'EXECUTED', '8:cee0ef3abe402ca762a7725ef5e8ec9d', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_article_to, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-139', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 139, 'EXECUTED', '8:0a5a2214112241226c7da7b4bd70b769', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_site_from, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-140', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 140, 'EXECUTED', '8:d20da6260206c1ba8e1444fe636c2e4c', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_site_to, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-141', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 141, 'EXECUTED', '8:ea9d85e9137ffaf77fe702305bf2edb2', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-142', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:41', 142, 'EXECUTED', '8:e72083786268e25d78524e7226acd675', 'addForeignKeyConstraint baseTableName=ujcms_role, constraintName=fk_role_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-143', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 143, 'EXECUTED', '8:f5bef1fb7da1a52af9edaf84bb85f62d', 'addForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-144', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 144, 'EXECUTED', '8:300b018342788cb2ca194018f90fb4ca', 'addForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-145', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 145, 'EXECUTED', '8:a10fcd99ec27947bcd0456e86f7781bb', 'addForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-146', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 146, 'EXECUTED', '8:53cb0f2cc10544427bbb5e0551d21eaf', 'addForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_model, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-147', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 147, 'EXECUTED', '8:3fe66e5b8677a415b07980db0a53f605', 'addForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-148', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 148, 'EXECUTED', '8:ea49f37fc880e3c069d51271c6d9515e', 'addForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_parent, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-149', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 149, 'EXECUTED', '8:04e5fa00f47f6f59fb4c16a7e8038042', 'addForeignKeyConstraint baseTableName=ujcms_site_buffer, constraintName=fk_sitebuffer_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-150', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 150, 'EXECUTED', '8:fdc872f9af3687ed313569ba6a105924', 'addForeignKeyConstraint baseTableName=ujcms_site_custom, constraintName=fk_sitecustom_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-151', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 151, 'EXECUTED', '8:2ee7d881cb27a1b1214e7bf771da1fbe', 'addForeignKeyConstraint baseTableName=ujcms_site_tree, constraintName=fk_sitetree_ancestor, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-152', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 152, 'EXECUTED', '8:3b80625257cbfd4f45512c0168173280', 'addForeignKeyConstraint baseTableName=ujcms_site_tree, constraintName=fk_sitetree_descendant, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-153', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 153, 'EXECUTED', '8:1fa44af6ffe1c71f79dbce1b4d850aeb', 'addForeignKeyConstraint baseTableName=ujcms_tag, constraintName=fk_tag_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-154', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 154, 'EXECUTED', '8:bc421aa556dae9a7debd667cab82bec7', 'addForeignKeyConstraint baseTableName=ujcms_tag, constraintName=fk_tag_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-155', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 155, 'EXECUTED', '8:aef8626dc135c9b43fe2612f4e6573db', 'addForeignKeyConstraint baseTableName=ujcms_task, constraintName=fk_task_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-156', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 156, 'EXECUTED', '8:25bba2d8a8e9631ed4628dc532729f9c', 'addForeignKeyConstraint baseTableName=ujcms_task, constraintName=fk_task_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-157', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 157, 'EXECUTED', '8:2b7114f9315397b596bfb6729d97643c', 'addForeignKeyConstraint baseTableName=ujcms_user, constraintName=fk_user_group, referencedTableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-158', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 158, 'EXECUTED', '8:f6615b34348b9d6bfd22bc6a5f241ff5', 'addForeignKeyConstraint baseTableName=ujcms_user, constraintName=fk_user_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-159', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 159, 'EXECUTED', '8:0d8e2426676619569969e4b1ecc81b0b', 'addForeignKeyConstraint baseTableName=ujcms_user_ext, constraintName=fk_userext_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-160', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 160, 'EXECUTED', '8:09b208548138f4f252c6df5660466f9a', 'addForeignKeyConstraint baseTableName=ujcms_user_openid, constraintName=fk_useropenid_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-161', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:42', 161, 'EXECUTED', '8:663005336304df0441fbab615a02e0c4', 'addForeignKeyConstraint baseTableName=ujcms_user_role, constraintName=fk_userrole_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657513930480-162', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 162, 'EXECUTED', '8:fbba1312f211f73b6b4a5ec42b7ff63e', 'addForeignKeyConstraint baseTableName=ujcms_user_role, constraintName=fk_userrole_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('4.0', 'PROJECT-VERSION', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 163, 'EXECUTED', '8:6d11a12b628b1bd2688c80f07104b319', 'tagDatabase', '', 'v4.0', '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657965976692-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 164, 'EXECUTED', '8:708b8cf81e6cba2579dc3a44e81dc3d2', 'addColumn tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1657965976692-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 165, 'EXECUTED', '8:9e75eb1df03e8970e9e44c3aece91f98', 'addColumn tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659243550780-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 166, 'EXECUTED', '8:3af9f98b3e07e920ab93d99ab693bcfa', 'dropColumn columnName=salt_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659452795561-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 167, 'EXECUTED', '8:faa40f331687bf6d9a07e9093e1811e9', 'createTable tableName=persistent_logins', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659591275832-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 168, 'EXECUTED', '8:10b81a8c5092bdb1852495367548055d', 'modifyDataType columnName=password_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659937075569-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 169, 'EXECUTED', '8:385e3ac64939f52d03746915e61a34a7', 'addNotNullConstraint columnName=password_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 170, 'EXECUTED', '8:6751d46dd25d00a19f33bd668fcb3128', 'createTable tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 171, 'EXECUTED', '8:d055ad42bf9395a666619e837af2be65', 'createIndex indexName=idx_messageboard_site, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 172, 'EXECUTED', '8:b25bb2b903ec7dc6e7b5039c26463f1b', 'createIndex indexName=idx_messageboard_user, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-4', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 173, 'EXECUTED', '8:8b92968ecd608b01d5c89b4e0d16cf79', 'createIndex indexName=idx_messageboard_user_reply, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-5', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 174, 'EXECUTED', '8:a80ae602d2ef951cdfd9a4e9155399bf', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-6', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 175, 'EXECUTED', '8:deb237164f1a499d494c189404473dac', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1659969332576-7', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 176, 'EXECUTED', '8:bd598f5d2c8fefdf9cdd16be316b0fb8', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_user_reply, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1660037619910-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 177, 'EXECUTED', '8:f586c4bc14706f3fcc2c813634ed6a62', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661272274423-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 178, 'EXECUTED', '8:eca313402a679bc5fe247db72d078c05', 'modifyDataType columnName=attempts_, tableName=ujcms_short_message', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661272274423-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 179, 'EXECUTED', '8:2f13914b2a7cb4ee34a920c1214e799d', 'modifyDataType columnName=email_settings_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661272500856-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 180, 'EXECUTED', '8:34e7281e1b3004a0f98b6d2fea366544', 'addNotNullConstraint columnName=attempts_, tableName=ujcms_short_message', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410164675-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 181, 'EXECUTED', '8:9e20cb112aa2cb818341434876e9aaec', 'createTable tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410164675-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 182, 'EXECUTED', '8:2627124756fe0142d3e2a0cb200d2fc5', 'createIndex indexName=idx_rolechanel_composite, tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410164675-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 183, 'EXECUTED', '8:270f81cda0722ba185735472c19c14c5', 'createIndex indexName=idx_rolechannel_site, tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410164675-4', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 184, 'EXECUTED', '8:0515d65bf5f627bc4d434a0df46b7d2b', 'addForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410164675-5', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 185, 'EXECUTED', '8:81eb988ad14dc57670ba4129cef1d323', 'addForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410164675-6', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 186, 'EXECUTED', '8:c0fa55c2525b0b366627cabfc000402e', 'addForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410770807-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 187, 'EXECUTED', '8:72ec36642914166f53825959d92afee3', 'addColumn tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1661410770807-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 188, 'EXECUTED', '8:aa20f24c137b652aa6a3bb0783880a9f', 'addDefaultValue columnName=all_article_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1662087477623-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 189, 'EXECUTED', '8:b73b182fe62cff41a1497abea592a4ec', 'modifyDataType columnName=phone_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1665233967058-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:43', 190, 'EXECUTED', '8:0e2ed364c63e442628a9390d36ccdaae', 'modifyDataType columnName=login_ip_, tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666001569711-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 191, 'EXECUTED', '8:58a7a661ffe9742dbb7ff8a8b8cba92a', 'addColumn tableName=ujcms_article_image', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666001569711-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 192, 'EXECUTED', '8:71b2482dd86de799e8a13850e10e0d1e', 'dropNotNullConstraint columnName=description_, tableName=ujcms_article_image', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666001569711-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 193, 'EXECUTED', '8:4dd32958046d4f5f629f29d41d6ca81e', 'addColumn tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 194, 'EXECUTED', '8:94bfb3d51cb5c5af43d4cd2454a2e9fb', 'createTable tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 195, 'EXECUTED', '8:4521fcee455f640f09c97c096dd479b7', 'createTable tableName=ujcms_operation_log_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 196, 'EXECUTED', '8:e4214e2337a991a85f360cd562da08b9', 'createIndex indexName=idx_operationlog_site, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-4', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 197, 'EXECUTED', '8:15828188deaf739a6ab1a3354dbaa136', 'createIndex indexName=idx_operationlog_user, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-5', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 198, 'EXECUTED', '8:f48a599eba32f0f881ece585c16724ac', 'addForeignKeyConstraint baseTableName=ujcms_operation_log, constraintName=fk_operationlog_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-6', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 199, 'EXECUTED', '8:e7e59fa2f8d287a8bec74fb1dacdd9b3', 'addForeignKeyConstraint baseTableName=ujcms_operation_log, constraintName=fk_operationlog_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666077601180-7', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 200, 'EXECUTED', '8:7a77c059d63b5c158dfcb9742bedef37', 'addForeignKeyConstraint baseTableName=ujcms_operation_log_ext, constraintName=fk_operationlogext_log, referencedTableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666850212015-4', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 201, 'EXECUTED', '8:b92d97779b969d29b6e26de85098c845', 'addColumn tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666850212015-5', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 202, 'EXECUTED', '8:aa8dfe80b8f9f8880bd7bf56f8dad346', 'addColumn tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666850212015-6', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 203, 'EXECUTED', '8:33082afeb528c8d12334df6937260a09', 'addColumn tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1666850212015-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 204, 'EXECUTED', '8:20aa16e3e0e8a1eef9ae2b641ce586fa', 'addDefaultValue columnName=with_mobile_image_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1667639127624-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 205, 'EXECUTED', '8:83173696790c5e4b4e6d632071710ff2', 'modifyDataType columnName=security_settings_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1668778968007-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 206, 'EXECUTED', '8:dc2c4fec7e9ff580119fa97db3a5d6cc', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1668778968007-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 207, 'EXECUTED', '8:cd1207f27014b5cf44859ee000241256', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1669960437926-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 208, 'EXECUTED', '8:a03bf54ee495d599a3833770e1395c30', 'addColumn tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1669960437926-2', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 209, 'EXECUTED', '8:afd7f5d61b411b6377f172233bf538db', 'addColumn tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1669960437926-3', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 210, 'EXECUTED', '8:0dafa123b129b26a0ad50b7d614c7880', 'dropColumn columnName=display_name_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1669960437926-4', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 211, 'EXECUTED', '8:4d0b8cb189801d4b03ea5b572a4c29bf', 'dropColumn columnName=display_name_, tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1671620264241-1', 'PONY (generated)', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 212, 'EXECUTED', '8:6b8e7e740f9e809ac6a055d375141cc7', 'dropColumn columnName=unionid_, tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('5.5', 'PROJECT-VERSION', '/db/changelog/db.changelog-4.0-whole.yaml', '2024-09-13 17:27:44', 213, 'EXECUTED', '8:a4de786de6321fd58ed76adc1e583146', 'tagDatabase', '', 'v5.5', '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673708062494-1', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 214, 'EXECUTED', '8:6850e6b6d38f50d757fb7fff41c4ab8e', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673708062494-3', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 215, 'EXECUTED', '8:ef5f04bd17cfbbd379dc72be0af61ae8', 'createIndex indexName=idx_article_src, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673708062494-4', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 216, 'EXECUTED', '8:901cec089c773fe2dc39908ab008f818', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_src, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-1', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 217, 'EXECUTED', '8:535f1ca8368be06917bf7698c8492d35', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-2', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 218, 'EXECUTED', '8:cb5ff02081f6b61b4723953a574b0016', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-3', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 219, 'EXECUTED', '8:0a35a872bc750647f687336cdf10561d', 'dropForeignKeyConstraint baseTableName=ujcms_article_file, constraintName=fk_articlefile_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-4', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 220, 'EXECUTED', '8:0f832473f71c37a9f5a48e240803829d', 'dropForeignKeyConstraint baseTableName=ujcms_article_image, constraintName=fk_articleimage_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-5', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 221, 'EXECUTED', '8:c30e6793812f89250c4f0b65b231bd77', 'dropTable tableName=ujcms_article_file', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-6', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 222, 'EXECUTED', '8:6778a5cd7612d71032eebed11f771bc4', 'dropTable tableName=ujcms_article_image', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1673791836036-7', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 223, 'EXECUTED', '8:d75fc285bbd150e29cf85e77569c2b3c', 'dropColumn columnName=type_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1678982467157-2', 'PONY (generated)', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 224, 'EXECUTED', '8:9cb4b9de3674b6ef8630b35ae896dc36', 'modifyDataType columnName=upload_settings_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('6.0', 'PROJECT-VERSION', '/db/changelog/db.changelog-6.0.yaml', '2024-09-13 17:27:44', 225, 'EXECUTED', '8:f3159c1fa0cf1d68fbcc978bd7a8e765', 'tagDatabase', '', 'v6.0', '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-3', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 226, 'EXECUTED', '8:2cf1fba27a9400c3de437933cb37fc5b', 'createTable tableName=ujcms_global', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-4', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 227, 'EXECUTED', '8:41b14b415cc70a528d98b73d943d8b60', 'addColumn tableName=ujcms_channel_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-5', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 228, 'EXECUTED', '8:32a87d88754436b8a792928be2b193cd', 'addColumn tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-6', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 229, 'EXECUTED', '8:1e93f49bedba00d2de64aa45d17c8e50', 'addColumn tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-7', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 230, 'EXECUTED', '8:6b29bc87045d62c1187121689642b30a', 'addColumn tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-8', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 231, 'EXECUTED', '8:b9bad1da4f4b6139ce5416ba6c2dbbf0', 'addColumn tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-9', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 232, 'EXECUTED', '8:122df148039e494c7b69c38e85907da2', 'addColumn tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-10', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 233, 'EXECUTED', '8:9f5be22f31ec5697c1f1dc2d026ee29e', 'dropForeignKeyConstraint baseTableName=ujcms_article_stat, constraintName=fk_articlestat_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-11', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 234, 'EXECUTED', '8:8a81bcdc578046e3a49f3e5eae216874', 'dropTable tableName=ujcms_article_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682691725814-12', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 235, 'EXECUTED', '8:3b2d9de0f0bda111f033f6d0ee31a13b', 'dropColumn columnName=stat_day_, tableName=ujcms_article_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682692262471-1-sql', 'PONY', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 236, 'EXECUTED', '8:d2b44e6fa3a2c38c822cd1f62859515c', 'update tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682692262471-2-sql', 'PONY', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 237, 'EXECUTED', '8:2118461869668163731c1e3daff1d3dd', 'update tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682692262472-2', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 238, 'EXECUTED', '8:edc1aa9e55bb37ac90ebe4143cc75792', 'addNotNullConstraint columnName=modified_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1682692262472-4', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 239, 'EXECUTED', '8:f41d7f58099d7e38d6f79f55eb480d57', 'addNotNullConstraint columnName=modified_user_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684209496186-1-changes', 'PONY', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 240, 'EXECUTED', '8:1564c2874ccb1ce2f8ffcb8cf185dcd2', 'renameColumn newColumnName=gender2_, oldColumnName=gender_, tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684209496186-2-changes', 'PONY', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 241, 'EXECUTED', '8:7b09364fb1682828208ca1c8aa5ac793', 'renameColumn newColumnName=gender2_, oldColumnName=gender_, tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684210936367-9', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 242, 'EXECUTED', '8:cc61c35efb731749d2c74cb65f549534', 'addColumn tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684210936367-10', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 243, 'EXECUTED', '8:ad125790a1c3d47c5bda6f6ae597b4f9', 'addColumn tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684210936368-1-sql', 'PONY', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 244, 'EXECUTED', '8:c2e572c9f4deb4e4f8fd346ff214c9f9', 'update tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684210936368-2-sql', 'PONY', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 245, 'EXECUTED', '8:3397d0d22062b13e4b3c3efd0f3cd285', 'update tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684211719554-5', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 246, 'EXECUTED', '8:2bf3796ac6951d586c87afd51d0f1581', 'dropColumn columnName=gender2_, tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684211719554-6', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 247, 'EXECUTED', '8:bc4ba038803e7f637141c1d0aae1f61d', 'dropColumn columnName=gender2_, tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-1', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 248, 'EXECUTED', '8:f5b24d7aea7bdd0de100acc85f395398', 'modifyDataType columnName=all_access_permission_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-2', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 249, 'EXECUTED', '8:50305a916b242c51d5f8462e392d89f8', 'addDefaultValue columnName=all_access_permission_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-3', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 250, 'EXECUTED', '8:d2b21e34593f2d47e7f4318dd34ffef0', 'modifyDataType columnName=all_article_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-4', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 251, 'EXECUTED', '8:6865c8026a25fe6d21814b4c5c948711', 'addDefaultValue columnName=all_article_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-5', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 252, 'EXECUTED', '8:f4368a12a282c939a3601fce1a2b04f1', 'modifyDataType columnName=all_channel_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-6', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 253, 'EXECUTED', '8:ea198f9d3129692a68dd350e06ba43aa', 'addDefaultValue columnName=all_channel_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-7', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 254, 'EXECUTED', '8:e89c0d06b7eba265a6d940c9548d7a6b', 'modifyDataType columnName=all_grant_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-8', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 255, 'EXECUTED', '8:6aada445865e6f93e0677bc83d732ae7', 'addDefaultValue columnName=all_grant_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-9', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 256, 'EXECUTED', '8:218fe8fc275c600790b195dbf8a98d3b', 'modifyDataType columnName=all_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-10', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 257, 'EXECUTED', '8:9a03a437b9eb50ca26fcb63d6c7fa4ea', 'addDefaultValue columnName=all_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-11', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 258, 'EXECUTED', '8:6ccf965f3804fd38b5b09a191de1650a', 'modifyDataType columnName=allow_comment_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-12', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 259, 'EXECUTED', '8:deab8021a40ba9351ea84910660916c0', 'addDefaultValue columnName=allow_comment_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-13', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 260, 'EXECUTED', '8:54ca3ea93f89ed2b95b778684a5f21f8', 'modifyDataType columnName=allow_comment_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-14', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 261, 'EXECUTED', '8:5db365eb52eddfc5b9b831da60750bbd', 'addDefaultValue columnName=allow_comment_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-15', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 262, 'EXECUTED', '8:5578c01b283a50aebbbf19d4318f6dd3', 'modifyDataType columnName=allow_contribute_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-16', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:45', 263, 'EXECUTED', '8:b04c6dbc4ae3a97acb153ca1b172eb12', 'addDefaultValue columnName=allow_contribute_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-17', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 264, 'EXECUTED', '8:b598dadf6032f9e246722b9a08d3aca5', 'modifyDataType columnName=allow_search_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-18', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 265, 'EXECUTED', '8:1fa6c311127026ccca6201a6256aea61', 'addDefaultValue columnName=allow_search_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-19', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 266, 'EXECUTED', '8:eb3c7f3fc4d9dd61fe91ef0612d432dd', 'modifyDataType columnName=audit_, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-20', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 267, 'EXECUTED', '8:a13e4e4531e5dc1e01799f43f220e53d', 'addDefaultValue columnName=audit_, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-21', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 268, 'EXECUTED', '8:42c992ac9ef9eafe87fe96a958270552', 'modifyDataType columnName=baidu_push_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-22', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 269, 'EXECUTED', '8:76c9a3a514ef20a96c57ec13e81aa74e', 'addDefaultValue columnName=baidu_push_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-23', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 270, 'EXECUTED', '8:e142c8c73402fb356e38d3118e37a6bd', 'modifyDataType columnName=description_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-24', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 271, 'EXECUTED', '8:fd2ea455a0a83353dae10d74da823bd4', 'addDefaultValue columnName=description_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-25', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 272, 'EXECUTED', '8:740cf53a1600420a95f8d7a1feb954e9', 'modifyDataType columnName=enabled_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-26', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 273, 'EXECUTED', '8:407c942646d502ebce5f50eb49d66652', 'addDefaultValue columnName=enabled_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-27', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 274, 'EXECUTED', '8:7aeb1a17fd44c5e71ec9e1b2300e3712', 'modifyDataType columnName=enabled_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-28', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 275, 'EXECUTED', '8:3c268f54fed26501e2c74c4f04d642a5', 'addDefaultValue columnName=enabled_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-29', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 276, 'EXECUTED', '8:1170886d74daede2f3fdc561dfb41135', 'modifyDataType columnName=enabled_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-30', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 277, 'EXECUTED', '8:6edf107a3b167bb8b2abe2efbb87537c', 'addDefaultValue columnName=enabled_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-31', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 278, 'EXECUTED', '8:01ebadadd3289d6ea89498b6fd180477', 'modifyDataType columnName=global_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-32', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 279, 'EXECUTED', '8:79ef1d2dda71d2cd43c95a24a8739684', 'addDefaultValue columnName=global_permission_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-33', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 280, 'EXECUTED', '8:48115e8478adc043122babe0ab40f4d2', 'modifyDataType columnName=image_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-34', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 281, 'EXECUTED', '8:74f49a35be2b2763f21c04abcb45de8a', 'addDefaultValue columnName=image_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-35', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 282, 'EXECUTED', '8:8cf56d3ca23aac3eef9414527f0ec900', 'modifyDataType columnName=link_url_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-36', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 283, 'EXECUTED', '8:1c6160e1e149a2406ab24c3fb8d72b00', 'addDefaultValue columnName=link_url_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-37', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 284, 'EXECUTED', '8:defcf2120b974050d83ff9b2fdf2b254', 'modifyDataType columnName=mobile_image_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-38', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 285, 'EXECUTED', '8:b2fe8a269865cb7d1e3d858f478d086a', 'addDefaultValue columnName=mobile_image_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-39', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 286, 'EXECUTED', '8:4818bc5f931a24ceb090784aa8005fb5', 'modifyDataType columnName=multi_domain_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-40', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 287, 'EXECUTED', '8:eca7546ecdd97e388aa12c3cfce0c102', 'addDefaultValue columnName=multi_domain_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-41', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 288, 'EXECUTED', '8:023892566ba406a110893f220e3b0eae', 'modifyDataType columnName=nav_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-42', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 289, 'EXECUTED', '8:1d663e596ce1fe3221149ef11a7d961a', 'addDefaultValue columnName=nav_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-45', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 290, 'EXECUTED', '8:6e2fcf4f43e929e6f268ad7881fe9b01', 'modifyDataType columnName=open_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-46', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:46', 291, 'EXECUTED', '8:67385739bf3f3e7d3aa8090048d9eec8', 'addDefaultValue columnName=open_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-47', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 292, 'EXECUTED', '8:9b5867737862d0d22c00936b32ad1d99', 'modifyDataType columnName=recommendable_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-48', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 293, 'EXECUTED', '8:147ea573f8462b85fc33a82fc0cfc172', 'addDefaultValue columnName=recommendable_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-49', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 294, 'EXECUTED', '8:60dc420a6ab885c9facd20fdb827b62a', 'modifyDataType columnName=recommended_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-50', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 295, 'EXECUTED', '8:83d4adcf96be639c7700f8c5bb98daa4', 'addDefaultValue columnName=recommended_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-51', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 296, 'EXECUTED', '8:e496126fca1879767fe7d982a402dfd4', 'modifyDataType columnName=replied_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-52', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 297, 'EXECUTED', '8:2ff812df5ac86fc4d283efc1a9eec9c7', 'addDefaultValue columnName=replied_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-53', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 298, 'EXECUTED', '8:408e3429369fbba2c5398d3532f58854', 'modifyDataType columnName=subtitle_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-54', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 299, 'EXECUTED', '8:527ec573c5bab2c8e23e35c2a2c90527', 'addDefaultValue columnName=subtitle_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-55', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 300, 'EXECUTED', '8:aa60c46d3ffa0984e30d0d514ad7ce0a', 'modifyDataType columnName=sys_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-56', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 301, 'EXECUTED', '8:f23fdbd87477105c6ed79cb6829711f7', 'addDefaultValue columnName=sys_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-57', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 302, 'EXECUTED', '8:e3d553d21aba16d4bfc5c9a2a2305925', 'modifyDataType columnName=sys_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-58', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 303, 'EXECUTED', '8:b157ed2f01608653eefeee43b42a8c31', 'addDefaultValue columnName=sys_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-59', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 304, 'EXECUTED', '8:c60e64070d3e0d801de244e70417c567', 'modifyDataType columnName=target_blank_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-60', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 305, 'EXECUTED', '8:fd6a1101446ac6a37cf826774c021cf8', 'addDefaultValue columnName=target_blank_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-61', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 306, 'EXECUTED', '8:f1436170f434c84cbcc7713c501fd5cf', 'modifyDataType columnName=target_blank_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-62', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 307, 'EXECUTED', '8:0f4f4e2ddf3a1f2c5210b3627769eeb0', 'addDefaultValue columnName=target_blank_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-63', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 308, 'EXECUTED', '8:8c060822df35109fbc45154b19501d55', 'modifyDataType columnName=target_blank_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-64', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 309, 'EXECUTED', '8:5ae07b480d2bde86a472cf46aa8c0de1', 'addDefaultValue columnName=target_blank_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-65', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 310, 'EXECUTED', '8:327715c8789e756db6f5fb9f707fb44c', 'modifyDataType columnName=used_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-66', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 311, 'EXECUTED', '8:201b8f44fa74d5f0b465a193190260a7', 'addDefaultValue columnName=used_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-67', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 312, 'EXECUTED', '8:7149cb06dc7a1816ed6069d7b355ecd8', 'modifyDataType columnName=video_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-68', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 313, 'EXECUTED', '8:307cbb54bba73630e9f71a0e745b53ea', 'addDefaultValue columnName=video_required_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-69', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 314, 'EXECUTED', '8:e52c897ad5f68f7e51981cb6e3693f7f', 'modifyDataType columnName=with_description_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-70', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 315, 'EXECUTED', '8:ec8279c83a6a360cb2a576e3c884a366', 'addDefaultValue columnName=with_description_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-71', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 316, 'EXECUTED', '8:ba30abdd93501ef3015ceb1b0bb55bf3', 'modifyDataType columnName=with_image_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-72', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 317, 'EXECUTED', '8:3c79e14c4750604d8445dcd814a8a1ce', 'addDefaultValue columnName=with_image_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-73', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 318, 'EXECUTED', '8:fe8d5bbe7fbf51351cda21c72b15f164', 'modifyDataType columnName=with_image_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-74', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:47', 319, 'EXECUTED', '8:bf31b8503256108a047d4751ecca98b3', 'addDefaultValue columnName=with_image_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-75', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 320, 'EXECUTED', '8:9ecf38ac5d9f4b14e23653d5d5a2e081', 'modifyDataType columnName=with_link_url_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-76', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 321, 'EXECUTED', '8:817ecb7dbc59f2fe6d60c412cac9457e', 'addDefaultValue columnName=with_link_url_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-77', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 322, 'EXECUTED', '8:b9673579e74f255a3d940cb663ffb68a', 'modifyDataType columnName=with_mobile_image_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-78', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 323, 'EXECUTED', '8:ef500e50b9a7eb961ddd227aeab703c4', 'addDefaultValue columnName=with_mobile_image_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-79', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 324, 'EXECUTED', '8:e768a0697cdd20fe48ea87d9fd6f5c93', 'modifyDataType columnName=with_subtitle_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-80', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 325, 'EXECUTED', '8:1acf892232b5689c69b80e1403956b76', 'addDefaultValue columnName=with_subtitle_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-81', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 326, 'EXECUTED', '8:55062e0bd1b3395d2eb8519ddd765e72', 'modifyDataType columnName=with_video_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684213908126-82', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 327, 'EXECUTED', '8:0837d4fb6d0966e7b44997b4c67a17fd', 'addDefaultValue columnName=with_video_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-1', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 328, 'EXECUTED', '8:45035b1fc68fe7ff0e33e40d5591cd0a', 'createTable tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-2', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 329, 'EXECUTED', '8:db93ac2d38e6fddf21a9766f070294f4', 'createTable tableName=ujcms_visit_page', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-3', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 330, 'EXECUTED', '8:fbf95db7504a7f43fee91953024a2496', 'createTable tableName=ujcms_visit_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-4', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 331, 'EXECUTED', '8:120b95ea439a4debfeef88b83484b18d', 'createTable tableName=ujcms_visit_trend', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-5', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 332, 'EXECUTED', '8:870bfda21487fbbafc11b569f10eb68b', 'createIndex indexName=idx_visit_log_site, tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-6', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 333, 'EXECUTED', '8:5ce4d7f5fe610bab9a0bc36def14665b', 'createIndex indexName=idx_visit_log_user, tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-7', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 334, 'EXECUTED', '8:bc02376fcd5ff6f9e2e91072d2dffc5d', 'createIndex indexName=idx_visit_page_site, tableName=ujcms_visit_page', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-8', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 335, 'EXECUTED', '8:c7e41923db388e4047b29f7e7ebfebb6', 'createIndex indexName=idx_visit_stat_site, tableName=ujcms_visit_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-9', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 336, 'EXECUTED', '8:d5bc75789b682db830f3adb1f3416a49', 'createIndex indexName=idx_visit_trend_site, tableName=ujcms_visit_trend', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-10', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 337, 'EXECUTED', '8:ae9a5b0ff41cf5c9557677664b57eaa9', 'addForeignKeyConstraint baseTableName=ujcms_visit_log, constraintName=fk_visit_log_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-11', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 338, 'EXECUTED', '8:eb33e77a4ba1a74148d43698a2b8e495', 'addForeignKeyConstraint baseTableName=ujcms_visit_log, constraintName=fk_visit_log_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-12', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 339, 'EXECUTED', '8:c21f4e47e4fcf93036d0fd6ab17d286e', 'addForeignKeyConstraint baseTableName=ujcms_visit_page, constraintName=fk_visit_page_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-13', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 340, 'EXECUTED', '8:2a9c103901c9dc624dfaf04913f319e8', 'addForeignKeyConstraint baseTableName=ujcms_visit_stat, constraintName=fk_visit_stat_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1684832752757-14', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 341, 'EXECUTED', '8:2824f8708477349a3d452c2c6e3408f4', 'addForeignKeyConstraint baseTableName=ujcms_visit_trend, constraintName=fk_visit_trend_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1686021500192-1', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 342, 'EXECUTED', '8:54753149cb59efc7800e34711c7d6292', 'addColumn tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1686021500192-2', 'PONY (generated)', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 343, 'EXECUTED', '8:2f6c4709ffa8618510846b865626e99d', 'addColumn tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('7.0', 'PROJECT-VERSION', '/db/changelog/db.changelog-7.0.yaml', '2024-09-13 17:27:48', 344, 'EXECUTED', '8:8e744c664fc342e9934df19fde92c981', 'tagDatabase', '', 'v7.0', '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1686732952061-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 345, 'EXECUTED', '8:a5cc8dc5e9d94a1ee004f0a1333d5e28', 'createTable tableName=ujcms_error_word', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1686732952061-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 346, 'EXECUTED', '8:ad8c838f68043dbb55e84bb769038319', 'createTable tableName=ujcms_sensitive_word', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738001791-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 347, 'EXECUTED', '8:dcaf367f4b9f1bc6473b8aae57b8ace5', 'createTable tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738001791-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 348, 'EXECUTED', '8:76cd0d651ed7c07a14f3f242bf296d1d', 'createTable tableName=ujcms_vote_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738001791-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 349, 'EXECUTED', '8:1042e5c6c074717c37ba644c9e32fa01', 'createIndex indexName=idx_vote_site, tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738001791-4', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 350, 'EXECUTED', '8:6d02d98da99ac039e38d92e8d3e85d8e', 'createIndex indexName=idx_voteoption_vote, tableName=ujcms_vote_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738001791-5', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:48', 351, 'EXECUTED', '8:b536aa3b4f7a1deccc7c02e0f2864c24', 'addForeignKeyConstraint baseTableName=ujcms_vote, constraintName=fk_vote_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738001791-6', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 352, 'EXECUTED', '8:6686dbbb6ea056d86b46cad7326f82d8', 'addForeignKeyConstraint baseTableName=ujcms_vote_option, constraintName=fk_voteoption_vote, referencedTableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 353, 'EXECUTED', '8:41ff07b05fc95d72dff42081f7573363', 'createTable tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 354, 'EXECUTED', '8:80276ffe2d30e0a0a299b869815f8e9e', 'createTable tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 355, 'EXECUTED', '8:11b20d8836831595b683db825a7cf7ec', 'createTable tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-7', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 356, 'EXECUTED', '8:9ba6cb264245c6fe4564405456c3bbeb', 'createIndex indexName=idx_survey_site, tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-8', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 357, 'EXECUTED', '8:eda4b4840cc04118002a5ca2e0dd728a', 'createIndex indexName=idx_surveyitem_site, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-9', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 358, 'EXECUTED', '8:a4d7f84b7e592f56895874d339ad03e8', 'createIndex indexName=idx_surveyitem_survey, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-10', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 359, 'EXECUTED', '8:84809a0f7520d79ca1e5e68ee524c692', 'addForeignKeyConstraint baseTableName=ujcms_survey, constraintName=fk_survey_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-11', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 360, 'EXECUTED', '8:4dbcfc0db4423e9bb98c05b0d01c027c', 'addForeignKeyConstraint baseTableName=ujcms_survey_item, constraintName=fk_surveyitem_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-12', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 361, 'EXECUTED', '8:66c9842c244d24a3d7c2f8b0b6e5b074', 'addForeignKeyConstraint baseTableName=ujcms_survey_item, constraintName=fk_surveyitem_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-13', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 362, 'EXECUTED', '8:9c18a36285dfc3a2ca36f0f68081c329', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-14', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 363, 'EXECUTED', '8:5d7a5c06d7f4b51fe1aa8b79cbde9296', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689738319551-15', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 364, 'EXECUTED', '8:b9f829bf9d3768011bf1cd5c55e333ed', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689837792675-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 365, 'EXECUTED', '8:1caf7fb2d936c3b405d6b455b9250e47', 'createTable tableName=ujcms_action', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689837792675-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 366, 'EXECUTED', '8:2a686b28bc5c7ff20f35cb552f0c028d', 'createIndex indexName=idx_action_site, tableName=ujcms_action', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689837792675-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 367, 'EXECUTED', '8:b78495465c4fcb55d2d520731271d01d', 'createIndex indexName=idx_action_user, tableName=ujcms_action', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689837792675-4', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 368, 'EXECUTED', '8:c693bf129a7d61dba1a56f8e4d977f78', 'addForeignKeyConstraint baseTableName=ujcms_action, constraintName=fk_action_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1689837792675-5', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 369, 'EXECUTED', '8:4aef1903ed0d6a78de9104d2f1671531', 'addForeignKeyConstraint baseTableName=ujcms_action, constraintName=fk_action_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 370, 'EXECUTED', '8:ea4a8b996bf1caf4f31342c6b2e6f16f', 'createTable tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 371, 'EXECUTED', '8:7692b2f26761e163886f98f0a489d268', 'createTable tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 372, 'EXECUTED', '8:c890c366d0168ede1160be0bb4ba7c25', 'createTable tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-4', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 373, 'EXECUTED', '8:216290075caf8bb8bfa434f684aae58c', 'createIndex indexName=idx_surveyfeedback_site, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-5', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 374, 'EXECUTED', '8:b00a8717de97f2216714c43e1f385190', 'createIndex indexName=idx_surveyfeedback_survey, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-6', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 375, 'EXECUTED', '8:36cdf8ebc3264e750adbc6b0850525cf', 'createIndex indexName=idx_surveyfeedback_user, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-7', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 376, 'EXECUTED', '8:aa83a996f79cd52d1426974769b215ca', 'createIndex indexName=idx_surveyitemfeed_feed, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-8', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 377, 'EXECUTED', '8:4de88e77b7d399684c382bcc72f09170', 'createIndex indexName=idx_surveyitemfeed_item, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-9', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 378, 'EXECUTED', '8:84d50df3a558ed766f3ae4c7a0651e53', 'createIndex indexName=idx_surveyitemfeed_survey, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-10', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 379, 'EXECUTED', '8:5070fd5438f828bda00f3ee0cac69461', 'createIndex indexName=idx_surveyoptionfeed_feed, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-11', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:49', 380, 'EXECUTED', '8:27719219bf76659473c6b13390baf551', 'createIndex indexName=idx_surveyoptionfeed_item, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-12', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 381, 'EXECUTED', '8:3b516259c7705d581c4a44efdef52606', 'createIndex indexName=idx_surveyoptionfeed_option, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-13', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 382, 'EXECUTED', '8:eebc683e4ad5ea1928da5a342da41e83', 'createIndex indexName=idx_surveyoptionfeed_survey, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-14', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 383, 'EXECUTED', '8:ef311618c69cf366df653d3269b4603b', 'addForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-15', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 384, 'EXECUTED', '8:2615d4d07a37b5eafdbeed82bd6b7569', 'addForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-16', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 385, 'EXECUTED', '8:877f30bcb63ded2e256ed6304db3ba36', 'addForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-17', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 386, 'EXECUTED', '8:ec76e717b768e7c9cc546a43941b8f02', 'addForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_feed, referencedTableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-18', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 387, 'EXECUTED', '8:f35a69c7ef95c891e07f16bea262a469', 'addForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-19', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 388, 'EXECUTED', '8:b46d9489cbccc5ad0374cb93645cc248', 'addForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-20', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 389, 'EXECUTED', '8:23f2fa36f9901089d4bb93bba8d9e928', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_feed, referencedTableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-21', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 390, 'EXECUTED', '8:01d656c6929d70297af3856c09e84c02', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-22', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 391, 'EXECUTED', '8:529ce6def9971b72a60862697783f03e', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_option, referencedTableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690638757689-23', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 392, 'EXECUTED', '8:b1a3cb2f3252dfd8f6cecef66007c29d', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690945769388-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 393, 'EXECUTED', '8:e31d0986adb9e4251f66a42bb9226355', 'dropColumn columnName=place_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690945769388-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 394, 'EXECUTED', '8:3f5c34ba834017bd6e272f1ef25d4417', 'dropColumn columnName=user_type_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1690947802354-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 395, 'EXECUTED', '8:be85a2b2b04ea4ca77e358ddecdac30c', 'dropColumn columnName=profession_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1691295938978-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 396, 'EXECUTED', '8:dff193fa8269826ae05a82ad6e030c62', 'addColumn tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1691380534562-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 397, 'EXECUTED', '8:a409206957cb1a99af5521ff645f7c84', 'addColumn tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1691380534562-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 398, 'EXECUTED', '8:18c4afdbe548c640122fbde680199124', 'addColumn tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1691729970999-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 399, 'EXECUTED', '8:330496789dab4b457f2786ac4e4a20b5', 'createTable tableName=ujcms_example', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692501829341-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 400, 'EXECUTED', '8:d30920cf4c864434840dd5ca441d7e86', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692501829341-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 401, 'EXECUTED', '8:1f828dbef601b42dacdab1dfa39c42c6', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692501829341-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 402, 'EXECUTED', '8:8d5fcc003afc36cdd805b95303a68f9f', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692501829342-1-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 403, 'EXECUTED', '8:307912cced318116794cec73fe974b98', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692501829342-2-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 404, 'EXECUTED', '8:c947c5a47c767ec98176e4b44bff67c9', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692501829342-3-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 405, 'EXECUTED', '8:62d6ef7d478079504c785bdd9974c9d8', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692503932912-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 406, 'EXECUTED', '8:79a768282e2bf29d3440a10dfc2f7e73', 'dropColumn columnName=image_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692503932912-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 407, 'EXECUTED', '8:6652c66db243effa9702facc2d55445e', 'dropColumn columnName=link_url_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692503932912-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:50', 408, 'EXECUTED', '8:74d378c3d549e0b75498b97f1be7a8c2', 'dropColumn columnName=target_blank_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678197817-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 409, 'EXECUTED', '8:2e99c63511a9876b74d20d1dce60c2f6', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678197817-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 410, 'EXECUTED', '8:a15b528d76b09bd5b9727f938b7b9438', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678197818-1-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 411, 'EXECUTED', '8:fa8ffd5df44ef0ea127a1015a6828f1c', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678197818-2-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 412, 'EXECUTED', '8:e2d2bde725281e68bcd86e4b583bf069', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678599742-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 413, 'EXECUTED', '8:34269ffe0a4acbb3f726cb649aa306f8', 'dropColumn columnName=article_template_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678599742-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 414, 'EXECUTED', '8:d2d95e4e4ec197a5627fdae9173041f6', 'dropColumn columnName=channel_template_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1692678599743-1-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 415, 'EXECUTED', '8:2c7f63e3284138b9d276a260c54b8da3', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1693018299934-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 416, 'EXECUTED', '8:952636977f5d7697808a3098bd1d8d60', 'addColumn tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1693018299934-3', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 417, 'EXECUTED', '8:c35f0f45ad1b893188dd27efcab72bd6', 'addColumn tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1693018299935-1-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 418, 'EXECUTED', '8:a10a36c824cee8303ae82345e5769e6c', 'update tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1693018299935-2-sql', 'PONY', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 419, 'EXECUTED', '8:a893855bfd27dbb995bfb1fbf66c77c2', 'update tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1693019033702-1', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 420, 'EXECUTED', '8:98887a768b5c4fb5b8bdc454acb46191', 'dropColumn columnName=gender_, tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1693019033702-2', 'PONY (generated)', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 421, 'EXECUTED', '8:2e4f732776f842051b15c475208dbe80', 'dropColumn columnName=real_name_, tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('8.0', 'PROJECT-VERSION', '/db/changelog/db.changelog-8.0.yaml', '2024-09-13 17:27:51', 422, 'EXECUTED', '8:11fe07fa180673987409e7142dc7df44', 'tagDatabase', '', 'v8.0', '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696255120396-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:51', 423, 'EXECUTED', '8:a364b5321b1ad4767d34e943e7d6e056', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696740992905-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 424, 'EXECUTED', '8:38f6062f60df6b0106044564a5f6f113', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696740992906-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 425, 'EXECUTED', '8:e2dfcad5afdd90aa32b7ea47b958a014', 'update tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696741922530-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 426, 'EXECUTED', '8:082d81fb08d4b074dcdb5abc3afdd2a7', 'createIndex indexName=idx_article_order, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696741922530-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 427, 'EXECUTED', '8:0fb6329dc813aab8d1a28026efde9db0', 'addNotNullConstraint columnName=order_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696838891143-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 428, 'EXECUTED', '8:7a91153ea70a2e2e6999ae61390e8ba1', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696838891143-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 429, 'EXECUTED', '8:3bce20494a54f3f7542cd8bd6aedee51', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696838891143-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 430, 'EXECUTED', '8:fb053f3e7b023072bf3ed4502b8e1bd5', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696839283179-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 431, 'EXECUTED', '8:06bfac3fa2d4dbaf21503e40c58afee8', 'createIndex indexName=idx_surveyoption_item, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696839283179-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 432, 'EXECUTED', '8:03a893e46c493e1e0a4e96e82109622d', 'createIndex indexName=idx_surveyoption_site, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696839283179-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 433, 'EXECUTED', '8:25ab2b558fb791003f0a908ec6113d90', 'createIndex indexName=idx_surveyoption_survey, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696839283179-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:52', 434, 'EXECUTED', '8:9c18a36285dfc3a2ca36f0f68081c329', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696839283179-5', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 435, 'EXECUTED', '8:5d7a5c06d7f4b51fe1aa8b79cbde9296', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696839283179-6', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 436, 'EXECUTED', '8:b9f829bf9d3768011bf1cd5c55e333ed', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696840721931-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 437, 'EXECUTED', '8:f1c1964c8d7dba36d07442eda71a341b', 'addColumn tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696934804450-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 438, 'EXECUTED', '8:09522f82fb3d9f6861e2e40a03a20c53', 'createTable tableName=ujcms_message_board_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696934804450-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 439, 'EXECUTED', '8:9c2a7ca1a52200ae8fd5a509027d44f3', 'createIndex indexName=idx_messageboardtype_site, tableName=ujcms_message_board_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696934804450-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 440, 'EXECUTED', '8:8d6b75d0e75d6afdb18ba15c7250114c', 'addForeignKeyConstraint baseTableName=ujcms_message_board_type, constraintName=fk_messageboardtype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696936608891-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:53', 441, 'EXECUTED', '8:74d7a08d74ed01a22c628eaf85f87af7', 'createIndex indexName=idx_messageboard_type, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696936608891-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 442, 'EXECUTED', '8:0373269cced7a4562bd2bc6fbd539afa', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_type, referencedTableName=ujcms_message_board_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696936608892-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 443, 'EXECUTED', '8:2c6c8330bb22f992a70f7da7a3fddd7e', 'delete tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1696936608892-2-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 444, 'EXECUTED', '8:f040eae3e589270b730ce4133dd2764d', 'delete tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698830814959-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 445, 'EXECUTED', '8:b2804b00518ab4a255ecfa6654ef4e9f', 'modifyDataType columnName=name_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698831755259-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 446, 'EXECUTED', '8:24c3b8a39c3b3e1f02e9d1f88464bfba', 'addNotNullConstraint columnName=name_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348567-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 447, 'EXECUTED', '8:2dac70598158f47298a9e7ad3ebe3ce0', 'createTable tableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348567-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 448, 'EXECUTED', '8:a2163ec5aa1754a60ca3aeb6656f162e', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348567-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 449, 'EXECUTED', '8:e2dfbcd5dd0a77a38afd1ccebd5f608e', 'createIndex indexName=idx_channel_performance_type, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348567-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:54', 450, 'EXECUTED', '8:d7d4f34507bd63284360147282dff981', 'createIndex indexName=idx_performancetype_site, tableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348567-5', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 451, 'EXECUTED', '8:022c3bc9b680444df778ba3872f9975d', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_performance_type, referencedTableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348567-6', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 452, 'EXECUTED', '8:dad92df1f9a28aa67c0f27e0aab6ba73', 'addForeignKeyConstraint baseTableName=ujcms_performance_type, constraintName=fk_performancetype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1698832348568-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 453, 'EXECUTED', '8:86280f53f843db22d15b3c178cd25eba', 'update tableName=DATABASECHANGELOG', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1700802019080-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 454, 'EXECUTED', '8:b665d98a5b62312ccc985307065d8194', 'addColumn tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701247563114-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 455, 'EXECUTED', '8:0b43ac3aeef2527ce720dda4e322b615', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701247563114-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 456, 'EXECUTED', '8:d79ddebf85ab4828f2a24e39cda16f19', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701247563114-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 457, 'EXECUTED', '8:17332463605cf8f1781786618ae9978a', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701247563114-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 458, 'EXECUTED', '8:97021c76aad84c03b766aa806b7aa954', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701247563115-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 459, 'EXECUTED', '8:0acd403825576391b6fab51357e1d3bc', 'update tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701248645085-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 460, 'EXECUTED', '8:b8b58b2d7cbc7a28b8c1dad17c1197cc', 'dropColumn columnName=created_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701248645085-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:55', 461, 'EXECUTED', '8:955bb1097eb56085f9f8b185fa8999d8', 'dropColumn columnName=modified_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701248645085-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 462, 'EXECUTED', '8:f02542015d276dd007d31a58816447ab', 'dropColumn columnName=offline_date_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701248645085-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 463, 'EXECUTED', '8:fed46aef816dbe0111a82a75b8f1e5ab', 'dropColumn columnName=sticky_date_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 464, 'EXECUTED', '8:9d188646f82a63fb56a6156c151d8297', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 465, 'EXECUTED', '8:cf9823132fb83ea3505db3c029e4d26c', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 466, 'EXECUTED', '8:8dc791c0532f2cdfe5b74da151d8ead2', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 467, 'EXECUTED', '8:a00a47b2970a24cdbc8b694d0ea5936a', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-5', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 468, 'EXECUTED', '8:58df4203448dd5e61295b45db357b62a', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-6', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 469, 'EXECUTED', '8:d348b210596df2648fac8ae05d96e1b9', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400042-7', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 470, 'EXECUTED', '8:d0ad24048525f8728956ac0ed13ec83a', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597400043-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 471, 'EXECUTED', '8:409b637318d173e7647a7576cc2047b0', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 472, 'EXECUTED', '8:2870dacf6b843c27c5e38c422ff1f86d', 'dropColumn columnName=allow_comment_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:56', 473, 'EXECUTED', '8:47e844f08a8f02410afe304978ca0fc2', 'dropColumn columnName=allow_contribute_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 474, 'EXECUTED', '8:1cbc03698e6192dca77b03db6c3d829f', 'dropColumn columnName=allow_search_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 475, 'EXECUTED', '8:7ef448fcf0fe49b7e6778e876a14e824', 'dropColumn columnName=created_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-5', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 476, 'EXECUTED', '8:7b386bbfa1b1f01c88576e0a25ddc77d', 'dropColumn columnName=modified_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-6', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 477, 'EXECUTED', '8:a414b4d11fc8975c7d03c56c17e8ee66', 'dropColumn columnName=order_desc_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701597799038-7', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 478, 'EXECUTED', '8:8d60369a9b9185c301b8a347b93d1363', 'dropColumn columnName=page_size_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 479, 'EXECUTED', '8:382ceaff31d17ea7cde08cd426457500', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 480, 'EXECUTED', '8:f22850502450442726a0c8a83c30655c', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 481, 'EXECUTED', '8:a2fc60358a4edc0b5048891485448e3b', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 482, 'EXECUTED', '8:8d9a55792d416048107290ad991f6f3c', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-5', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 483, 'EXECUTED', '8:2aa5767c1157eb2fbbc9e87c268e4362', 'addColumn tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-6', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 484, 'EXECUTED', '8:5a84985752feee7a740ec1f179fcb9c8', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-7', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 485, 'EXECUTED', '8:5d70be68405e2ddf0c3ed9049bcb18a8', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249593-8', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 486, 'EXECUTED', '8:33a546c5428643ada7d4c34004c0ec1d', 'addColumn tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249594-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 487, 'EXECUTED', '8:3c12bd2f5683906abffc300febfead81', 'update tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680249594-2-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 488, 'EXECUTED', '8:cbee52c908d89e8086e18a62641760b2', 'update tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680914657-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 489, 'EXECUTED', '8:6d548db4f9fd247b1ac9967f3ab80263', 'dropForeignKeyConstraint baseTableName=ujcms_channel_buffer, constraintName=fk_channelbuffer_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680914657-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 490, 'EXECUTED', '8:e8d653c8d74ac98013065d3bf087b195', 'dropForeignKeyConstraint baseTableName=ujcms_site_buffer, constraintName=fk_sitebuffer_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680914657-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 491, 'EXECUTED', '8:be1f670a2260d4c635849db02108b432', 'dropTable tableName=ujcms_channel_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701680914657-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 492, 'EXECUTED', '8:0525bee47bce0fe4c4929b4d5e260d90', 'dropTable tableName=ujcms_site_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 493, 'EXECUTED', '8:8948b3d23ab3505aaf083cf259a843c3', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 494, 'EXECUTED', '8:1907136b5066f614d79ab104e7e0eabd', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-3', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 495, 'EXECUTED', '8:e69628a391d601c34d242e0a03d5421f', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-4', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:57', 496, 'EXECUTED', '8:0b9b92222dc8dea5fba415deff6c465c', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-5', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 497, 'EXECUTED', '8:fe673cec5d16bc3f53bf02323d3a0f4f', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-6', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 498, 'EXECUTED', '8:dc90f4357a1a1f20a8d1cf317a5696b4', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-7', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 499, 'EXECUTED', '8:5233881852d06b4a3c4e99baf4843308', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-8', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 500, 'EXECUTED', '8:f61e4647284752e74599560a0fbea539', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-9', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 501, 'EXECUTED', '8:9d3544cfb58ea207cf82b61be5ef2b38', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-10', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 502, 'EXECUTED', '8:f58ec85c43fc57612385d2cf54f68133', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-11', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 503, 'EXECUTED', '8:392882e3b9c8f65bf8f419558946cd34', 'addColumn tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682230934-1-sql', 'PONY', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 504, 'EXECUTED', '8:e25b5ba58c15b7da8f862ac430efdb0a', 'update tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682894156-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 505, 'EXECUTED', '8:6c7669784fc56d556acfa2a689bea48e', 'dropForeignKeyConstraint baseTableName=ujcms_article_buffer, constraintName=fk_articlebuffer_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1701682894156-2', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 506, 'EXECUTED', '8:29a5aeaaa6dac9c312afcb1705209b25', 'dropTable tableName=ujcms_article_buffer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1702444486049-1', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 507, 'EXECUTED', '8:416941d05898d349bc7b1c77ed4b63c9', 'addColumn tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1705651238012-8', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 508, 'EXECUTED', '8:d0f27fb8a1b1ab7fea6bb6e45e89bfa6', 'dropNotNullConstraint columnName=password_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1705651238012-9', 'PONY (generated)', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 509, 'EXECUTED', '8:05e2c14264336d9c1a872e783145c227', 'dropDefaultValue columnName=password_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('9.0', 'PROJECT-VERSION', '/db/changelog/db.changelog-9.0.yaml', '2024-09-13 17:27:58', 510, 'EXECUTED', '8:2193e22beb6788534f1768f559ec97bb', 'tagDatabase', '', 'v9.0', '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('quartz-init', 'quartz', 'db/changelog/liquibase.quartz.init.xml', '2024-09-13 17:27:59', 511, 'EXECUTED', '8:f5f78c1bfd491a4ad2e2cf6481524c7b', 'createTable tableName=QRTZ_LOCKS; addPrimaryKey tableName=QRTZ_LOCKS; createTable tableName=QRTZ_FIRED_TRIGGERS; addPrimaryKey tableName=QRTZ_FIRED_TRIGGERS; createIndex indexName=IDX_QRTZ_FT_INST_JOB_REQ_RCVRY, tableName=QRTZ_FIRED_TRIGGERS; crea...', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-1-mysql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 512, 'EXECUTED', '8:029b7bb11ad222d237f292f50f360cae', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-1-postgresql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 513, 'EXECUTED', '8:f57f5efb2100ef687c67f1589acb271b', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-1-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 514, 'EXECUTED', '8:4b62155a692ad525f65cb95b3e1b811e', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-2-mysql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 515, 'EXECUTED', '8:bd9287563168d99e979b6f6adcfa5c7f', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-2-postgresql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 516, 'EXECUTED', '8:0a9b224b5fd794cd29c5068a823e0aea', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-2-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 517, 'EXECUTED', '8:40678844364e3fc8c4ba4f3c49757eb5', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-3-mysql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 518, 'EXECUTED', '8:8adee3012e7e03f26c75eb39dcd904be', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-3-postgresql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 519, 'EXECUTED', '8:a2b05768d18684152da3954570ca7fdd', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-3-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 520, 'EXECUTED', '8:2212bfd3707d24823a3a867e55cc0577', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-4-mysql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 521, 'EXECUTED', '8:0602e91340eb70a33fa86067c5b011ce', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-4-postgresql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 522, 'EXECUTED', '8:72f00a36d3ffaf7973897919698a6e2f', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-5-dm', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 523, 'EXECUTED', '8:326f2bffbaaf13e318e7eebad6c6677a', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-5-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 524, 'EXECUTED', '8:af0a2adf2fec2860e960d9959bd05a30', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-5-mysql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 525, 'EXECUTED', '8:75c1870c9b06ad659cca9493510b77cc', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1704355636091-5-postgresql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:27:59', 526, 'EXECUTED', '8:391e1c46a7339350fed58d6d317bc134', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706368220753-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 527, 'EXECUTED', '8:626dff54030641d876bcc7344445ce10', 'dropForeignKeyConstraint baseTableName=ujcms_article_custom, constraintName=fk_articlecustom_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706368220753-5', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 528, 'EXECUTED', '8:e878301533de9b02448d27bbd1fb435f', 'dropForeignKeyConstraint baseTableName=ujcms_channel_custom, constraintName=fk_channel_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706368220753-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 529, 'EXECUTED', '8:e37c864f09245928db152868c4086691', 'dropForeignKeyConstraint baseTableName=ujcms_site_custom, constraintName=fk_sitecustom_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706368220753-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 530, 'EXECUTED', '8:d6ba518865f6600cc4a017549616dd70', 'dropTable tableName=ujcms_article_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706368220753-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 531, 'EXECUTED', '8:90c830406f017783aad183b88d2445ef', 'dropTable tableName=ujcms_channel_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706368220753-9', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 532, 'EXECUTED', '8:d6d14a265588f59907c89af0c881b3fc', 'dropTable tableName=ujcms_site_custom', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706345176653-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 533, 'EXECUTED', '8:1276a7dd39c4c636b1f3fea8133d0f74', 'addColumn tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1706345176654-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 534, 'EXECUTED', '8:c3bc105ec509f617aecb18412731682c', 'dropDefaultValue columnName=order_, tableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 535, 'EXECUTED', '8:6f47081eebd45335b49a3b5e40b1b7d8', 'createTable tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 536, 'EXECUTED', '8:374f3e7221219d3872a6121e4fbb8fa5', 'createTable tableName=ujcms_form_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 537, 'EXECUTED', '8:aef3d36239ca82d5157d2f8722999544', 'createTable tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 538, 'EXECUTED', '8:813cd23411b83798a59a6b321b927cf7', 'createIndex indexName=idx_form_org, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-5', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 539, 'EXECUTED', '8:4688a6f5bf7ff01013bee1d2d8da5029', 'createIndex indexName=idx_form_site, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 540, 'EXECUTED', '8:d49d6c2c49662cd340be15c923c7fae9', 'createIndex indexName=idx_form_type, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 541, 'EXECUTED', '8:a7b8e061ae4c6d321c8d57c04bb4bf55', 'createIndex indexName=idx_form_user, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 542, 'EXECUTED', '8:3cb711ccb5e41f708e8b93d87200d787', 'createIndex indexName=idx_form_user_modified, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-9', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 543, 'EXECUTED', '8:82328a3b81846021bde5faa05399f355', 'createIndex indexName=idx_formtype_model, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-10', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 544, 'EXECUTED', '8:3bce7d0bf5a866c6d4a90835e1815a6e', 'createIndex indexName=idx_formtype_site, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-11', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 545, 'EXECUTED', '8:aa6005857eef7deebd6d04ef70d27831', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-12', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 546, 'EXECUTED', '8:6900818a2c54b9d78123417c302e7966', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-13', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 547, 'EXECUTED', '8:f4197f43b08e22186ebfb7f4adc7d9ee', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_type, referencedTableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-14', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 548, 'EXECUTED', '8:b73fb4ab546502ec053d1bd07bc7a937', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-15', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 549, 'EXECUTED', '8:671b8032492608c29568290b27c219ee', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_user_modified, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-16', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 550, 'EXECUTED', '8:2eb78c3cdc551940b65bcac245b41b90', 'addForeignKeyConstraint baseTableName=ujcms_form_ext, constraintName=fk_formext_form, referencedTableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-17', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 551, 'EXECUTED', '8:e591244eb5c40955eab4b9363bbf7eeb', 'addForeignKeyConstraint baseTableName=ujcms_form_type, constraintName=fk_formtype_model, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133652820-18', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 552, 'EXECUTED', '8:ce727ac119a2f2e86d56575b46ffc7f0', 'addForeignKeyConstraint baseTableName=ujcms_form_type, constraintName=fk_formtype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709133653000-1-sql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 553, 'EXECUTED', '8:49e2118bf4d36b453351081f8b714b79', 'update tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 554, 'EXECUTED', '8:7971f838a12fc332f0aec5a9adb75e1e', 'createTable tableName=ujcms_org_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:00', 555, 'EXECUTED', '8:026b63e96a59ef9402ad07098fcfbdec', 'createTable tableName=ujcms_org_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 556, 'EXECUTED', '8:29629057cced05272bd5e4c17610f332', 'createTable tableName=ujcms_org_perm', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 557, 'EXECUTED', '8:720d82ac68b41984cf9df106b1ce519c', 'createTable tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-5', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 558, 'EXECUTED', '8:1605ac7629e024d15d36f65a52855a62', 'createTable tableName=ujcms_user_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 559, 'EXECUTED', '8:39b912165b5a9966d717662720c5a158', 'createIndex indexName=idx_orgarticle_composite, tableName=ujcms_org_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 560, 'EXECUTED', '8:3c21e0d2a7bfcc724ceb859d71d5ed81', 'createIndex indexName=idx_orgarticle_site, tableName=ujcms_org_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 561, 'EXECUTED', '8:8cd529159835f292d9ca00150911eadd', 'createIndex indexName=idx_orgchannel_composite, tableName=ujcms_org_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-9', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 562, 'EXECUTED', '8:afd7225696b6570740115929d205d5c6', 'createIndex indexName=idx_orgchannel_site, tableName=ujcms_org_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-10', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 563, 'EXECUTED', '8:e3e05619f214f56bbb7094b4ce3f50b4', 'createIndex indexName=idx_orgperm_composite, tableName=ujcms_org_perm', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-11', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 564, 'EXECUTED', '8:d1f8b7441316d7db032ccf4d2553bd3b', 'createIndex indexName=idx_roleorg_composite, tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-12', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 565, 'EXECUTED', '8:8934107b75694f75a34e747dd6d6373a', 'createIndex indexName=idx_roleorg_site, tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-13', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 566, 'EXECUTED', '8:09bae011712ecd540d8843e95de3cc4d', 'createIndex indexName=idx_userorg_composite, tableName=ujcms_user_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-14', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 567, 'EXECUTED', '8:c7d46d7a1d42e3eb5f73633f07530a8f', 'addForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-15', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 568, 'EXECUTED', '8:466fd12197bc98111b8eacaf738ecc32', 'addForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-16', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 569, 'EXECUTED', '8:e08e4d6f8d2b984e8af464b02fcc1ff3', 'addForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-17', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 570, 'EXECUTED', '8:c0cbc89149e62de5934871eda579e92d', 'addForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-18', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 571, 'EXECUTED', '8:f168a10ac8b780e31d249b4733b92a60', 'addForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-19', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 572, 'EXECUTED', '8:2358cb53e95e167f0d60fcc1b00a004a', 'addForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-20', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 573, 'EXECUTED', '8:5ca8963e1a3cff07611ba7b8737cfa5c', 'addForeignKeyConstraint baseTableName=ujcms_org_perm, constraintName=fk_orgperm_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-21', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 574, 'EXECUTED', '8:61eca06f93f42df52b689fab6d8b120d', 'addForeignKeyConstraint baseTableName=ujcms_org_perm, constraintName=fk_orgperm_perm, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-22', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 575, 'EXECUTED', '8:cbe59d8746d2cb3bf998db66397940ea', 'addForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-23', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 576, 'EXECUTED', '8:b7943ac362950928a56a04cc7928f370', 'addForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-24', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 577, 'EXECUTED', '8:b04f61be01d0c47bca1f05a3a9a12f90', 'addForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-25', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 578, 'EXECUTED', '8:d31dca4b872dbe3a971fb71193919fb2', 'addForeignKeyConstraint baseTableName=ujcms_user_org, constraintName=fk_userorg_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1709563982019-26', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 579, 'EXECUTED', '8:d002165051a975dd4bfe52174a6102c5', 'addForeignKeyConstraint baseTableName=ujcms_user_org, constraintName=fk_userorg_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714275368579-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 580, 'EXECUTED', '8:12725116628d6b754344b48aee76228a', 'dropForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714275368579-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 581, 'EXECUTED', '8:f45300471d7a75930e43e6d6a2f93e86', 'dropForeignKeyConstraint baseTableName=ujcms_form_ext, constraintName=fk_formext_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714275368580-1-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 582, 'EXECUTED', '8:bf78a004f8529811cb545319e55cdd95', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714280279572-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:01', 583, 'EXECUTED', '8:beeaf2f73c4e09d1410bdafe5c957503', 'modifyDataType columnName=id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714280279572-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 584, 'EXECUTED', '8:07a487d88652a8d080ba6caffd8d2669', 'modifyDataType columnName=id_, tableName=ujcms_form_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714280279572-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 585, 'EXECUTED', '8:9fe9b4233938219d72154b2966b0585b', 'modifyDataType columnName=id_, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714280279572-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 586, 'EXECUTED', '8:c951093179dd8ddbf3089e79f0e129f5', 'modifyDataType columnName=type_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714283004706-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 587, 'EXECUTED', '8:0f76e2408ba0e5922d31f8d6ae786afb', 'addNotNullConstraint columnName=type_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714283004706-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 588, 'EXECUTED', '8:f4197f43b08e22186ebfb7f4adc7d9ee', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_type, referencedTableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714283004706-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 589, 'EXECUTED', '8:2eb78c3cdc551940b65bcac245b41b90', 'addForeignKeyConstraint baseTableName=ujcms_form_ext, constraintName=fk_formext_form, referencedTableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 590, 'EXECUTED', '8:a82b0321a315a8fd26591dde5190818a', 'dropForeignKeyConstraint baseTableName=ujcms_action, constraintName=fk_action_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 591, 'EXECUTED', '8:bbbd42d8c740f943db76cdea13e0090d', 'dropForeignKeyConstraint baseTableName=ujcms_action, constraintName=fk_action_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 592, 'EXECUTED', '8:694ff36a6eb2631ea8c9ee6d629b8121', 'dropForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 593, 'EXECUTED', '8:b3c9b91e4669e6fd12d0d5993543bb7d', 'dropForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-5', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 594, 'EXECUTED', '8:3117a70361cd1922ee67fc75a3be26fb', 'dropForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_src', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 595, 'EXECUTED', '8:5860a46fb476d8e457bba5234752a39f', 'dropForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 596, 'EXECUTED', '8:e4dca786fd70ec50947e3c587f31b298', 'dropForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_user_modified', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 597, 'EXECUTED', '8:671d00e198fcaaf604629f1925503e1b', 'dropForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_website', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-8-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 598, 'EXECUTED', '8:eae23067ef81cf764256a04444c50527', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-9', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 599, 'EXECUTED', '8:af645e6b453a935a32a57e730fc881c5', 'dropForeignKeyConstraint baseTableName=ujcms_article_ext, constraintName=fk_articleext_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-10', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 600, 'EXECUTED', '8:1efa19615fa868233a977de4fedeef0b', 'dropForeignKeyConstraint baseTableName=ujcms_article_tag, constraintName=fk_articletag_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-11', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 601, 'EXECUTED', '8:b5938fdb951229adf99f1c83da2b73f1', 'dropForeignKeyConstraint baseTableName=ujcms_article_tag, constraintName=fk_articletag_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-11-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 602, 'EXECUTED', '8:48cadc043af23e91974f372b548eb103', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-12', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 603, 'EXECUTED', '8:9933e0a02fa56e8bcd5b5dea104f842a', 'dropForeignKeyConstraint baseTableName=ujcms_attachment, constraintName=fk_attachment_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-13', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 604, 'EXECUTED', '8:e8b221c5c430d6918c36f85acc90deb1', 'dropForeignKeyConstraint baseTableName=ujcms_attachment, constraintName=fk_attachment_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-13-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 605, 'EXECUTED', '8:b1a636edc31c0b84e0f48eebe83ccf30', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-14', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 606, 'EXECUTED', '8:2e3bc59ad13e3f58bb4ed7c0fe47ff45', 'dropForeignKeyConstraint baseTableName=ujcms_attachment_refer, constraintName=fk_attachmentrefer_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-14-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 607, 'EXECUTED', '8:df2e8e02494a6672f8bd602515ce59dc', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-15', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 608, 'EXECUTED', '8:6aa69865d847fe345b50e6262b4e7d19', 'dropForeignKeyConstraint baseTableName=ujcms_block, constraintName=fk_block_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-15-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 609, 'EXECUTED', '8:63f55ba751944616c3db703822199732', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-16', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 610, 'EXECUTED', '8:49bbed46584834cc18aaa0970876f919', 'dropForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-17', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 611, 'EXECUTED', '8:25a7ad4f9bca53410da05ef0bb6fdcd1', 'dropForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-18', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 612, 'EXECUTED', '8:7521db87d33bfdb5b324b2b3ae03836c', 'dropForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-18-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 613, 'EXECUTED', '8:ab736bb8ff26aa11f07e0998a78990d3', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-19', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:02', 614, 'EXECUTED', '8:e1b5e071b44879a524c3888f40c9413d', 'dropForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_model_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-20', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 615, 'EXECUTED', '8:4e0b60cb35fccd29f8f8115520506ca6', 'dropForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_model_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-21', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 616, 'EXECUTED', '8:7b49187f869f285985369a4ea273d6bf', 'dropForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_parent', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-22', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 617, 'EXECUTED', '8:202c7793bc20caed4e03bb34563a54a0', 'dropForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-23', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 618, 'EXECUTED', '8:2de050fe56082fb5e1007fbe91cf1583', 'dropForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-24', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 619, 'EXECUTED', '8:20b902504a6ddb7d3396107e1badf79f', 'dropForeignKeyConstraint baseTableName=ujcms_channel_ext, constraintName=fk_channelext_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-25', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 620, 'EXECUTED', '8:2840ae2389faabb802e273c2595e0e6a', 'dropForeignKeyConstraint baseTableName=ujcms_channel_tree, constraintName=fk_channeltree_ancestor', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-26', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 621, 'EXECUTED', '8:6feba062d0bfc5f75603ead4b4d938a1', 'dropForeignKeyConstraint baseTableName=ujcms_channel_tree, constraintName=fk_channeltree_descendant', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-26-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 622, 'EXECUTED', '8:894a45f1ed4c57428c654dc88f3705c8', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-27', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 623, 'EXECUTED', '8:2ea922a33b4a4362daf54d1360ddfe84', 'dropForeignKeyConstraint baseTableName=ujcms_dict, constraintName=fk_dict_dicttype', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-28', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 624, 'EXECUTED', '8:c0ea167fc9d0353bb8d480696a0651bb', 'dropForeignKeyConstraint baseTableName=ujcms_dict, constraintName=fk_dict_parent', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-28-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 625, 'EXECUTED', '8:ff9a5fc77821ac1dd70cb9dd47497bc8', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-29', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 626, 'EXECUTED', '8:394363749175301eec28f93dd5cbda38', 'dropForeignKeyConstraint baseTableName=ujcms_dict_type, constraintName=fk_dicttype_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-29-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 627, 'EXECUTED', '8:3a09e0471b15adf89bcbf4a96c5371a3', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-30', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 628, 'EXECUTED', '8:a1526b6ce66c3711d5cf1c5df205de1e', 'dropForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-31', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 629, 'EXECUTED', '8:828fe91109af094e10eee07cb8470076', 'dropForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-32', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 630, 'EXECUTED', '8:c67baa653dba1c036c9a70e94bac2a4c', 'dropForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-33', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 631, 'EXECUTED', '8:8ee1b443d0467bbcf24236d0d6a5f82a', 'dropForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_user_modified', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-34', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 632, 'EXECUTED', '8:8e7a0578d62bf0c1df6f282d21eede93', 'dropForeignKeyConstraint baseTableName=ujcms_form_type, constraintName=fk_formtype_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-35', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 633, 'EXECUTED', '8:017a098bd3ef677d64b42a3384378d2b', 'dropForeignKeyConstraint baseTableName=ujcms_form_type, constraintName=fk_formtype_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-36', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 634, 'EXECUTED', '8:adf76c0f74b6f233ed48649e025bd077', 'dropForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-37', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 635, 'EXECUTED', '8:710c2a69f0b9270dbe9f9939021483c0', 'dropForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-38', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 636, 'EXECUTED', '8:abe475f0b4be69bee99a21a4ca893d0b', 'dropForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-38-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 637, 'EXECUTED', '8:1dc6afca04f13c7fa996ec747ac343e8', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-39', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 638, 'EXECUTED', '8:4dd2225c3da9ac6ab3e4ab898f76bd45', 'dropForeignKeyConstraint baseTableName=ujcms_login_log, constraintName=fk_loginlog_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-39-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 639, 'EXECUTED', '8:61908f820ed6af123ae93406d3458ee8', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-40', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 640, 'EXECUTED', '8:26e2a39d50ecf685f4b69cc2967bdf90', 'dropForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-41', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 641, 'EXECUTED', '8:5c53d11b6239025bd8b720b4ccb7f5c8', 'dropForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-42', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 642, 'EXECUTED', '8:2399221764c8720e188c960a88c5e39c', 'dropForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-43', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 643, 'EXECUTED', '8:0ddddf8f4ac9416adfe2198d545a8ed0', 'dropForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_user_reply', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-44', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 644, 'EXECUTED', '8:1c7a5de5304d83dcfdfe9a53002f994a', 'dropForeignKeyConstraint baseTableName=ujcms_message_board_type, constraintName=fk_messageboardtype_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-44-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 645, 'EXECUTED', '8:acf6f34af42601191ba312ee13258629', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-45', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 646, 'EXECUTED', '8:152233ab4feb2c7b8508704a5d930e4f', 'dropForeignKeyConstraint baseTableName=ujcms_operation_log, constraintName=fk_operationlog_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-46', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 647, 'EXECUTED', '8:d49a6ce203df25bd33b1db7ddd86d4e1', 'dropForeignKeyConstraint baseTableName=ujcms_operation_log, constraintName=fk_operationlog_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-48', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 648, 'EXECUTED', '8:95c6b3a29ac7e6dda59f18b8e0201b35', 'dropForeignKeyConstraint baseTableName=ujcms_org, constraintName=fk_org_parent', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-48-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 649, 'EXECUTED', '8:fe5a4fb07871bef920ea4b5a57cda069', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-49', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 650, 'EXECUTED', '8:51989b87b56cb6339d5aa230d525dd1b', 'dropForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-50', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 651, 'EXECUTED', '8:b4b9d70509dce3b86ada46ac766c45db', 'dropForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-51', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 652, 'EXECUTED', '8:5b4b38b88ad08b524d52a2aaf1cce8aa', 'dropForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-51-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 653, 'EXECUTED', '8:8b5edc4eb716827cb87cb2b087ea85f6', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-52', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 654, 'EXECUTED', '8:14c7cae98b3c9716492e83372e98d147', 'dropForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-53', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 655, 'EXECUTED', '8:d8d82301c77d78330bb7539597785ab4', 'dropForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-54', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:03', 656, 'EXECUTED', '8:cc90f75f2a5f00d23a0005a0a5a18344', 'dropForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-54-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 657, 'EXECUTED', '8:f2ce4664374d4e3e0a912d6676483bec', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-55', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 658, 'EXECUTED', '8:7a70e08b499d853e9f4b6ad4d52acb19', 'dropForeignKeyConstraint baseTableName=ujcms_org_perm, constraintName=fk_orgperm_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-56', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 659, 'EXECUTED', '8:bb11c878073937b2981172f6e1d5e4de', 'dropForeignKeyConstraint baseTableName=ujcms_org_perm, constraintName=fk_orgperm_perm', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-56-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 660, 'EXECUTED', '8:5e176a6641fd95688abdf8e29c8ebfb4', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-57', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 661, 'EXECUTED', '8:73e16c29008b26eeb42bc47c3952958d', 'dropForeignKeyConstraint baseTableName=ujcms_org_tree, constraintName=fk_orgtree_ancestor', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-58', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 662, 'EXECUTED', '8:f65b6be596313a90e5b82581c0b7af11', 'dropForeignKeyConstraint baseTableName=ujcms_org_tree, constraintName=fk_orgtree_descendant', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-58-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 663, 'EXECUTED', '8:2aedf6c686adc11a8867f1254831c314', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-59', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 664, 'EXECUTED', '8:e638edef7955adf78e1a971f9db29990', 'dropForeignKeyConstraint baseTableName=ujcms_performance_type, constraintName=fk_performancetype_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-59-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 665, 'EXECUTED', '8:a495646b78ae507ace701984a90a6f36', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-60', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 666, 'EXECUTED', '8:c1bad954758c04288189066b8ee83c80', 'dropForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_article_from', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-61', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 667, 'EXECUTED', '8:9c8fa7cff396ec995696d79d92835b93', 'dropForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_article_to', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-62', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 668, 'EXECUTED', '8:35c9e2b759a461da1c7c630127846a98', 'dropForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_site_from', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-63', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 669, 'EXECUTED', '8:7268a0353f585ae63808958eeb83aaa3', 'dropForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_site_to', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-64', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 670, 'EXECUTED', '8:11fc73f3296d49c5f7081cb7a49b35b5', 'dropForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-64-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 671, 'EXECUTED', '8:0d413f0eef7972be0c91eb77b5c36ed6', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-65', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 672, 'EXECUTED', '8:923129ca9eb16b1f9b6fb134a6735e68', 'dropForeignKeyConstraint baseTableName=ujcms_role, constraintName=fk_role_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-66', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 673, 'EXECUTED', '8:78e6b41f3fc160e9e4a589f204912b05', 'dropForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-67', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 674, 'EXECUTED', '8:d1df71f9191485b4fb325083e0163983', 'dropForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-68', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 675, 'EXECUTED', '8:58c1781e4ca24a3d922d82a22091dca4', 'dropForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-68-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 676, 'EXECUTED', '8:570930349e81f809fbf779c9e8aaeb2d', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-69', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 677, 'EXECUTED', '8:a78d5179b1d09f327d9f3c64e426cefe', 'dropForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-70', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 678, 'EXECUTED', '8:9647f526106a7c6f56f60744d214be2e', 'dropForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-71', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 679, 'EXECUTED', '8:84f0ef3a8da1756a584b4cb5f5d9f4d6', 'dropForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-71-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 680, 'EXECUTED', '8:d3251fd6d23986d3cee85912c60d7edc', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-72', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 681, 'EXECUTED', '8:aa8c6146edd16889bb40ae43ce31b29e', 'dropForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-73', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 682, 'EXECUTED', '8:fb40a24355d473711d215897a8cdb1c7', 'dropForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-74', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 683, 'EXECUTED', '8:9bab6ca65bd3a4da046cbd18daf2e71a', 'dropForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-74-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 684, 'EXECUTED', '8:6dd48816bb367f118845cb7e2febcd52', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-75', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 685, 'EXECUTED', '8:2dde87efca9acbe0ebd9334086bfb8c9', 'dropForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-76', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 686, 'EXECUTED', '8:320863e00c93b2bf2a17e61f6c946781', 'dropForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-77', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 687, 'EXECUTED', '8:603fe96061c5ed1d667d6dca47cac676', 'dropForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_parent', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-78', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 688, 'EXECUTED', '8:f5ee6d15efad1a56d421ae3a4236bce6', 'dropForeignKeyConstraint baseTableName=ujcms_site_tree, constraintName=fk_sitetree_ancestor', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-79', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 689, 'EXECUTED', '8:78d28e383573004cc4047ed6dfbe7b80', 'dropForeignKeyConstraint baseTableName=ujcms_site_tree, constraintName=fk_sitetree_descendant', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-79-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 690, 'EXECUTED', '8:7be07662c68851baf4bce07957657471', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-80', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 691, 'EXECUTED', '8:be6603c7e0f37984395f27bcc3b8019f', 'dropForeignKeyConstraint baseTableName=ujcms_survey, constraintName=fk_survey_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-80-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 692, 'EXECUTED', '8:683ff183c81dcd8fedad0bc6494abde4', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-81', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 693, 'EXECUTED', '8:79bbca8acb332db3533b94d544b94034', 'dropForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-82', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 694, 'EXECUTED', '8:30e3014e11a1700050b8f61023796d7d', 'dropForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-83', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 695, 'EXECUTED', '8:e7f78bc3091273422e8301f976e3f4b6', 'dropForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-83-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:04', 696, 'EXECUTED', '8:056e1731fe3c2d335ee6441453d3a067', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-84', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 697, 'EXECUTED', '8:5d858c69b406ea73f21bf5e9471ffb4e', 'dropForeignKeyConstraint baseTableName=ujcms_survey_item, constraintName=fk_surveyitem_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-85', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 698, 'EXECUTED', '8:b647089b7be4c45427717a5dcac95ee9', 'dropForeignKeyConstraint baseTableName=ujcms_survey_item, constraintName=fk_surveyitem_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-85-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 699, 'EXECUTED', '8:c0413903bc919fc683e459c5e88b8df6', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-86', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 700, 'EXECUTED', '8:eb755208b8f698cc7077ddae4c297ee1', 'dropForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_feed', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-87', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 701, 'EXECUTED', '8:5b35366fdfea1ffcf0a37a9d71db74cd', 'dropForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-88', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 702, 'EXECUTED', '8:b220d0e3c4e90309a7f9a0109eae5edc', 'dropForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-89', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 703, 'EXECUTED', '8:7a91153ea70a2e2e6999ae61390e8ba1', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-90', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 704, 'EXECUTED', '8:3bce20494a54f3f7542cd8bd6aedee51', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-91', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 705, 'EXECUTED', '8:fb053f3e7b023072bf3ed4502b8e1bd5', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-91-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 706, 'EXECUTED', '8:19656e790dae45ebd3bcc7f45b73dfa8', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-92', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 707, 'EXECUTED', '8:22576a8a42753c48ad3f67c8281b6251', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_feed', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-93', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 708, 'EXECUTED', '8:e0528aac4d0c9b958a5e18899e8d4b21', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-94', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 709, 'EXECUTED', '8:d40790fa526c44f5c924cb07ff599b38', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-95', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 710, 'EXECUTED', '8:26a4d35cc56776e38ca928b3de912ed0', 'dropForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-95-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 711, 'EXECUTED', '8:e0a0297c0d6cb5bc20f961fb8c9ee3c7', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-96', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 712, 'EXECUTED', '8:633ca6caedecda8ec7418b780381d9e1', 'dropForeignKeyConstraint baseTableName=ujcms_tag, constraintName=fk_tag_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-97', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 713, 'EXECUTED', '8:22dde2941e637670c6bde34ab4fed5d6', 'dropForeignKeyConstraint baseTableName=ujcms_tag, constraintName=fk_tag_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-97-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 714, 'EXECUTED', '8:7ca1a42969a8cc7479b0dcb392da0512', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-98', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 715, 'EXECUTED', '8:6a435b526555c1d8e9ed01938078a89a', 'dropForeignKeyConstraint baseTableName=ujcms_task, constraintName=fk_task_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-99', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 716, 'EXECUTED', '8:6c9f237a61df04cc64bef3a7d567f0c8', 'dropForeignKeyConstraint baseTableName=ujcms_task, constraintName=fk_task_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-100', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 717, 'EXECUTED', '8:000e88efb4bef8dc23155e39e8fc467e', 'dropForeignKeyConstraint baseTableName=ujcms_user, constraintName=fk_user_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-101', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 718, 'EXECUTED', '8:a8d6b0b9c1ed5c6644bf452c8dab2a28', 'dropForeignKeyConstraint baseTableName=ujcms_user, constraintName=fk_user_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-101-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 719, 'EXECUTED', '8:ee2614e242fc7d2acf64d8988610677c', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-102', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 720, 'EXECUTED', '8:6a5f0519e10769a8ec2d6619211b45f3', 'dropForeignKeyConstraint baseTableName=ujcms_user_ext, constraintName=fk_userext_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-102-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:05', 721, 'EXECUTED', '8:13bb3e7f6f4f60c872c5ee3b71254969', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-103', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 722, 'EXECUTED', '8:7322185ca6ac59dd26d9824f22c7fb8a', 'dropForeignKeyConstraint baseTableName=ujcms_user_openid, constraintName=fk_useropenid_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-103-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 723, 'EXECUTED', '8:f1b10f07a42160bd770ddbec7ecde76b', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-104', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 724, 'EXECUTED', '8:34859e863535ebf4948516879dd5c210', 'dropForeignKeyConstraint baseTableName=ujcms_user_org, constraintName=fk_userorg_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-105', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 725, 'EXECUTED', '8:603fef3bb4103856025134403ddff0f7', 'dropForeignKeyConstraint baseTableName=ujcms_user_org, constraintName=fk_userorg_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-105-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 726, 'EXECUTED', '8:e2f1c4b544503528e012d20f2b3b226a', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-106', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 727, 'EXECUTED', '8:8a0a58b5bd63b3a94e2d1ce65c390335', 'dropForeignKeyConstraint baseTableName=ujcms_user_role, constraintName=fk_userrole_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-107', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 728, 'EXECUTED', '8:253e91edec40404fd8f530b6410e4867', 'dropForeignKeyConstraint baseTableName=ujcms_user_role, constraintName=fk_userrole_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-107-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 729, 'EXECUTED', '8:3bf6ed1f63b5034ed8c7bbeeff07ecd0', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-108', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 730, 'EXECUTED', '8:831435fe28389958ea2083bd73be2451', 'dropForeignKeyConstraint baseTableName=ujcms_visit_log, constraintName=fk_visit_log_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-109', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 731, 'EXECUTED', '8:372ac173dde587df8a696c26bc6aab87', 'dropForeignKeyConstraint baseTableName=ujcms_visit_log, constraintName=fk_visit_log_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-109-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 732, 'EXECUTED', '8:2fc06f3d680bcba0291cf33907f4f1e0', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-110', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 733, 'EXECUTED', '8:1cfa89433efc86388a17c10b3e47b43e', 'dropForeignKeyConstraint baseTableName=ujcms_visit_page, constraintName=fk_visit_page_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-110-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 734, 'EXECUTED', '8:65cb077ff6c1cfc09bb8d2ecefc1b8dd', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-111', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 735, 'EXECUTED', '8:54cc7c950b3366782a492c24b1643ccf', 'dropForeignKeyConstraint baseTableName=ujcms_visit_stat, constraintName=fk_visit_stat_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-111-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 736, 'EXECUTED', '8:ab0117f7cde7ab2c8e3672685661c101', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-112', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 737, 'EXECUTED', '8:2af3d374e934e0c121ec3e3132c82f6b', 'dropForeignKeyConstraint baseTableName=ujcms_visit_trend, constraintName=fk_visit_trend_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-112-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 738, 'EXECUTED', '8:0532dcc544e6a7a98702fdf6d63e7ee9', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-113', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 739, 'EXECUTED', '8:67259ec65abad8d191ffcd12c9f35e4b', 'dropForeignKeyConstraint baseTableName=ujcms_vote, constraintName=fk_vote_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-113-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 740, 'EXECUTED', '8:d809ceadce6ca9a4289046c0b96bb5c4', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-114', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 741, 'EXECUTED', '8:671277aed0c932024bf976e3232de2f0', 'dropForeignKeyConstraint baseTableName=ujcms_vote_option, constraintName=fk_voteoption_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-114-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 742, 'EXECUTED', '8:2281c9b0a25b53249e37bf45807d8d09', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-115-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 743, 'EXECUTED', '8:eeceac9df2a80817997d17a3a018221e', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-116-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 744, 'EXECUTED', '8:06f3a8a55b2104bfd54971cf34f45aa3', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-117-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 745, 'EXECUTED', '8:68061c9e41275ed55427489af2bb14d4', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-118-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 746, 'EXECUTED', '8:4acd2cbd0a7067980f12830911616874', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714472217141-119-oracle', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:06', 747, 'EXECUTED', '8:ffe285a7d91c0fb9d4fa2e1af390c15b', 'sql', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:07', 748, 'EXECUTED', '8:4937d746311c27c1676fd2c2c84643c7', 'modifyDataType columnName=ancestor_id_, tableName=ujcms_channel_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:07', 749, 'EXECUTED', '8:72588986ce71043c8b29c114132aa76f', 'modifyDataType columnName=ancestor_id_, tableName=ujcms_org_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:07', 750, 'EXECUTED', '8:1a97de154f6a0afd5fd0d4154a6d316f', 'modifyDataType columnName=ancestor_id_, tableName=ujcms_site_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:07', 751, 'EXECUTED', '8:10daecb9552ded136fc3f239d71090a0', 'modifyDataType columnName=article_id_, tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-5', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:07', 752, 'EXECUTED', '8:cb6cfa762b9fda2e46221a12c4c76d66', 'modifyDataType columnName=article_id_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:08', 753, 'EXECUTED', '8:6cac116f3679bbf16644cd55b7a394ff', 'modifyDataType columnName=article_model_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:08', 754, 'EXECUTED', '8:c7b812c4bfb53aaa24ee1ea92eded278', 'modifyDataType columnName=attachment_id_, tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:08', 755, 'EXECUTED', '8:81550dad8c2f8896eba87ba5bb9735e7', 'modifyDataType columnName=block_id_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-9', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:08', 756, 'EXECUTED', '8:d06ba1c8e29d0d3ae5a8e7ed016a264d', 'modifyDataType columnName=channel_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-10', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:09', 757, 'EXECUTED', '8:2d57ccd07e79af189fff9ab993bd7bfd', 'modifyDataType columnName=channel_id_, tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-11', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:09', 758, 'EXECUTED', '8:3ef3bf78c879a85584b898c1c67ff548', 'modifyDataType columnName=channel_id_, tableName=ujcms_org_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-12', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:09', 759, 'EXECUTED', '8:b0916b510a19c0b59fefca657c02b6fe', 'modifyDataType columnName=channel_id_, tableName=ujcms_org_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-13', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:09', 760, 'EXECUTED', '8:82f585993393f7f6984b1beb5639849e', 'modifyDataType columnName=channel_id_, tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-14', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 761, 'EXECUTED', '8:88a58c006c30a3f9a97665fb9039f4d9', 'modifyDataType columnName=channel_id_, tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-15', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 762, 'EXECUTED', '8:b757ea4bb5f5847cc19a1d45fcff1294', 'modifyDataType columnName=channel_model_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-16', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 763, 'EXECUTED', '8:ab86d0270c918a48cb9b76ab7c40b68e', 'modifyDataType columnName=default_site_id_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-17', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 764, 'EXECUTED', '8:42a60e1d7c8c8c2a59e74bf22559af69', 'modifyDataType columnName=descendant_id_, tableName=ujcms_channel_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-18', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 765, 'EXECUTED', '8:a8afbba9c6edb10482280c37429ea626', 'modifyDataType columnName=descendant_id_, tableName=ujcms_org_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-19', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 766, 'EXECUTED', '8:860560cd7692fe84a155ff5788a6967e', 'modifyDataType columnName=descendant_id_, tableName=ujcms_site_tree', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-20', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 767, 'EXECUTED', '8:e6422081ead7a562140fdcf5add7da2e', 'modifyDataType columnName=from_article_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-21', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 768, 'EXECUTED', '8:6da3f2448d3a627e31072e7f32b10e0c', 'modifyDataType columnName=from_site_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-22', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:10', 769, 'EXECUTED', '8:c075f6bd34c9b33a653d323511809f21', 'modifyDataType columnName=group_id_, tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-23', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 770, 'EXECUTED', '8:8b54973a049058f41a3ab770089e0442', 'modifyDataType columnName=group_id_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-24', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 771, 'EXECUTED', '8:844cdb68888b3ab00c80ebbde3783eb7', 'modifyDataType columnName=id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-25', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 772, 'EXECUTED', '8:948f4feb1608061fe159a1bc76fa4c47', 'modifyDataType columnName=id_, tableName=ujcms_article_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-26', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 773, 'EXECUTED', '8:2c938ee523d51668d46ec932dd96b6e5', 'modifyDataType columnName=id_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-27', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 774, 'EXECUTED', '8:f7bfbcb5f6bab0b92e7375c20f713354', 'modifyDataType columnName=id_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-28', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 775, 'EXECUTED', '8:aa93afa27cc02d9f63e044d03b0d8efc', 'modifyDataType columnName=id_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-29', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 776, 'EXECUTED', '8:48da079b3cee36689cfa73745a759c13', 'modifyDataType columnName=id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-30', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 777, 'EXECUTED', '8:e06ee5c6476de9267f784d6ced07d623', 'modifyDataType columnName=id_, tableName=ujcms_channel_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-31', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 778, 'EXECUTED', '8:bc432a14eb3c4d580c1e8ffb34ed6713', 'modifyDataType columnName=id_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-32', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 779, 'EXECUTED', '8:fddea7e4360dd96df3b3bdaf34091413', 'modifyDataType columnName=id_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-33', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 780, 'EXECUTED', '8:237f8875b45300fad5805c898c889791', 'modifyDataType columnName=id_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-34', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 781, 'EXECUTED', '8:246d4b483a8b498d238a60c94f6d6a9d', 'modifyDataType columnName=id_, tableName=ujcms_error_word', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-35', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 782, 'EXECUTED', '8:66107dd7aedbe9e8fb508dc48f4429ab', 'modifyDataType columnName=id_, tableName=ujcms_example', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-36', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 783, 'EXECUTED', '8:433e4e96b4521e27bc7e4277eed44638', 'modifyDataType columnName=id_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-37', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 784, 'EXECUTED', '8:8569747e7c2f88e437d0ea3037a4ae57', 'modifyDataType columnName=id_, tableName=ujcms_login_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-38', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 785, 'EXECUTED', '8:b957925602d104a5853cf69bfc29a1fd', 'modifyDataType columnName=id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-39', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 786, 'EXECUTED', '8:f97db15dc8c2cb1df0c8ece5e924304f', 'modifyDataType columnName=id_, tableName=ujcms_message_board_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-40', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 787, 'EXECUTED', '8:e30f473a3ea47b78e96ae142c2bc2108', 'modifyDataType columnName=id_, tableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-41', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 788, 'EXECUTED', '8:018e14b4443841c7b966d1917cae1288', 'modifyDataType columnName=id_, tableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-42', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 789, 'EXECUTED', '8:5252497059ac931b79cf9400be497b2b', 'modifyDataType columnName=id_, tableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-43', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:11', 790, 'EXECUTED', '8:4b67454539153cd59018190c291590e9', 'modifyDataType columnName=id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-44', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 791, 'EXECUTED', '8:24ca4c7d30fbd814c3e14c27bac9de0b', 'modifyDataType columnName=id_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-45', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 792, 'EXECUTED', '8:d70cd4480db0bf165819dadb59986a32', 'modifyDataType columnName=id_, tableName=ujcms_sensitive_word', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-46', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 793, 'EXECUTED', '8:ffb77bfa9bf6c2ec67c5dc6cf9fa772d', 'modifyDataType columnName=id_, tableName=ujcms_short_message', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-47', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 794, 'EXECUTED', '8:040a196a5cfb3b4ac30e5bc2cf93b821', 'modifyDataType columnName=id_, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-48', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 795, 'EXECUTED', '8:2227d2ffb6648df9822746d256c6e51e', 'modifyDataType columnName=id_, tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-49', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 796, 'EXECUTED', '8:bdf0bd867152390af90b388b332698fe', 'modifyDataType columnName=id_, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-50', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 797, 'EXECUTED', '8:a94aeefd024c9efab12dfcf168bbfb09', 'modifyDataType columnName=id_, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-51', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 798, 'EXECUTED', '8:2b194711f92bb8b3b28c20225e429b34', 'modifyDataType columnName=id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-52', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 799, 'EXECUTED', '8:0e1f743ddcc4fc8f39e254d3a4b409a6', 'modifyDataType columnName=id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-53', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 800, 'EXECUTED', '8:a115072192e0f5ae8ecc35bd038978ca', 'modifyDataType columnName=id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-54', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 801, 'EXECUTED', '8:fbaebcd09bd64e8e6583caa0442aba7e', 'modifyDataType columnName=id_, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-55', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 802, 'EXECUTED', '8:8b3a6691e6437e6598e98994a0db616b', 'modifyDataType columnName=id_, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-56', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 803, 'EXECUTED', '8:6c5a1769126ef902ab145b9031c9df15', 'modifyDataType columnName=id_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-57', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 804, 'EXECUTED', '8:a69288ba8aa8938daede393078788344', 'modifyDataType columnName=id_, tableName=ujcms_user_ext', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-58', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 805, 'EXECUTED', '8:fc1e350e4c4b5602f8a9557060a15407', 'modifyDataType columnName=id_, tableName=ujcms_visit_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-59', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 806, 'EXECUTED', '8:9b4cef922eaccf11d65b3f39fef2006b', 'modifyDataType columnName=id_, tableName=ujcms_visit_trend', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-60', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:12', 807, 'EXECUTED', '8:b426dcf950d8cbcf49a383673a0effb6', 'modifyDataType columnName=id_, tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-61', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 808, 'EXECUTED', '8:a93e8d41fbded5a406f1c578e9b9a4f4', 'modifyDataType columnName=id_, tableName=ujcms_vote_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-62', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 809, 'EXECUTED', '8:ea4ca2bfa4bd3967bc523f2e7e85235a', 'modifyDataType columnName=item_id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-63', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 810, 'EXECUTED', '8:3e258244315f660f39a686eb97a25dc7', 'modifyDataType columnName=model_id_, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-64', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 811, 'EXECUTED', '8:a3f07b94e4d5efc536c1c8426d7d03cb', 'modifyDataType columnName=model_id_, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-65', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 812, 'EXECUTED', '8:10346c4305889b2347f986d005bb8afa', 'modifyDataType columnName=modified_user_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-66', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 813, 'EXECUTED', '8:bb063bb6caaccf58155ca172a926fef9', 'modifyDataType columnName=modified_user_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-67', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 814, 'EXECUTED', '8:8d9f4b37c87f47d02cd35eb099fa4d86', 'modifyDataType columnName=order_, tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-68', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 815, 'EXECUTED', '8:91d5ec96aef1df764354bb31834e9ef5', 'addNotNullConstraint columnName=order_, tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-69', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 816, 'EXECUTED', '8:058f94b090b3929a2a98edf7c825ee7d', 'addDefaultValue columnName=order_, tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-70', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 817, 'EXECUTED', '8:a7abd87dee5510690b4717e69fe2a6c4', 'modifyDataType columnName=order_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-71', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 818, 'EXECUTED', '8:63817ecdcdcbad981de0a834682a6682', 'addDefaultValue columnName=order_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-72', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 819, 'EXECUTED', '8:afdf3f006902880ebc42e0833455d786', 'modifyDataType columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-73', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 820, 'EXECUTED', '8:3885d2a8e52b5b991b8c85e77874da36', 'addDefaultValue columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-74', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 821, 'EXECUTED', '8:b15bc05f31b01ce952a1f9a5548e127d', 'modifyDataType columnName=order_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-75', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 822, 'EXECUTED', '8:aa4cbb344429236aebb6fbbe37780fc7', 'addDefaultValue columnName=order_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-76', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 823, 'EXECUTED', '8:53862f9c2b2df6f80b4ba06a364d0834', 'modifyDataType columnName=order_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-77', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 824, 'EXECUTED', '8:49cd8ae16fbc95f851699c9746cd1986', 'addDefaultValue columnName=order_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-78', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 825, 'EXECUTED', '8:00aa23dc9a4afe9f1573060c5dd1f09f', 'modifyDataType columnName=order_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-79', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 826, 'EXECUTED', '8:4678497437de4cced55cec9b2422f5d4', 'addDefaultValue columnName=order_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-80', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 827, 'EXECUTED', '8:099927ebc60bd7aae0e458222874704a', 'modifyDataType columnName=order_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-81', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 828, 'EXECUTED', '8:4fd4d7429bb6a5e93ccc6d43be0318a3', 'addDefaultValue columnName=order_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-82', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 829, 'EXECUTED', '8:d66610184f02a8d5e610427f0cdb8d66', 'addDefaultValue columnName=order_, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-83', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 830, 'EXECUTED', '8:c027b422ec50f0c9700e42d8c71985f2', 'addDefaultValue columnName=order_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-84', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 831, 'EXECUTED', '8:1b42fa16336a6f51d60b218ab12c6187', 'addDefaultValue columnName=order_, tableName=ujcms_user_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-85', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 832, 'EXECUTED', '8:2f43088dec0580b9d2c4d28d793e600b', 'modifyDataType columnName=order_, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-86', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 833, 'EXECUTED', '8:33bc34e63f89f4432370084b3d8a1214', 'addDefaultValue columnName=order_, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-87', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 834, 'EXECUTED', '8:dfe47dab384c58ec12624ea26089ae62', 'addDefaultValue columnName=order_, tableName=ujcms_vote_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-88', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:13', 835, 'EXECUTED', '8:694f212f9af8cfcf78c06a19fdaf6775', 'modifyDataType columnName=org_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-89', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 836, 'EXECUTED', '8:a0dd2edd5310e3119e708e2136ec874d', 'modifyDataType columnName=org_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-90', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 837, 'EXECUTED', '8:f6e3b4da0082a34c2ecae9a6a1f630af', 'modifyDataType columnName=org_id_, tableName=ujcms_org_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-91', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 838, 'EXECUTED', '8:54eee8b61a780102aa542234b4b1d1a5', 'modifyDataType columnName=org_id_, tableName=ujcms_org_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-92', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 839, 'EXECUTED', '8:ff8232713c3b450c253304ff8af96c60', 'modifyDataType columnName=org_id_, tableName=ujcms_org_perm', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-93', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 840, 'EXECUTED', '8:caf7b6369f91c3276f84fcf5b6d059c7', 'modifyDataType columnName=org_id_, tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-94', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 841, 'EXECUTED', '8:e7f9eb937bd365aefaa49728a441e474', 'modifyDataType columnName=org_id_, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-95', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 842, 'EXECUTED', '8:83f87929e5ebae6652ccd2690eb3038c', 'modifyDataType columnName=org_id_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-96', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 843, 'EXECUTED', '8:b4f6c139a0361905940aefa4dc9d5279', 'modifyDataType columnName=org_id_, tableName=ujcms_user_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-97', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 844, 'EXECUTED', '8:4e7b40193d57749cbe176766fbc7ac43', 'modifyDataType columnName=parent_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-98', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 845, 'EXECUTED', '8:1bec8c9c9d81ca66268d1b08be7e2ac5', 'modifyDataType columnName=parent_id_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-99', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 846, 'EXECUTED', '8:82a31588bba4b74d96e2e13c04d6c8cf', 'modifyDataType columnName=parent_id_, tableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-100', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 847, 'EXECUTED', '8:b382d3fa35001c877832b785cc04509e', 'modifyDataType columnName=parent_id_, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-101', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 848, 'EXECUTED', '8:db19ec6181f4a512e22a8d1b464544a4', 'modifyDataType columnName=performance_type_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-102', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 849, 'EXECUTED', '8:c7d7b234b769c4befc011125fe6a02c0', 'modifyDataType columnName=perm_org_id_, tableName=ujcms_org_perm', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-103', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 850, 'EXECUTED', '8:aef6b841e91b9fcf83ebbccde819e722', 'modifyDataType columnName=refer_id_, tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-104', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:14', 851, 'EXECUTED', '8:ddd0a229c32c1c827af4ed616f794e50', 'modifyDataType columnName=reply_user_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-105', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 852, 'EXECUTED', '8:af1d9b7ad2bbfb24ab6089cc5807bd58', 'modifyDataType columnName=role_id_, tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-106', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 853, 'EXECUTED', '8:3c832bebc4659732a315be814d968e75', 'modifyDataType columnName=role_id_, tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-107', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 854, 'EXECUTED', '8:abc59ba7ac2c5b3c00f8c80e542498ea', 'modifyDataType columnName=role_id_, tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-108', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 855, 'EXECUTED', '8:c600f41c37ecf192f9c630d5b5b67bdd', 'modifyDataType columnName=role_id_, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-109', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 856, 'EXECUTED', '8:3eec0a34a619773a694cd5dd353479e3', 'modifyDataType columnName=site_id_, tableName=ujcms_action', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-110', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 857, 'EXECUTED', '8:2f226547094c6e41fbc6df58723cad8f', 'modifyDataType columnName=site_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-111', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 858, 'EXECUTED', '8:5e2f82087a2247ca70421309c13fe4ed', 'modifyDataType columnName=site_id_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-112', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 859, 'EXECUTED', '8:9f65aa98d5d3014aec9fbdf53c2d3eb6', 'modifyDataType columnName=site_id_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-113', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 860, 'EXECUTED', '8:fabb8f09ab5a1be5847e8f13e1fb31dc', 'modifyDataType columnName=site_id_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-114', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 861, 'EXECUTED', '8:01083bcb68e77786ae1df8c4ceb976cb', 'modifyDataType columnName=site_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-115', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 862, 'EXECUTED', '8:a6ef605d85826984c80c012cd7404b84', 'modifyDataType columnName=site_id_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-116', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 863, 'EXECUTED', '8:9c4fffb62bcbf581185ee77587a7328c', 'modifyDataType columnName=site_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-117', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 864, 'EXECUTED', '8:1a1364df7e9311936e6f15c60b19b742', 'modifyDataType columnName=site_id_, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-118', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 865, 'EXECUTED', '8:c6d3a9237ba79a6325f7280ee635a9d4', 'modifyDataType columnName=site_id_, tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-119', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 866, 'EXECUTED', '8:d04a87453cc01e0ca42938581ba1b95f', 'modifyDataType columnName=site_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-120', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 867, 'EXECUTED', '8:8a7111098e65ccef9b67441def90b685', 'modifyDataType columnName=site_id_, tableName=ujcms_message_board_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-121', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 868, 'EXECUTED', '8:095c7e54dd649c9005aa9f1b542199ad', 'modifyDataType columnName=site_id_, tableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-122', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:15', 869, 'EXECUTED', '8:80c836461cacf0ed0763f574b6e15701', 'modifyDataType columnName=site_id_, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-123', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 870, 'EXECUTED', '8:ed329e0420c6c12855556131b46de72d', 'modifyDataType columnName=site_id_, tableName=ujcms_org_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-124', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 871, 'EXECUTED', '8:139f218187d96ac935d7097dd2ff7930', 'modifyDataType columnName=site_id_, tableName=ujcms_org_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-125', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 872, 'EXECUTED', '8:c5c54076d46ce0343ca7788fc071fe54', 'modifyDataType columnName=site_id_, tableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-126', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 873, 'EXECUTED', '8:af4dc1a122cd837bf36eb114379416d6', 'modifyDataType columnName=site_id_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-127', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 874, 'EXECUTED', '8:97f15731c999e67b865a9249d4f27bff', 'modifyDataType columnName=site_id_, tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-128', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 875, 'EXECUTED', '8:f012b760ab9abf5ac5913f31eb926ce3', 'modifyDataType columnName=site_id_, tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-129', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 876, 'EXECUTED', '8:e192d598dc623dade78536104a022c00', 'modifyDataType columnName=site_id_, tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-130', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 877, 'EXECUTED', '8:7614985af76d458b223ba142a812a0cc', 'modifyDataType columnName=site_id_, tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-131', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 878, 'EXECUTED', '8:3f3ce4fb9e9dfdda30222f0ee7e8829c', 'modifyDataType columnName=site_id_, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-132', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 879, 'EXECUTED', '8:e1905aceab6d9a4f60ff660f17a50446', 'modifyDataType columnName=site_id_, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-133', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 880, 'EXECUTED', '8:e9aa094c9ec8e3bd8b8517ed78c42b4f', 'modifyDataType columnName=site_id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-134', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 881, 'EXECUTED', '8:505e7c500e0d0d527d42dd77f2cc0eef', 'modifyDataType columnName=site_id_, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-135', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 882, 'EXECUTED', '8:eb0da640a3ff321820af756f734330d3', 'modifyDataType columnName=site_id_, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-136', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 883, 'EXECUTED', '8:59b0f2f60267df832e204433e8c205c0', 'modifyDataType columnName=site_id_, tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-137', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 884, 'EXECUTED', '8:435368e909dc593a7c447c87463993b0', 'modifyDataType columnName=site_id_, tableName=ujcms_visit_page', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-138', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 885, 'EXECUTED', '8:c66e670f69f01a6bdee3ea6d537acddc', 'modifyDataType columnName=site_id_, tableName=ujcms_visit_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-139', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:16', 886, 'EXECUTED', '8:a129573ff5f511db0729b33046cccd61', 'modifyDataType columnName=site_id_, tableName=ujcms_visit_trend', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-140', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 887, 'EXECUTED', '8:e6a2a60bb011b391198319ef52240bbf', 'modifyDataType columnName=site_id_, tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-141', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 888, 'EXECUTED', '8:1ea14e19adb64bd5331469aec4b599c0', 'modifyDataType columnName=src_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-142', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 889, 'EXECUTED', '8:40dba90d0b3209aa66c9f3caa5b80c2d', 'modifyDataType columnName=survey_feedback_id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-143', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 890, 'EXECUTED', '8:51d4b04db33dddcfc9614d1e7649192a', 'modifyDataType columnName=survey_feedback_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-144', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 891, 'EXECUTED', '8:e6d2f4752914d8857dcdcb1b94dba5e4', 'modifyDataType columnName=survey_id_, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-145', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 892, 'EXECUTED', '8:622f3f0ecda3ed2ba14342594469d396', 'modifyDataType columnName=survey_id_, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-146', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 893, 'EXECUTED', '8:a998ecd3340a7ace9dd735e5106c68ef', 'modifyDataType columnName=survey_id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-147', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 894, 'EXECUTED', '8:2f7be1686a7df29ecf7ed7c454817b47', 'modifyDataType columnName=survey_id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-148', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 895, 'EXECUTED', '8:add8d78253829ae8a611638240294dcb', 'modifyDataType columnName=survey_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-149', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 896, 'EXECUTED', '8:c103fac96ef8107e256f772fa27281d7', 'modifyDataType columnName=survey_item_id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-150', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 897, 'EXECUTED', '8:b09ebd64959a472464a72550754d5f12', 'modifyDataType columnName=survey_item_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-151', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 898, 'EXECUTED', '8:029fd6a33760b1fdbf462844081c0684', 'modifyDataType columnName=survey_option_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-152', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 899, 'EXECUTED', '8:88b90ca3a06435086c4f62fab21254eb', 'modifyDataType columnName=tag_id_, tableName=ujcms_article_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-153', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 900, 'EXECUTED', '8:219daefa60148fcf42df02189e1af5d6', 'modifyDataType columnName=to_article_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-154', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 901, 'EXECUTED', '8:0146d0ee51bb72e5d1b5f295960572e8', 'modifyDataType columnName=to_site_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-155', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 902, 'EXECUTED', '8:c262248f600de8ea23b0b33ead0043cc', 'modifyDataType columnName=type_id_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-156', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 903, 'EXECUTED', '8:94d843bb413d71d07c603215b87cfaa0', 'modifyDataType columnName=type_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-157', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 904, 'EXECUTED', '8:b6481fb48f120c298cb6c25d7d3271e7', 'modifyDataType columnName=user_id_, tableName=ujcms_action', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-158', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:17', 905, 'EXECUTED', '8:5bb7e90a11978b8fc1000b17fb071ca2', 'modifyDataType columnName=user_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-159', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 906, 'EXECUTED', '8:9a9562ebd2016c0edbb3572e2de08acf', 'modifyDataType columnName=user_id_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-160', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 907, 'EXECUTED', '8:74397ac29b76420e761b2b8068823c0c', 'modifyDataType columnName=user_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-161', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 908, 'EXECUTED', '8:e10fde426614692580b63352178d586b', 'modifyDataType columnName=user_id_, tableName=ujcms_login_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-162', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 909, 'EXECUTED', '8:1eb058ec1a77e6c2a78aa2e23a0f7ccb', 'modifyDataType columnName=user_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-163', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 910, 'EXECUTED', '8:76033c9c62d10a5b25dbd3be7f08a88a', 'modifyDataType columnName=user_id_, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-164', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 911, 'EXECUTED', '8:8fade78f54722bf850dc9b398bb93bd9', 'modifyDataType columnName=user_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-165', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 912, 'EXECUTED', '8:21d39b1cbbf065c704becd92453f2b35', 'modifyDataType columnName=user_id_, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-166', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 913, 'EXECUTED', '8:2240055e987c341248b7fe44b7de72b1', 'modifyDataType columnName=user_id_, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-167', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 914, 'EXECUTED', '8:0b53c378a4702d540387d22d2e7b7001', 'modifyDataType columnName=user_id_, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-168', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 915, 'EXECUTED', '8:f88e1b2fd8681fd0d6a801bf90b5d64a', 'modifyDataType columnName=user_id_, tableName=ujcms_user_openid', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-169', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 916, 'EXECUTED', '8:b8b308b3ea96fc4a7bbcbca1fa900857', 'modifyDataType columnName=user_id_, tableName=ujcms_user_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-170', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 917, 'EXECUTED', '8:5aa819d78be71c986ebe4bfd3592ffed', 'modifyDataType columnName=user_id_, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-171', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 918, 'EXECUTED', '8:c51f71b400c8033c27c3b4e66b3aad8c', 'modifyDataType columnName=user_id_, tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714564266529-172', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 919, 'EXECUTED', '8:2a716428efa914de2aecff67ce92733d', 'modifyDataType columnName=vote_id_, tableName=ujcms_vote_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 920, 'EXECUTED', '8:7d0b2ccb35fd58979dcae4bb68d6288e', 'addNotNullConstraint columnName=article_model_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 921, 'EXECUTED', '8:184cfac67c067837018a7ab9a86e36cf', 'addNotNullConstraint columnName=attachment_id_, tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-10', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 922, 'EXECUTED', '8:5e865c51a536d779f3d7b7eb9c416529', 'addNotNullConstraint columnName=block_id_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-12', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:18', 923, 'EXECUTED', '8:bdbcff4720333649a1de6f570ca2f1a7', 'addNotNullConstraint columnName=channel_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-17', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 924, 'EXECUTED', '8:bf7807fd1374bd51d5391650be27fea7', 'addNotNullConstraint columnName=channel_model_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-19', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 925, 'EXECUTED', '8:52a77731d68d6b7237a1b36a4c483d41', 'addNotNullConstraint columnName=default_site_id_, tableName=ujcms_config', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-24', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 926, 'EXECUTED', '8:ee31e0c0a7e016669b35ea36e3354df9', 'addNotNullConstraint columnName=from_article_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-26', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 927, 'EXECUTED', '8:50fb94f94895a5360b0e55291b8a2ce2', 'addNotNullConstraint columnName=from_site_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-29', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 928, 'EXECUTED', '8:70b472f741e3e050488a0474a945e5b2', 'addNotNullConstraint columnName=group_id_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-69', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 929, 'EXECUTED', '8:3abfed7c439a7f466208c4a172d010f5', 'addNotNullConstraint columnName=item_id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-71', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 930, 'EXECUTED', '8:65877b37398ce7b7a97ff781476cb99c', 'addNotNullConstraint columnName=model_id_, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-73', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 931, 'EXECUTED', '8:9ad4f682689adfa15faa07a8ff447e06', 'addNotNullConstraint columnName=model_id_, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-75', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 932, 'EXECUTED', '8:9e4c23914b24acb62d2074259bd13cbc', 'addNotNullConstraint columnName=modified_user_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-77', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 933, 'EXECUTED', '8:230d9f77f230adba26aaf03c4ad67040', 'addNotNullConstraint columnName=modified_user_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-80', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 934, 'EXECUTED', '8:88ddecd47726b4ed7c25356873e7ba70', 'addNotNullConstraint columnName=order_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-82', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 935, 'EXECUTED', '8:5095e31fa50130f17b761a8d40ed5ebd', 'addNotNullConstraint columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-84', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 936, 'EXECUTED', '8:8366df7b7396e4cd0b6f9f7a0efe58e0', 'addNotNullConstraint columnName=order_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-86', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 937, 'EXECUTED', '8:4262fa7da1b42b5ffc8c3adbf4dbc3aa', 'addNotNullConstraint columnName=order_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-88', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 938, 'EXECUTED', '8:698db7a01574351917e9553bb1dd507c', 'addNotNullConstraint columnName=order_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-90', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 939, 'EXECUTED', '8:87f681dcecafa59c61995c0805f6ae27', 'addNotNullConstraint columnName=order_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-92', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 940, 'EXECUTED', '8:8f86961b7df628e708354377748915cf', 'addNotNullConstraint columnName=order_, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-94', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 941, 'EXECUTED', '8:d801b3537f78820c09f5842c2d846d4a', 'addNotNullConstraint columnName=org_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-96', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 942, 'EXECUTED', '8:f62cb1a7f9c3786525e6789e57889392', 'addNotNullConstraint columnName=org_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-100', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 943, 'EXECUTED', '8:9898bd075354a7b1f64465ee5f8e1ba8', 'addNotNullConstraint columnName=org_id_, tableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-102', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:19', 944, 'EXECUTED', '8:8a0eb4f133ea4a86941896704bfee393', 'addNotNullConstraint columnName=org_id_, tableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-111', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 945, 'EXECUTED', '8:fdb9969afab4c2abfe9fb58e860d385a', 'addNotNullConstraint columnName=refer_id_, tableName=ujcms_attachment_refer', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-118', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 946, 'EXECUTED', '8:b0ca8de85113b99ced06158a3813ae2a', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_action', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-120', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 947, 'EXECUTED', '8:765e5be81edab344ebfc76510c2353ab', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-122', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 948, 'EXECUTED', '8:1525c74f185fa1eec594787e0b1f67b5', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-125', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 949, 'EXECUTED', '8:bec55ae140e608aa584c2edde872c0b9', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-127', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 950, 'EXECUTED', '8:35139fb8da4748e81af9bd1ba894e2d9', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-130', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 951, 'EXECUTED', '8:0d984a376d8f347c29388272da5679f7', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-132', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 952, 'EXECUTED', '8:3e10c55a5076b77af56ee646f757e21f', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_form_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-134', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 953, 'EXECUTED', '8:0f69cd730bd0136c5805ce8fb2d91710', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_group_access', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-136', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 954, 'EXECUTED', '8:58966aa1162556c355452db165d8c980', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-140', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 955, 'EXECUTED', '8:8ea3f45f1799f7de3ca7a73715b91c45', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-142', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 956, 'EXECUTED', '8:356fe35d059841c7bf1720e9d0d452c5', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-145', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 957, 'EXECUTED', '8:429c2618657c3ea549ef5be1fe07c647', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_role_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-147', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 958, 'EXECUTED', '8:2e29e900519b1312606c110021be7e81', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_role_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-149', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 959, 'EXECUTED', '8:d38e435bdf2d00fb2e2e39e2e5dbc399', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_role_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-151', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 960, 'EXECUTED', '8:d2292a290c4b32b849360b4fddd67ddb', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-153', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 961, 'EXECUTED', '8:71b063c018e262d1b809d524a161f41b', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-155', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 962, 'EXECUTED', '8:da1afa3331198426250c69e7433d6851', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-157', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 963, 'EXECUTED', '8:65341693966e762449d6d71f8e6a1f15', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-159', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 964, 'EXECUTED', '8:865442ffeeef8335d363a5c130fd3a5a', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-161', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 965, 'EXECUTED', '8:1a350fbf0ec7b16c1603eb8efb34656d', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-163', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:20', 966, 'EXECUTED', '8:da19d769fb37bda52d7d36b28b0b686a', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-165', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 967, 'EXECUTED', '8:593b1b3a61d0c5d4553e03f8706288d9', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_visit_page', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-167', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 968, 'EXECUTED', '8:740a1ea21dc68c643bc3f10be08c8a25', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_visit_stat', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-169', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 969, 'EXECUTED', '8:c9ab683e00e5fd5e5b90990b21de15f9', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_visit_trend', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-171', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 970, 'EXECUTED', '8:a48aa61b97dafcb0921a53ff1f75158a', 'addNotNullConstraint columnName=site_id_, tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-174', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 971, 'EXECUTED', '8:0fefe744acefc405ef8ef8e9ad5e3c5e', 'addNotNullConstraint columnName=survey_feedback_id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-176', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 972, 'EXECUTED', '8:a72f245451f7661db9f062a4af600f5f', 'addNotNullConstraint columnName=survey_feedback_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-178', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 973, 'EXECUTED', '8:507def7433037c2076a9f38ed127a4e9', 'addNotNullConstraint columnName=survey_id_, tableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-180', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 974, 'EXECUTED', '8:fa294a4c06962a09ac8c362c4f88f651', 'addNotNullConstraint columnName=survey_id_, tableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-182', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 975, 'EXECUTED', '8:43d399beeb8a5b1168094fbe9ab4998f', 'addNotNullConstraint columnName=survey_id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-184', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 976, 'EXECUTED', '8:be0355c970154ff90b1454379ac1719b', 'addNotNullConstraint columnName=survey_id_, tableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-186', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 977, 'EXECUTED', '8:e5b00137087b8c6466ba4077ca3d753a', 'addNotNullConstraint columnName=survey_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-188', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 978, 'EXECUTED', '8:e08d1a19b5c26aeeafd26ebccb38afc3', 'addNotNullConstraint columnName=survey_item_id_, tableName=ujcms_survey_item_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-190', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 979, 'EXECUTED', '8:e12ed45b05ca7b97290e8dd18b0bf5a4', 'addNotNullConstraint columnName=survey_item_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-192', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 980, 'EXECUTED', '8:6d766d7120cfa8ce7faed166735a3747', 'addNotNullConstraint columnName=survey_option_id_, tableName=ujcms_survey_option_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-195', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 981, 'EXECUTED', '8:ad24236494b6ac96fa7f93fbfe2e1669', 'addNotNullConstraint columnName=to_article_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-197', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 982, 'EXECUTED', '8:a4aaf448f098cbf608c73dacf98b6b6b', 'addNotNullConstraint columnName=to_site_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-199', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 983, 'EXECUTED', '8:5eda8e330df67bab5c70ecabbf813d8a', 'addNotNullConstraint columnName=type_id_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-201', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 984, 'EXECUTED', '8:6800a4be6b29c0568a3fdd5b5beb4331', 'addNotNullConstraint columnName=type_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-204', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 985, 'EXECUTED', '8:7216a3b5d92a02cbf43512ace1e508d7', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-206', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 986, 'EXECUTED', '8:a772660ee13755a0c8a9f79632cacf7d', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-208', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:21', 987, 'EXECUTED', '8:2ba25bfa07b902dd4a2e94669e7d4bf6', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_form', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-211', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 988, 'EXECUTED', '8:f410e5442531746e9e3dd7ae57646e09', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_message_board', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-213', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 989, 'EXECUTED', '8:7001a2688082aa307cde5902ec807e49', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_operation_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-215', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 990, 'EXECUTED', '8:381334c84e1585d9c11eff385489c085', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_push', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-218', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 991, 'EXECUTED', '8:1a22e30d1fb17ea7c69f89202c38ebbf', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-220', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 992, 'EXECUTED', '8:f1f797afd77aa98687b1b8804b99152c', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_task', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-225', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 993, 'EXECUTED', '8:c7eee863c6b9282444ad9186653a5163', 'addNotNullConstraint columnName=user_id_, tableName=ujcms_visit_log', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714580745081-227', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 994, 'EXECUTED', '8:e7208f2d0def754ca105928f2e08e69d', 'addNotNullConstraint columnName=vote_id_, tableName=ujcms_vote_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-66', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 995, 'EXECUTED', '8:63a7a3e252e508b39976509cd6a62a94', 'addDefaultValue columnName=order_, tableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-68', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 996, 'EXECUTED', '8:edc24c655039647d7f07ae813214250a', 'addDefaultValue columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-70', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 997, 'EXECUTED', '8:f13e1dc57e664c260b3477a11e52cb87', 'addDefaultValue columnName=order_, tableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-72', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 998, 'EXECUTED', '8:cc2b22ed3086d9c3b1861d50f756d674', 'addDefaultValue columnName=order_, tableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-74', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 999, 'EXECUTED', '8:631aa8b0485d0b1b3847c1af2529e272', 'addDefaultValue columnName=order_, tableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-76', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1000, 'EXECUTED', '8:4bbc60d3035e5c13ae7ed090b0a86915', 'addDefaultValue columnName=order_, tableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714581570298-78', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1001, 'EXECUTED', '8:1d5c3800d7d3ae86c35d8f9b1216d4e1', 'addDefaultValue columnName=order_, tableName=ujcms_user_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1002, 'EXECUTED', '8:c693bf129a7d61dba1a56f8e4d977f78', 'addForeignKeyConstraint baseTableName=ujcms_action, constraintName=fk_action_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1003, 'EXECUTED', '8:4aef1903ed0d6a78de9104d2f1671531', 'addForeignKeyConstraint baseTableName=ujcms_action, constraintName=fk_action_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1004, 'EXECUTED', '8:65ea15c23c6363fd25a3495344f96bcd', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1005, 'EXECUTED', '8:23064ad8890d74d944bf4794b311e8a3', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-5', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1006, 'EXECUTED', '8:901cec089c773fe2dc39908ab008f818', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_src, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-6', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1007, 'EXECUTED', '8:15dd7c8efd75ee882920bbbeed4f7417', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-7', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:22', 1008, 'EXECUTED', '8:611a81164ba6f067bee3b41ff071fdd2', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_user_modified, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-8', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1009, 'EXECUTED', '8:b86bc83d17cb1c1533655c9ea758ae0f', 'addForeignKeyConstraint baseTableName=ujcms_article, constraintName=fk_article_website, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-9', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1010, 'EXECUTED', '8:f17f75060becfb7e4d4f2f3c83dae821', 'addForeignKeyConstraint baseTableName=ujcms_article_ext, constraintName=fk_articleext_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-10', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1011, 'EXECUTED', '8:ec32c5fb039506c86ae7d8781f0d1e0d', 'addForeignKeyConstraint baseTableName=ujcms_article_tag, constraintName=fk_articletag_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-11', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1012, 'EXECUTED', '8:ea6d9eeb6f13407bbbfc7cf027cc1460', 'addForeignKeyConstraint baseTableName=ujcms_article_tag, constraintName=fk_articletag_tag, referencedTableName=ujcms_tag', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-12', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1013, 'EXECUTED', '8:379ede00ec0fc8d547de1dc75b1c02b0', 'addForeignKeyConstraint baseTableName=ujcms_attachment, constraintName=fk_attachment_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-13', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1014, 'EXECUTED', '8:32099cb3912cdaa0c25226f7b364f9d0', 'addForeignKeyConstraint baseTableName=ujcms_attachment, constraintName=fk_attachment_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-14', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1015, 'EXECUTED', '8:a746b79a99b4f978f3086bbf0e671996', 'addForeignKeyConstraint baseTableName=ujcms_attachment_refer, constraintName=fk_attachmentrefer_attachment, referencedTableName=ujcms_attachment', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-15', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1016, 'EXECUTED', '8:9ca8a046da88f8b58e0b4a0be5879e25', 'addForeignKeyConstraint baseTableName=ujcms_block, constraintName=fk_block_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-16', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1017, 'EXECUTED', '8:f3a2a5f34f767e648fa3419f40665cd8', 'addForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_article, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-17', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1018, 'EXECUTED', '8:99483bf2fe331c5fbedcb0dc2dd315ce', 'addForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_block, referencedTableName=ujcms_block', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-18', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1019, 'EXECUTED', '8:99fdc7d2032263cb0f097cf9daafe603', 'addForeignKeyConstraint baseTableName=ujcms_block_item, constraintName=fk_blockitem_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-19', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1020, 'EXECUTED', '8:1e614a6d5111d0e40a823b93da6d4e23', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_model_article, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-20', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:23', 1021, 'EXECUTED', '8:86cd074ad4d4362fdcecd98983ee8e96', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_model_channel, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-21', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1022, 'EXECUTED', '8:a7e7d5558235167b3b52faa17e86126e', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_parent, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-22', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1023, 'EXECUTED', '8:022c3bc9b680444df778ba3872f9975d', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_performance_type, referencedTableName=ujcms_performance_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-23', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1024, 'EXECUTED', '8:529e03010d34734abe93df7927602a91', 'addForeignKeyConstraint baseTableName=ujcms_channel, constraintName=fk_channel_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-24', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1025, 'EXECUTED', '8:cae8cd913dcc64c40a086ede59bcdbfb', 'addForeignKeyConstraint baseTableName=ujcms_channel_ext, constraintName=fk_channelext_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-25', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1026, 'EXECUTED', '8:2e08628ea0009171b46a28d9017b11dc', 'addForeignKeyConstraint baseTableName=ujcms_channel_tree, constraintName=fk_channeltree_ancestor, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-26', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1027, 'EXECUTED', '8:6361bfc11070e47043bc128e8ebac587', 'addForeignKeyConstraint baseTableName=ujcms_channel_tree, constraintName=fk_channeltree_descendant, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-27', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1028, 'EXECUTED', '8:1d445d5074ba1f90c34e81382fbc6128', 'addForeignKeyConstraint baseTableName=ujcms_dict, constraintName=fk_dict_dicttype, referencedTableName=ujcms_dict_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-28', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1029, 'EXECUTED', '8:54720fd73d3e612b5a026d0e6de85fd3', 'addForeignKeyConstraint baseTableName=ujcms_dict, constraintName=fk_dict_parent, referencedTableName=ujcms_dict', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-29', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1030, 'EXECUTED', '8:99af812a2e7804c66e7f4332acd1364f', 'addForeignKeyConstraint baseTableName=ujcms_dict_type, constraintName=fk_dicttype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-30', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1031, 'EXECUTED', '8:aa6005857eef7deebd6d04ef70d27831', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-31', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1032, 'EXECUTED', '8:6900818a2c54b9d78123417c302e7966', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-32', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1033, 'EXECUTED', '8:b73fb4ab546502ec053d1bd07bc7a937', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-33', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1034, 'EXECUTED', '8:671b8032492608c29568290b27c219ee', 'addForeignKeyConstraint baseTableName=ujcms_form, constraintName=fk_form_user_modified, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-34', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1035, 'EXECUTED', '8:e591244eb5c40955eab4b9363bbf7eeb', 'addForeignKeyConstraint baseTableName=ujcms_form_type, constraintName=fk_formtype_model, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-35', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1036, 'EXECUTED', '8:ce727ac119a2f2e86d56575b46ffc7f0', 'addForeignKeyConstraint baseTableName=ujcms_form_type, constraintName=fk_formtype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-36', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:24', 1037, 'EXECUTED', '8:488adee3776724929d7a17e0b0467e43', 'addForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-37', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1038, 'EXECUTED', '8:849dbfeb17e4ad71591ed3a6d91b1091', 'addForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_group, referencedTableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-38', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1039, 'EXECUTED', '8:38643ff8b69ba872a7a4c09a50f5804c', 'addForeignKeyConstraint baseTableName=ujcms_group_access, constraintName=fk_groupaccess_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-39', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1040, 'EXECUTED', '8:e49d8e05b574cbf784101e657242cb8c', 'addForeignKeyConstraint baseTableName=ujcms_login_log, constraintName=fk_loginlog_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-40', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1041, 'EXECUTED', '8:a80ae602d2ef951cdfd9a4e9155399bf', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-41', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1042, 'EXECUTED', '8:0373269cced7a4562bd2bc6fbd539afa', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_type, referencedTableName=ujcms_message_board_type', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-42', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1043, 'EXECUTED', '8:deb237164f1a499d494c189404473dac', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-43', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1044, 'EXECUTED', '8:bd598f5d2c8fefdf9cdd16be316b0fb8', 'addForeignKeyConstraint baseTableName=ujcms_message_board, constraintName=fk_messageboard_user_reply, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-44', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1045, 'EXECUTED', '8:8d6b75d0e75d6afdb18ba15c7250114c', 'addForeignKeyConstraint baseTableName=ujcms_message_board_type, constraintName=fk_messageboardtype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-45', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1046, 'EXECUTED', '8:f48a599eba32f0f881ece585c16724ac', 'addForeignKeyConstraint baseTableName=ujcms_operation_log, constraintName=fk_operationlog_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-46', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1047, 'EXECUTED', '8:e7e59fa2f8d287a8bec74fb1dacdd9b3', 'addForeignKeyConstraint baseTableName=ujcms_operation_log, constraintName=fk_operationlog_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-47', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1048, 'EXECUTED', '8:82a2087616daf5abb3c9719c5f91cec2', 'addForeignKeyConstraint baseTableName=ujcms_org, constraintName=fk_org_parent, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-48', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1049, 'EXECUTED', '8:c7d46d7a1d42e3eb5f73633f07530a8f', 'addForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-49', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1050, 'EXECUTED', '8:466fd12197bc98111b8eacaf738ecc32', 'addForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-50', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1051, 'EXECUTED', '8:e08e4d6f8d2b984e8af464b02fcc1ff3', 'addForeignKeyConstraint baseTableName=ujcms_org_article, constraintName=fk_orgarticle_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-51', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1052, 'EXECUTED', '8:c0cbc89149e62de5934871eda579e92d', 'addForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-52', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1053, 'EXECUTED', '8:f168a10ac8b780e31d249b4733b92a60', 'addForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-53', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1054, 'EXECUTED', '8:2358cb53e95e167f0d60fcc1b00a004a', 'addForeignKeyConstraint baseTableName=ujcms_org_channel, constraintName=fk_orgchannel_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-54', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:25', 1055, 'EXECUTED', '8:5ca8963e1a3cff07611ba7b8737cfa5c', 'addForeignKeyConstraint baseTableName=ujcms_org_perm, constraintName=fk_orgperm_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-55', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1056, 'EXECUTED', '8:61eca06f93f42df52b689fab6d8b120d', 'addForeignKeyConstraint baseTableName=ujcms_org_perm, constraintName=fk_orgperm_perm, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-56', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1057, 'EXECUTED', '8:fe21a3586660f9e9a29f3c452f2c9bdc', 'addForeignKeyConstraint baseTableName=ujcms_org_tree, constraintName=fk_orgtree_ancestor, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-57', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1058, 'EXECUTED', '8:cb4c764694ecab7ab3667a6d20250916', 'addForeignKeyConstraint baseTableName=ujcms_org_tree, constraintName=fk_orgtree_descendant, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-58', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1059, 'EXECUTED', '8:dad92df1f9a28aa67c0f27e0aab6ba73', 'addForeignKeyConstraint baseTableName=ujcms_performance_type, constraintName=fk_performancetype_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-59', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1060, 'EXECUTED', '8:6c9e17974a7484f76df78172b8bc4e6b', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_article_from, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-60', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1061, 'EXECUTED', '8:cee0ef3abe402ca762a7725ef5e8ec9d', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_article_to, referencedTableName=ujcms_article', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-61', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1062, 'EXECUTED', '8:0a5a2214112241226c7da7b4bd70b769', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_site_from, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-62', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1063, 'EXECUTED', '8:d20da6260206c1ba8e1444fe636c2e4c', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_site_to, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-63', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1064, 'EXECUTED', '8:ea9d85e9137ffaf77fe702305bf2edb2', 'addForeignKeyConstraint baseTableName=ujcms_push, constraintName=fk_push_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-64', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1065, 'EXECUTED', '8:e72083786268e25d78524e7226acd675', 'addForeignKeyConstraint baseTableName=ujcms_role, constraintName=fk_role_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-65', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1066, 'EXECUTED', '8:f5bef1fb7da1a52af9edaf84bb85f62d', 'addForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-66', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1067, 'EXECUTED', '8:300b018342788cb2ca194018f90fb4ca', 'addForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-67', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1068, 'EXECUTED', '8:a10fcd99ec27947bcd0456e86f7781bb', 'addForeignKeyConstraint baseTableName=ujcms_role_article, constraintName=fk_rolearticle_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-68', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1069, 'EXECUTED', '8:0515d65bf5f627bc4d434a0df46b7d2b', 'addForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_channel, referencedTableName=ujcms_channel', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-69', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1070, 'EXECUTED', '8:81eb988ad14dc57670ba4129cef1d323', 'addForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-70', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:26', 1071, 'EXECUTED', '8:c0fa55c2525b0b366627cabfc000402e', 'addForeignKeyConstraint baseTableName=ujcms_role_channel, constraintName=fk_rolechannel_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-71', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1072, 'EXECUTED', '8:cbe59d8746d2cb3bf998db66397940ea', 'addForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-72', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1073, 'EXECUTED', '8:b7943ac362950928a56a04cc7928f370', 'addForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-73', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1074, 'EXECUTED', '8:b04f61be01d0c47bca1f05a3a9a12f90', 'addForeignKeyConstraint baseTableName=ujcms_role_org, constraintName=fk_roleorg_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-74', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1075, 'EXECUTED', '8:53cb0f2cc10544427bbb5e0551d21eaf', 'addForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_model, referencedTableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-75', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1076, 'EXECUTED', '8:3fe66e5b8677a415b07980db0a53f605', 'addForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-76', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1077, 'EXECUTED', '8:ea49f37fc880e3c069d51271c6d9515e', 'addForeignKeyConstraint baseTableName=ujcms_site, constraintName=fk_site_parent, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-77', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1078, 'EXECUTED', '8:2ee7d881cb27a1b1214e7bf771da1fbe', 'addForeignKeyConstraint baseTableName=ujcms_site_tree, constraintName=fk_sitetree_ancestor, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-78', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1079, 'EXECUTED', '8:3b80625257cbfd4f45512c0168173280', 'addForeignKeyConstraint baseTableName=ujcms_site_tree, constraintName=fk_sitetree_descendant, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-79', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1080, 'EXECUTED', '8:84809a0f7520d79ca1e5e68ee524c692', 'addForeignKeyConstraint baseTableName=ujcms_survey, constraintName=fk_survey_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-80', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1081, 'EXECUTED', '8:ef311618c69cf366df653d3269b4603b', 'addForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-81', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1082, 'EXECUTED', '8:2615d4d07a37b5eafdbeed82bd6b7569', 'addForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-82', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1083, 'EXECUTED', '8:877f30bcb63ded2e256ed6304db3ba36', 'addForeignKeyConstraint baseTableName=ujcms_survey_feedback, constraintName=fk_surveyfeedback_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-83', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1084, 'EXECUTED', '8:4dbcfc0db4423e9bb98c05b0d01c027c', 'addForeignKeyConstraint baseTableName=ujcms_survey_item, constraintName=fk_surveyitem_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-84', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1085, 'EXECUTED', '8:66c9842c244d24a3d7c2f8b0b6e5b074', 'addForeignKeyConstraint baseTableName=ujcms_survey_item, constraintName=fk_surveyitem_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-85', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:27', 1086, 'EXECUTED', '8:ec76e717b768e7c9cc546a43941b8f02', 'addForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_feed, referencedTableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-86', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1087, 'EXECUTED', '8:f35a69c7ef95c891e07f16bea262a469', 'addForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-87', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1088, 'EXECUTED', '8:b46d9489cbccc5ad0374cb93645cc248', 'addForeignKeyConstraint baseTableName=ujcms_survey_item_feedback, constraintName=fk_surveyitemfeed_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-88', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1089, 'EXECUTED', '8:9c18a36285dfc3a2ca36f0f68081c329', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-89', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1090, 'EXECUTED', '8:5d7a5c06d7f4b51fe1aa8b79cbde9296', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-90', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1091, 'EXECUTED', '8:b9f829bf9d3768011bf1cd5c55e333ed', 'addForeignKeyConstraint baseTableName=ujcms_survey_option, constraintName=fk_surveyoption_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-91', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1092, 'EXECUTED', '8:23f2fa36f9901089d4bb93bba8d9e928', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_feed, referencedTableName=ujcms_survey_feedback', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-92', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1093, 'EXECUTED', '8:01d656c6929d70297af3856c09e84c02', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_item, referencedTableName=ujcms_survey_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-93', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1094, 'EXECUTED', '8:529ce6def9971b72a60862697783f03e', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_option, referencedTableName=ujcms_survey_option', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-94', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1095, 'EXECUTED', '8:b1a3cb2f3252dfd8f6cecef66007c29d', 'addForeignKeyConstraint baseTableName=ujcms_survey_option_feedback, constraintName=fk_surveyoptionfeed_survey, referencedTableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-95', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1096, 'EXECUTED', '8:1fa44af6ffe1c71f79dbce1b4d850aeb', 'addForeignKeyConstraint baseTableName=ujcms_tag, constraintName=fk_tag_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-96', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1097, 'EXECUTED', '8:bc421aa556dae9a7debd667cab82bec7', 'addForeignKeyConstraint baseTableName=ujcms_tag, constraintName=fk_tag_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-97', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1098, 'EXECUTED', '8:aef8626dc135c9b43fe2612f4e6573db', 'addForeignKeyConstraint baseTableName=ujcms_task, constraintName=fk_task_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-98', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1099, 'EXECUTED', '8:25bba2d8a8e9631ed4628dc532729f9c', 'addForeignKeyConstraint baseTableName=ujcms_task, constraintName=fk_task_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-99', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1100, 'EXECUTED', '8:2b7114f9315397b596bfb6729d97643c', 'addForeignKeyConstraint baseTableName=ujcms_user, constraintName=fk_user_group, referencedTableName=ujcms_group', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-100', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1101, 'EXECUTED', '8:f6615b34348b9d6bfd22bc6a5f241ff5', 'addForeignKeyConstraint baseTableName=ujcms_user, constraintName=fk_user_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-101', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:28', 1102, 'EXECUTED', '8:0d8e2426676619569969e4b1ecc81b0b', 'addForeignKeyConstraint baseTableName=ujcms_user_ext, constraintName=fk_userext_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-102', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1103, 'EXECUTED', '8:09b208548138f4f252c6df5660466f9a', 'addForeignKeyConstraint baseTableName=ujcms_user_openid, constraintName=fk_useropenid_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-103', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1104, 'EXECUTED', '8:d31dca4b872dbe3a971fb71193919fb2', 'addForeignKeyConstraint baseTableName=ujcms_user_org, constraintName=fk_userorg_org, referencedTableName=ujcms_org', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-104', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1105, 'EXECUTED', '8:d002165051a975dd4bfe52174a6102c5', 'addForeignKeyConstraint baseTableName=ujcms_user_org, constraintName=fk_userorg_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-105', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1106, 'EXECUTED', '8:663005336304df0441fbab615a02e0c4', 'addForeignKeyConstraint baseTableName=ujcms_user_role, constraintName=fk_userrole_role, referencedTableName=ujcms_role', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-106', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1107, 'EXECUTED', '8:fbba1312f211f73b6b4a5ec42b7ff63e', 'addForeignKeyConstraint baseTableName=ujcms_user_role, constraintName=fk_userrole_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-107', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1108, 'EXECUTED', '8:ae9a5b0ff41cf5c9557677664b57eaa9', 'addForeignKeyConstraint baseTableName=ujcms_visit_log, constraintName=fk_visit_log_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-108', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1109, 'EXECUTED', '8:eb33e77a4ba1a74148d43698a2b8e495', 'addForeignKeyConstraint baseTableName=ujcms_visit_log, constraintName=fk_visit_log_user, referencedTableName=ujcms_user', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-109', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1110, 'EXECUTED', '8:c21f4e47e4fcf93036d0fd6ab17d286e', 'addForeignKeyConstraint baseTableName=ujcms_visit_page, constraintName=fk_visit_page_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-110', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1111, 'EXECUTED', '8:2a9c103901c9dc624dfaf04913f319e8', 'addForeignKeyConstraint baseTableName=ujcms_visit_stat, constraintName=fk_visit_stat_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-111', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1112, 'EXECUTED', '8:2824f8708477349a3d452c2c6e3408f4', 'addForeignKeyConstraint baseTableName=ujcms_visit_trend, constraintName=fk_visit_trend_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-112', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1113, 'EXECUTED', '8:b536aa3b4f7a1deccc7c02e0f2864c24', 'addForeignKeyConstraint baseTableName=ujcms_vote, constraintName=fk_vote_site, referencedTableName=ujcms_site', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714976084115-113', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1114, 'EXECUTED', '8:6686dbbb6ea056d86b46cad7326f82d8', 'addForeignKeyConstraint baseTableName=ujcms_vote_option, constraintName=fk_voteoption_vote, referencedTableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714986930344-13', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1115, 'EXECUTED', '8:ae14388ce25cca95fa1306f817d2192f', 'addColumn tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714986930344-14', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1116, 'EXECUTED', '8:50549dfc1632853870dbe940e96ba41c', 'addColumn tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714986930344-15', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1117, 'EXECUTED', '8:c17a1400ef88c47e86de914975581123', 'dropColumn columnName=order_date_, tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714986930344-16', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1118, 'EXECUTED', '8:6267e282c527a6a0111a303b23617499', 'dropColumn columnName=order_date_, tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714986930344-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1119, 'EXECUTED', '8:713485f8baffa0e2b01380dc5a0b3605', 'modifyDataType columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714986930344-4', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1120, 'EXECUTED', '8:f623a9d62652a0b394eef138d80cf3c0', 'dropDefaultValue columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714989536193-3', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1121, 'EXECUTED', '8:b0b6c75792638249c43f52bcbc2feb41', 'addNotNullConstraint columnName=order_, tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714989536194-1-sql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1122, 'EXECUTED', '8:96138d3debff9e82c693c8551e789304', 'update tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714989536194-2-sql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1123, 'EXECUTED', '8:ccb509867d9ea91c3ecc845a80faf920', 'update tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714990315440-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1124, 'EXECUTED', '8:bec6cab730a0cf8e59f623e64cea9df6', 'addNotNullConstraint columnName=order_, tableName=ujcms_survey', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714990315440-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:29', 1125, 'EXECUTED', '8:254c1f8920b7df075478f1cb5688f9c8', 'addNotNullConstraint columnName=order_, tableName=ujcms_vote', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1714990315440-1-sql', 'PONY', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:30', 1126, 'EXECUTED', '8:81ac76ffded3545c16d0fc30e27dceb2', 'update tableName=ujcms_block_item', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1718175285159-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:30', 1127, 'EXECUTED', '8:ceee5c49529a70f7931a2e40a0ceab26', 'modifyDataType columnName=order_, tableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1718175285159-2', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:30', 1128, 'EXECUTED', '8:0f83f5af91755d77550d73c352f0c89c', 'addDefaultValue columnName=order_, tableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1718175711216-1', 'PONY (generated)', '/db/changelog/db.changelog-9.5.yaml', '2024-09-13 17:28:30', 1129, 'EXECUTED', '8:35bad1551dec77c036083ca2b684c85c', 'addNotNullConstraint columnName=order_, tableName=ujcms_model', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1718533128302-1', 'PONY (generated)', '/db/changelog/db.changelog-9.6.yaml', '2024-09-13 17:28:30', 1130, 'EXECUTED', '8:28c4ae02872411979f2d5258f21816d0', 'setTableRemarks tableName=ujcms_example', '', NULL, '4.5.0', NULL, NULL, '6219657146');
INSERT INTO `databasechangelog` VALUES ('1720001803357-1', 'PONY (generated)', '/db/changelog/db.changelog-9.6.yaml', '2024-09-13 17:28:30', 1131, 'EXECUTED', '8:b0c7be573a86e99cc0e84abc51ac67ac', 'createTable tableName=ujcms_import_data', '', NULL, '4.5.0', NULL, NULL, '6219657146');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for flw_channel_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_channel_definition`;
CREATE TABLE `flw_channel_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CHANNEL_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_channel_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ev_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
CREATE TABLE `flw_ev_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangelog
-- ----------------------------
INSERT INTO `flw_ev_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2024-09-13 17:28:35', 1, 'EXECUTED', '8:1b0c48c9cf7945be799d868a2626d687', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', NULL, '4.5.0', NULL, NULL, '6219714893');
INSERT INTO `flw_ev_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2024-09-13 17:28:35', 2, 'EXECUTED', '8:0ea825feb8e470558f0b5754352b9cda', 'addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION', '', NULL, '4.5.0', NULL, NULL, '6219714893');
INSERT INTO `flw_ev_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2024-09-13 17:28:35', 3, 'EXECUTED', '8:3c2bb293350b5cbe6504331980c9dcee', 'customChange', '', NULL, '4.5.0', NULL, NULL, '6219714893');

-- ----------------------------
-- Table structure for flw_ev_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
CREATE TABLE `flw_ev_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangeloglock
-- ----------------------------
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for flw_event_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_definition`;
CREATE TABLE `flw_event_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_EVENT_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_deployment
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_deployment`;
CREATE TABLE `flw_event_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_resource
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_resource`;
CREATE TABLE `flw_event_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_resource
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch`;
CREATE TABLE `flw_ru_batch`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch_part
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch_part`;
CREATE TABLE `flw_ru_batch_part`  (
  `ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `BATCH_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `FLW_IDX_BATCH_PART`(`BATCH_ID_` ASC) USING BTREE,
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch_part
-- ----------------------------

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_used` datetime NOT NULL,
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Spring Security Remember-Me Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_SCHED_NAME_FKEY` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_SCHED_NAME_FKEY` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` bit(1) NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME` ASC, `INSTANCE_NAME` ASC, `REQUESTS_RECOVERY` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME` ASC, `JOB_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME` ASC, `INSTANCE_NAME` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IS_DURABLE` bit(1) NOT NULL,
  `IS_NONCONCURRENT` bit(1) NOT NULL,
  `IS_UPDATE_DATA` bit(1) NOT NULL,
  `REQUESTS_RECOVERY` bit(1) NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME` ASC, `REQUESTS_RECOVERY` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_SCHED_NAME_FKEY` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` bit(1) NULL DEFAULT NULL,
  `BOOL_PROP_2` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_SCHED_NAME_FKEY` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME` ASC, `CALENDAR_NAME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME` ASC, `TRIGGER_NAME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME` ASC, `TRIGGER_STATE` ASC, `NEXT_FIRE_TIME` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME` ASC, `MISFIRE_INSTR` ASC, `NEXT_FIRE_TIME` ASC, `TRIGGER_GROUP` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME` ASC, `TRIGGER_STATE` ASC) USING BTREE,
  INDEX `QRTZ_TRIGGERS_SCHED_NAME_FKEY`(`SCHED_NAME` ASC, `JOB_NAME` ASC, `JOB_GROUP` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_SCHED_NAME_FKEY` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_action
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_action`;
CREATE TABLE `ujcms_action`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NULL DEFAULT NULL,
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP',
  `cookie_` bigint NULL DEFAULT NULL COMMENT 'Cookie',
  `ref_type_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动作对象类型',
  `ref_id_` bigint NOT NULL COMMENT '动作对象ID',
  `ref_option_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动作选项',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_action_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_action_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_action_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_action_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '动作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_action
-- ----------------------------
INSERT INTO `ujcms_action` VALUES (62535162248665602, 1, NULL, '0:0:0:0:0:0:0:1', -1913098868070339994, 'ArticleUpDown', 30, 'up', '2024-07-12 12:19:16');
INSERT INTO `ujcms_action` VALUES (62535754768554497, 1, NULL, '0:0:0:0:0:0:0:1', -1913098868070339994, 'ArticleUpDown', 54, 'up', '2024-07-12 12:38:06');
INSERT INTO `ujcms_action` VALUES (62535791838861826, 1, NULL, '0:0:0:0:0:0:0:1', -1913098868070339994, 'Vote', 1, '2', '2024-07-12 12:39:17');
INSERT INTO `ujcms_action` VALUES (62535825586231809, 1, NULL, '0:0:0:0:0:0:0:1', -1913098868070339994, 'ArticleUpDown', 105, 'up', '2024-07-12 12:40:21');
INSERT INTO `ujcms_action` VALUES (62535848202967554, 1, NULL, '0:0:0:0:0:0:0:1', -1913098868070339994, 'ArticleUpDown', 42, 'up', '2024-07-12 12:41:05');

-- ----------------------------
-- Table structure for ujcms_article
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_article`;
CREATE TABLE `ujcms_article`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `org_id_` bigint NOT NULL,
  `channel_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `modified_user_id_` bigint NOT NULL,
  `publish_date_` datetime NOT NULL COMMENT '发布日期',
  `with_image_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `sticky_` smallint NOT NULL DEFAULT 0 COMMENT '置顶',
  `status_` smallint NOT NULL DEFAULT 0 COMMENT '状态(0:正常,100:已删除)',
  `src_id_` bigint NULL DEFAULT NULL,
  `type_` smallint NOT NULL DEFAULT 0 COMMENT '类型(0:常规,1:复制,2:映射,3:引用)',
  `input_type_` smallint NOT NULL DEFAULT 0 COMMENT '录入类型(0:常规,1:投稿,2:采集,3:接口,4:站内推送,5:站外推送)',
  `order_` bigint NOT NULL,
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  `offline_date_` datetime NULL DEFAULT NULL COMMENT '下线日期',
  `sticky_date_` datetime NULL DEFAULT NULL COMMENT '置顶时间',
  `online_date_` datetime NULL DEFAULT NULL COMMENT '上线日期',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_aritcle_channel`(`channel_id_` ASC) USING BTREE,
  INDEX `idx_article_org`(`org_id_` ASC) USING BTREE,
  INDEX `idx_article_publish_date`(`publish_date_` ASC) USING BTREE,
  INDEX `idx_article_user`(`user_id_` ASC) USING BTREE,
  INDEX `idx_article_user_modified`(`modified_user_id_` ASC) USING BTREE,
  INDEX `idx_article_website`(`site_id_` ASC) USING BTREE,
  INDEX `idx_article_src`(`src_id_` ASC) USING BTREE,
  INDEX `idx_article_order`(`order_` ASC) USING BTREE,
  CONSTRAINT `fk_article_channel` FOREIGN KEY (`channel_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_src` FOREIGN KEY (`src_id_`) REFERENCES `ujcms_article` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_user_modified` FOREIGN KEY (`modified_user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_website` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_article
-- ----------------------------
INSERT INTO `ujcms_article` VALUES (3, 1, 1, 8, 1, 1, '2021-06-27 14:34:35', '1', 0, 0, NULL, 0, 0, 3, '2021-07-04 21:38:04', '2021-11-20 21:13:33', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (4, 1, 1, 9, 1, 1, '2021-06-28 08:00:21', '1', 0, 0, NULL, 0, 0, 4, '2023-04-05 22:05:34', '2023-04-05 22:05:34', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (5, 1, 1, 9, 1, 1, '2021-07-05 03:14:29', '0', 0, 0, NULL, 0, 0, 5, '2023-04-05 22:05:06', '2023-04-05 22:05:06', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (6, 1, 1, 8, 1, 1, '2021-07-05 07:04:27', '1', 0, 0, NULL, 0, 0, 6, '2021-07-05 07:04:27', '2021-11-20 21:13:57', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (7, 1, 1, 8, 1, 1, '2021-08-14 14:12:18', '0', 0, 0, NULL, 0, 0, 7, '2021-08-14 14:12:18', '2022-01-05 22:12:31', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (8, 1, 1, 8, 1, 1, '2021-08-14 14:12:34', '1', 0, 0, NULL, 0, 0, 8, '2021-08-14 14:12:34', '2022-01-05 22:12:44', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (9, 1, 1, 8, 1, 1, '2021-08-14 14:12:48', '1', 0, 0, NULL, 0, 0, 9, '2021-08-14 14:12:48', '2022-01-05 22:10:08', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (10, 1, 1, 8, 1, 1, '2021-08-14 14:12:58', '1', 0, 0, NULL, 0, 0, 10, '2021-08-14 14:12:58', '2022-01-05 22:09:53', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (11, 1, 1, 8, 1, 1, '2021-08-14 14:13:07', '1', 0, 0, NULL, 0, 0, 11, '2021-08-14 14:13:07', '2022-01-05 22:09:19', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (12, 1, 1, 8, 1, 1, '2021-08-14 14:13:20', '1', 0, 0, NULL, 0, 0, 12, '2021-08-14 14:13:20', '2022-01-05 22:08:49', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (13, 1, 1, 8, 1, 1, '2021-08-14 14:13:31', '1', 0, 0, NULL, 0, 0, 13, '2021-08-14 14:13:31', '2022-01-05 22:05:34', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (14, 1, 1, 8, 1, 1, '2021-08-14 14:13:31', '1', 0, 0, NULL, 0, 0, 14, '2021-08-14 14:13:43', '2021-11-20 21:14:51', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (15, 1, 1, 8, 1, 1, '2022-03-13 14:13:53', '1', 0, 0, NULL, 0, 0, 15, '2021-08-14 14:13:53', '2022-07-18 12:53:20', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (22, 1, 1, 8, 1, 1, '2022-03-10 06:48:03', '1', 0, 0, NULL, 0, 0, 22, '2021-09-06 06:48:03', '2022-07-17 13:35:31', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (23, 1, 1, 8, 1, 1, '2022-03-10 06:26:12', '1', 0, 0, NULL, 0, 0, 23, '2021-09-11 06:26:12', '2022-07-17 13:36:53', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (24, 1, 1, 9, 1, 1, '2021-11-04 23:28:40', '1', 0, 0, NULL, 0, 0, 24, '2023-04-05 22:04:47', '2023-04-05 22:04:47', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (25, 1, 1, 36, 1, 1, '2021-11-08 19:06:21', '1', 0, 0, NULL, 0, 0, 25, '2021-11-08 19:06:21', '2022-07-16 22:50:24', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (26, 1, 1, 28, 1, 1, '2021-11-10 11:24:27', '1', 0, 0, NULL, 0, 0, 26, '2021-11-10 11:24:27', '2022-07-22 13:10:43', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (27, 1, 1, 29, 1, 1, '2021-11-10 11:25:57', '1', 0, 0, NULL, 0, 0, 27, '2021-11-10 11:25:57', '2022-07-22 13:00:58', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (28, 1, 1, 30, 1, 1, '2021-11-10 12:03:07', '1', 0, 0, NULL, 0, 0, 28, '2021-11-10 12:03:07', '2022-07-22 13:10:13', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (29, 1, 1, 29, 1, 1, '2021-11-10 12:09:27', '1', 0, 0, NULL, 0, 0, 29, '2021-11-10 12:09:27', '2022-07-22 13:09:55', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (30, 1, 1, 29, 1, 1, '2021-11-10 12:13:33', '1', 0, 0, NULL, 0, 0, 30, '2021-11-10 12:13:33', '2022-07-22 13:09:43', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (31, 1, 1, 37, 1, 1, '2021-11-11 10:58:05', '1', 0, 0, NULL, 0, 0, 31, '2021-11-11 10:58:05', '2022-07-16 22:50:14', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (32, 1, 1, 36, 1, 1, '2021-11-11 10:59:41', '1', 0, 0, NULL, 0, 0, 32, '2021-11-11 10:59:41', '2022-07-16 22:50:03', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (33, 1, 1, 36, 1, 1, '2021-11-11 11:00:36', '1', 0, 0, NULL, 0, 0, 33, '2021-11-11 11:00:36', '2022-07-16 22:49:50', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (34, 1, 1, 36, 1, 1, '2021-11-11 11:01:21', '1', 0, 0, NULL, 0, 0, 34, '2021-11-11 11:01:21', '2022-07-16 22:49:38', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (35, 1, 1, 36, 1, 1, '2021-11-11 11:03:05', '1', 0, 0, NULL, 0, 0, 35, '2021-11-11 11:03:05', '2022-07-16 22:49:14', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (36, 1, 1, 37, 1, 1, '2021-11-11 11:04:00', '1', 0, 0, NULL, 0, 0, 36, '2021-11-11 11:04:00', '2022-07-16 22:48:55', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (37, 1, 1, 27, 1, 1, '2021-11-12 18:13:00', '1', 0, 0, NULL, 0, 0, 37, '2021-11-12 18:13:00', '2021-11-12 18:23:14', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (38, 1, 1, 25, 1, 1, '2021-11-12 18:19:18', '1', 0, 0, NULL, 0, 0, 38, '2021-11-12 18:19:18', '2021-11-12 18:23:39', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (39, 1, 1, 25, 1, 1, '2021-11-12 18:27:30', '1', 0, 0, NULL, 0, 0, 39, '2021-11-12 18:27:30', '2021-11-12 18:27:39', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (40, 1, 1, 25, 1, 1, '2021-11-12 18:30:02', '1', 0, 0, NULL, 0, 0, 40, '2021-11-12 18:30:02', '2022-01-05 21:51:28', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (41, 1, 1, 25, 1, 1, '2021-11-12 18:32:07', '1', 0, 0, NULL, 0, 0, 41, '2021-11-12 18:32:07', '2022-01-05 21:51:04', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (42, 1, 1, 26, 1, 1, '2021-11-12 18:33:55', '1', 0, 0, NULL, 0, 0, 42, '2021-11-12 18:33:55', '2021-11-14 21:21:41', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (43, 1, 1, 31, 1, 1, '2021-11-14 17:56:12', '1', 0, 0, NULL, 0, 0, 43, '2021-11-14 17:56:12', '2022-07-17 12:36:13', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (44, 1, 1, 31, 1, 1, '2021-11-14 18:11:06', '1', 0, 0, NULL, 0, 0, 44, '2021-11-14 18:11:06', '2022-07-17 12:35:33', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (45, 1, 1, 31, 1, 1, '2021-11-14 18:15:37', '1', 0, 0, NULL, 0, 0, 45, '2021-11-14 18:15:37', '2022-07-17 12:34:46', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (46, 1, 1, 32, 1, 1, '2021-11-14 18:31:45', '1', 0, 0, NULL, 0, 0, 46, '2021-11-14 18:31:45', '2022-07-17 12:33:59', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (47, 1, 1, 32, 1, 1, '2021-11-14 21:25:33', '1', 0, 0, NULL, 0, 0, 47, '2021-11-14 21:25:33', '2022-07-17 12:33:25', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (48, 1, 1, 33, 1, 1, '2021-11-14 21:36:32', '1', 0, 0, NULL, 0, 0, 48, '2021-11-14 21:36:32', '2022-07-17 12:32:28', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (49, 1, 1, 33, 1, 1, '2021-11-14 21:37:50', '1', 0, 0, NULL, 0, 0, 49, '2021-11-14 21:37:50', '2022-07-17 12:31:56', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (50, 1, 1, 33, 1, 1, '2021-11-14 21:39:09', '1', 0, 0, NULL, 0, 0, 50, '2021-11-14 21:39:09', '2022-07-17 12:31:10', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (51, 1, 1, 33, 1, 1, '2021-11-14 21:40:41', '1', 0, 0, NULL, 0, 0, 51, '2021-11-14 21:40:41', '2022-07-17 12:30:14', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (52, 1, 1, 33, 1, 1, '2021-11-14 21:42:07', '1', 0, 0, NULL, 0, 0, 52, '2021-11-14 21:42:07', '2022-07-17 12:29:52', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (53, 1, 1, 34, 1, 1, '2021-11-14 22:17:20', '1', 0, 0, NULL, 0, 0, 53, '2021-11-14 22:17:20', '2021-11-18 16:47:07', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (54, 1, 1, 35, 1, 1, '2021-11-15 21:15:41', '1', 0, 0, NULL, 0, 0, 54, '2021-11-15 21:15:41', '2021-11-18 16:46:54', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (105, 1, 1, 8, 1, 1, '2022-07-17 22:24:13', '1', 0, 0, NULL, 0, 0, 105, '2022-07-17 22:24:13', '2022-07-17 22:51:36', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (155, 1, 1, 8, 1, 1, '2022-07-17 22:56:23', '1', 0, 11, NULL, 0, 0, 155, '2022-07-17 22:56:23', '2022-07-17 22:56:23', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (156, 1, 1, 8, 1, 1, '2022-07-17 22:58:24', '0', 0, 22, NULL, 0, 0, 156, '2022-07-17 22:58:24', '2022-07-17 22:58:24', NULL, NULL, NULL);
INSERT INTO `ujcms_article` VALUES (205, 1, 1, 9, 1, 1, '2022-07-17 23:24:41', '0', 0, 20, NULL, 0, 0, 205, '2022-07-17 23:24:41', '2022-07-17 23:24:41', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ujcms_article_ext
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_article_ext`;
CREATE TABLE `ujcms_article_ext`  (
  `id_` bigint NOT NULL,
  `title_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `subtitle_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '副标题',
  `full_title_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完整标题',
  `alias_` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '别名',
  `link_url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转向链接地址',
  `target_blank_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `seo_keywords_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摘要',
  `author_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `editor_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编辑',
  `source_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源',
  `image_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `video_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频',
  `video_orig_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原视频',
  `video_duration_` int NULL DEFAULT NULL COMMENT '视频时长',
  `audio_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '音频',
  `audio_orig_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原音频',
  `audio_duration_` int NULL DEFAULT NULL COMMENT '音频时长',
  `file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件',
  `file_name_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_length_` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `doc_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文库',
  `doc_orig_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文库原文档',
  `doc_name_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文库名称',
  `doc_length_` bigint NULL DEFAULT NULL COMMENT '文库大小',
  `article_template_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '独立模板',
  `allow_comment_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `static_file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '静态页文件',
  `mobile_static_file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机端静态页文件',
  `process_instance_id_` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程实例ID',
  `reject_reason_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退回原因',
  `baidu_push_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `text_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '正文',
  `markdown_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Markdown正文',
  `editor_type_` smallint NOT NULL DEFAULT 1 COMMENT '编辑器类型(1:富文本编辑器,2:Markdown编辑器)',
  `image_list_json_` json NULL,
  `file_list_json_` json NULL,
  `comments_` int NOT NULL DEFAULT 0 COMMENT '评论次数',
  `downloads_` int NOT NULL DEFAULT 0 COMMENT '下载次数',
  `favorites_` int NOT NULL DEFAULT 0 COMMENT '收藏次数',
  `ups_` int NOT NULL DEFAULT 0 COMMENT '顶',
  `downs_` int NOT NULL DEFAULT 0 COMMENT '踩',
  `views_` bigint NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `day_views_` int NOT NULL DEFAULT 0 COMMENT '日浏览次数',
  `week_views_` int NOT NULL DEFAULT 0 COMMENT '周浏览次数',
  `month_views_` int NOT NULL DEFAULT 0 COMMENT '月浏览次数',
  `quarter_views_` int NOT NULL DEFAULT 0 COMMENT '季浏览次数',
  `year_views_` bigint NOT NULL DEFAULT 0 COMMENT '年浏览次数',
  `mains_json_` json NULL COMMENT '自定义主字段JSON',
  `clobs_json_` json NULL COMMENT '自定义大字段JSON',
  PRIMARY KEY (`id_`) USING BTREE,
  CONSTRAINT `fk_articleext_article` FOREIGN KEY (`id_`) REFERENCES `ujcms_article` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_article_ext
-- ----------------------------
INSERT INTO `ujcms_article_ext` VALUES (3, '夕阳下歼10起飞参加演习 画面超美', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104222955607_po1m3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p id=\"0BBGHPTJ\">10月10日&#xff0c;南部战区空军航空兵歼-10战斗机组织夜间飞行战斗训练&#xff0c;锤炼部队实战化能力。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (4, '面临三重生存威胁 全球持续变暖马尔代夫恐将“消失”', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104222746839_hjqth.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>受全球气候变化影响&#xff0c;马尔代夫正面临三重生存威胁。</p>\n<p>第一是海洋温度升高导致珊瑚死亡&#xff0c;珊瑚礁也在逐渐消失。未来10几年内&#xff0c;当地海洋生态系统会可能出现重大危机。</p>\n<p>第二是海平面在2020年一年内就上升了3-4毫米 。</p>\n<p>第三是随着气候变化&#xff0c;雨季和热带风暴都变得更频繁。</p>\n<p>面临三重生存威胁&#xff0c;科学家表示如果无法立即采取行动遏制全球变暖&#xff0c;马尔代夫未来可能将不复存在。</p>', NULL, 1, '[]', '[]', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (5, '阿富汗临时政府高等教育部：6万名大学生将获得学费减免', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p class=\"contentFont\">中央广播电视总台CGTN报道员萨利姆·卡卡尔&#xff08;Saleem Kakar&#xff09;当地时间10月6日消息&#xff0c;阿富汗临时政府高等教育部当天在喀布尔举行发布会&#xff0c;内容涉及大学学费减免及入学政策。</p>\n<p class=\"contentFont\">高等教育部代理部长阿卜杜拉·巴奇·哈卡尼在发布会上表示&#xff0c;政府将为贫困学生提供学费折扣&#xff0c;这项政策即将落地。</p>\n<p class=\"contentFont\">私立大学联合会会长艾哈迈德·塔里克·卡迈勒介绍&#xff0c;阿富汗全国各地有90多所大学将提供学费折扣&#xff0c;有6万名学生将获得学费减免&#xff0c;其中大多数人攻读学士学位&#xff0c;也有一些人攻读硕士学位。他们就读于不同的院系&#xff0c;如医学、工程、法律、经济等。</p>', NULL, 1, '[]', '[]', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (6, '英姿飒爽！陆军首批10名女飞行学员完成首次单飞', NULL, NULL, NULL, NULL, '0', NULL, NULL, '激活', '健康和', '人民网', '/uploads/1/image/2021/11/20211104222710636_nk33a.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', '<p>近日&#xff0c;陆军首批10名女飞行学员在陆航学院某旅机场驾驶直升机圆满完成首次单飞训练&#xff0c;初步具备独立飞行能力。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (7, '驻美大使秦刚谈应对气候变化：美国想按时高分交卷，就不能再逃课', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p class=\"one-p\">来源&#xff1a;中国驻美国大使馆网站</p>\n<p class=\"one-p\">11月2日&#xff0c;由中央广播电视总台北美总站&#xff08;CGTN&#xff09;主办的“全球行动倡议2021——气候变化”气候周特别活动开幕&#xff0c;秦刚大使线上出席开幕式&#xff0c;与中美青年一代对话&#xff0c;就当下备受关注的应对气候变化问题回答了来自美国纽约、旧金山、华盛顿特区和中国清华大学、浙江大学、北京师范大学等中美学生的提问&#xff08;答问全文&#xff09;。</p>\n<p class=\"one-p\">在回答关于“中国领导人为应对气候变化做了什么&#xff1f;中国政府如何降低汽车污染和减缓气候变化”等问题时&#xff0c;秦刚大使表示&#xff0c;中国领导人高度重视气候变化问题。去年9月&#xff0c;习近平主席郑重宣布&#xff0c;中国力争于2030年前达到二氧化碳排放峰值&#xff0c;2060年前实现碳中和。今年4月&#xff0c;习主席在领导人气候峰会上首次全面系统阐述了“人与自然生命共同体”理念。《联合国气候变化框架公约》第二十六次缔约方大会世界领导人峰会此时正在格拉斯哥举行&#xff0c;习主席在向峰会发表的书面致辞中呼吁各方维护多边共识&#xff0c;聚焦务实行动&#xff0c;加速绿色转型&#xff0c;携手应对气候变化挑战&#xff0c;合力保护人类共同的地球家园。</p>\n<p class=\"one-p\">秦大使说&#xff0c;中国在减少汽车尾气排放、坚持绿色出行方面做了很多努力。中国新能源汽车得到了大发展&#xff0c;总量达到600万辆。中国政府还鼓励老百姓选择公共交通和绿色出行方式。北京冬奥会也将成为历史上第一届全部使用绿色清洁能源的奥运会。绿色&#xff0c;将成为北京冬奥会最闪亮的底色。</p>\n<p class=\"one-p\">在回答关于“在气变领域&#xff0c;中美共同的责任和有所区别的责任是什么&#xff1f;中方有何计划与美国合作共同应对气候变化”等问题时&#xff0c;秦刚大使表示&#xff0c;应对气候变化是全球各国的共同责任&#xff0c;同时发达国家和发展中国家也面临不同的责任。发展中国家还面临发展经济、改善民生的任务&#xff0c;发达国家在应对气候变化上应担负起更多的责任&#xff0c;兑现为发展中国家提供资金和技术支持的承诺。中美两国作为应对气候变化的主要行动方&#xff0c;都应首先立足自身&#xff0c;完成好国家自主贡献。美国是个实力很强的学生&#xff0c;但中间曾“逃过课”、退出过《巴黎协定》&#xff0c;今后要想按时高分交卷&#xff0c;就不能再逃课了&#xff0c;也不能推迟提交作业。</p>\n<p class=\"one-p\">秦大使表示&#xff0c;中国碳排放将力争在2030年前达峰&#xff0c;2060年前实现碳中和&#xff0c;这意味着中国将完成全球最高碳排放强度的降幅。为实现上述目标&#xff0c;作为发展中国家&#xff0c;中国需比美国付出更大的牺牲和努力。应对气候变化更需要包括中美两国在内的各国开展密切合作。中美共同发表了《应对气候危机的联合声明》&#xff0c;重申加强合作。双方正在协力推动COP26取得成功。两国在电动汽车、可再生能源、绿色金融、数字经济等方面都有巨大的合作潜力&#xff0c;值得深入挖掘。中美还可以携手帮助易受气候影响的脆弱国家&#xff0c;开展第三方合作。我们期待中美以格拉斯哥气变大会为契机&#xff0c;着眼于全人类的共同利益&#xff0c;携手扭转当前阻碍两国合作的“政治小气候”&#xff0c;引领世界协力应对日益变暖的“全球大气候”&#xff0c;共同交上一份令人满意的答卷。</p>\n<p class=\"one-p\">在回答关于“是否有途径让年青一代广泛参与应对气候变化&#xff1f;是否可加强中美青年学生间交流与合作&#xff1f;”等问题时&#xff0c;秦刚大使表示&#xff0c;气候变化是全人类面临的共同挑战&#xff0c;地球的未来会是什么样&#xff1f;答案取决于我们每个人&#xff0c;特别是青年一代的选择和努力。青年人是应对气候变化的参与者、受益者&#xff0c;同时更应是生态文明的倡导者、引领者。我看到&#xff0c;中美两国有越来越多的年轻人把做“低碳青年”视为“更酷、更时尚”的生活方式。希望全球青年人都能参与到应对气变的努力中&#xff0c;从点滴做起、从自身做起、从衣食住行的方方面面做起&#xff0c;倡导和塑造绿色生活方式&#xff0c;让大家都成为应对气候变化的行动者、分享者。青年一代的才智、付出和努力终将汇聚成磅礴之力&#xff0c;推动呵护全人类共同的地球家园&#xff0c;实现世界的美好未来&#xff01;我本人和中国驻美使馆将积极支持并协助中美青年加强交流互动。</p>\n<p class=\"one-p\">此次气候周特别活动为期5天。中宣部副部长、中央广播电视总台台长慎海雄为活动致开幕辞&#xff0c;塞拉利昂总统比奥、冰岛总理雅各布斯多蒂尔等国家领导人以及联合国和世界自然基金会等国际组织官员出席活动。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (8, '福布斯发布中国内地富豪榜：农夫山泉钟睒睒首度登顶、张一鸣第二', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104232420442_dqx8h.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p class=\"one-p\">文/福布斯中国</p>\n<p class=\"one-p\">11月4日&#xff0c;福布斯发布年度中国内地富豪榜。对于中国内地富豪榜的100名上榜者来说&#xff0c;尽管过去一年充满挑战&#xff0c;但他们仍收益颇多&#xff1a;上榜者总财富数从去年的1.33万亿美元增至1.48万亿美元。</p>\n<p class=\"one-p\">过去一年&#xff0c;中国的社会与经济环境可谓浪潮迭起。教育与科技领域的政策变化&#xff0c;以及部分房地产企业的债务问题&#xff0c;使多家大型民营企业的股价出现大幅下跌。另一方面&#xff0c;响应中国政府“共同富裕”理念&#xff0c;多家中国科技企业和其领导者相继宣布为此投入巨资。</p>\n<p class=\"one-p\">尽管挑战不断&#xff0c;但本次上榜者的总财富仍然较去年有所增长&#xff0c;其中涨幅最大的是那些从事包括锂电池在内的绿色能源产业的富豪。受益于中国在该产业的全球领导地位&#xff0c;其公司的销售业绩出现了强劲的增长。值得一提的是&#xff0c;中国除了是世界最大的<span class=\"linkNormal\">汽车</span>市场&#xff0c;还是世界上<span class=\"linkNormal\">电动汽车</span>销售的领先者。</p>\n<p class=\"one-p\"><strong>福布斯中国内地富豪榜的TOP 10</strong></p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 农夫山泉/ 万泰生物</strong></p>\n<p class=\"one-p\"><strong>年龄: 66</strong></p>\n<p class=\"one-p\"><strong>居住地: 杭州</strong></p>\n<p class=\"one-p\"><strong>行业: 饮料、生物医药</strong></p>\n<p class=\"one-p\">凭借着两家上市公司股价的良好表现&#xff0c;农夫山泉创始人钟睒睒以4,244亿的财富值问鼎2021年中国内地富豪榜榜首。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 字节跳动</strong></p>\n<p class=\"one-p\"><strong>年龄: 37</strong></p>\n<p class=\"one-p\"><strong>居住地: 北京</strong></p>\n<p class=\"one-p\"><strong>行业: 互联网、社交媒体</strong></p>\n<p class=\"one-p\">在今年5月辞去CEO一职后&#xff0c;字节跳动创始人张一鸣又于近日卸任公司董事长。此前&#xff0c;张一鸣曾表示&#xff0c;未来将放下公司日常管理&#xff0c;聚焦远景战略、企业文化和社会责任等长期重要事项&#xff0c;计划相对专注学习知识、系统思考、研究新事物、动手尝试和体验&#xff0c;以十年为期&#xff0c;为公司创造更多可能。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 宁德时代</strong></p>\n<p class=\"one-p\"><strong>年龄: 52</strong></p>\n<p class=\"one-p\"><strong>居住地: 宁德</strong></p>\n<p class=\"one-p\"><strong>行业: 电池</strong></p>\n<p class=\"one-p\">随着全球双碳目标的设立&#xff0c;过去一年&#xff0c;宁德时代成为A股市场最受关注的上市公司之一&#xff0c;总市值突破万亿元&#xff0c;也助力创始人曾毓群跃升至榜单第三位。除已多年居全球动力电池装机量首位外&#xff0c;宁德时代正通过投资等方式&#xff0c;积极布局新能源汽车、锂电池、储能等各产业链&#xff0c;并将触角延伸至大出行领域。今年前三季度&#xff0c;宁德时代总营收超过700亿元&#xff0c;归母净利达77.5亿元。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 腾讯</strong></p>\n<p class=\"one-p\"><strong>年龄: 50</strong></p>\n<p class=\"one-p\"><strong>居住地: 深圳</strong></p>\n<p class=\"one-p\"><strong>行业: 即时通讯、门户网站、网络游戏</strong></p>\n<p class=\"one-p\">随着全球科技行业监管趋紧&#xff0c;今年&#xff0c;中国互联网行业也进入强监管模式。这对整个行业在资本市场的表现带来压力&#xff0c;腾讯市值也随行业估值中枢下调。今年&#xff0c;腾讯宣布&#xff0c;将投入千亿元助力“共同富裕”</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 阿里巴巴</strong></p>\n<p class=\"one-p\"><strong>年龄: 57</strong></p>\n<p class=\"one-p\"><strong>居住地: 杭州</strong></p>\n<p class=\"one-p\"><strong>行业: 电子商务、金融科技</strong></p>\n<p class=\"one-p\">受互联网平台反垄断监管等因素影响&#xff0c;过去一年阿里巴巴股价跌幅超过40%。而自去年11月被叫停后&#xff0c;阿里旗下重要子公司<span class=\"linkNormal\">蚂蚁集团</span>的上市仍不明朗&#xff0c;这些都导致马云个人财富数较去年大幅减少。尽管如此&#xff0c;作为阿里巴巴面向未来的第二增长曲线&#xff0c;阿里云去年的销售额突破600亿元人民币&#xff0c;同比增长50%。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 拼多多</strong></p>\n<p class=\"one-p\"><strong>年龄: 41</strong></p>\n<p class=\"one-p\"><strong>居住地: 上海</strong></p>\n<p class=\"one-p\"><strong>行业: 电子商务</strong></p>\n<p class=\"one-p\">今年3月&#xff0c;黄峥辞任拼多多董事长。他在内部信中表示&#xff0c;本人将致力于食品科学和生命科学领域的研究&#xff0c;并着眼于拼多多未来的长远发展&#xff0c;“去摸一摸10年后路上的石头”。此外&#xff0c;黄峥及拼多多创始团队还发起并捐赠成立浙江大学上海高等研究院繁星科学基金。未来3-5年&#xff0c;该基金将向浙江大学教育基金会捐助 1 亿美元&#xff0c;用于 “计算 &#43; 生物医疗”、“计算 &#43;<span class=\"linkNormal\">农业</span>食品” 和 “先进计算” 三个创新实验室的科学研究项目。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 美的集团</strong></p>\n<p class=\"one-p\"><strong>年龄: 79</strong></p>\n<p class=\"one-p\"><strong>居住地: 佛山</strong></p>\n<p class=\"one-p\"><strong>行业: 日用电器制造、房地产</strong></p>\n<p class=\"one-p\">美的集团是中国第一家没有 “父传子” 的千亿级民营企业&#xff0c;创始人何享健离开一线但仍然继续关心、关注和全力支持美的集团的发展。6月23日&#xff0c;美的集团发布公告称&#xff0c;何享健已完成 8 亿元增持美的集团 的计划。自 2012 年辞去集团董事长后&#xff0c;何享健热心于慈善公益事业。去年&#xff0c;何享健曾减持美的集团股份&#xff0c;筹资建设医院、设立 “和衷共济” 小微企应急支援计划等公益项目。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 长城汽车</strong></p>\n<p class=\"one-p\"><strong>年龄: 57</strong></p>\n<p class=\"one-p\"><strong>居住地: 保定</strong></p>\n<p class=\"one-p\"><strong>行业: 汽车</strong></p>\n<p class=\"one-p\">长城汽车董事长魏建军夫妇的财富数较一年前增加194亿美元&#xff0c;排名上升30位。魏建军称&#xff0c;长城汽车将在 2025 年实现全球年销售 400 万辆目标&#xff0c;其中 80% 将是新能源汽车。近年&#xff0c;魏建军还先后投建蜂巢能源、未势能源、极电光能等&#xff0c;布局新能源领域。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 网易</strong></p>\n<p class=\"one-p\"><strong>年龄: 50</strong></p>\n<p class=\"one-p\"><strong>居住地: 杭州</strong></p>\n<p class=\"one-p\"><strong>行业: 互动娱乐、在线音乐、在线教育、电子商务、资讯传媒</strong></p>\n<p class=\"one-p\">今年10 月&#xff0c;丁磊首次提到音乐产业的 “共同富裕”。他预计&#xff0c;到 2025年中国将有超过80万独立音乐人&#xff0c;将扩大版权供给量&#xff0c;创造高几倍的产业价值。他呼吁行业应优化版权分配、持续扶持原创&#xff0c;让优秀的音乐人有所成&#xff0c;有所得。</p>\n<p class=\"one-p\">10月10日&#xff0c;网易宣布捐赠2000万元&#xff0c;驰援山西暴雨灾区。这是继今年7月紧急向河南暴雨灾区捐赠5000万元后&#xff0c;网易又一次重大社会捐赠行为。2021年&#xff0c;丁磊带领网易全面践行社会价值&#xff0c;结合自身技术能力和业务优势&#xff0c;在游戏未成年人保护、人才就业、绿色低碳、社会捐助、公益教育等多个领域加大投入&#xff0c;交出了一份互联网科技企业的“担当”答卷。</p>\n<p class=\"one-p\"> </p>\n<p class=\"one-p\"><strong>财富来源: 顺丰控股</strong></p>\n<p class=\"one-p\"><strong>年龄: 51</strong></p>\n<p class=\"one-p\"><strong>居住地: 深圳</strong></p>\n<p class=\"one-p\"><strong>行业: 物流</strong></p>\n<p class=\"one-p\">与去年相比&#xff0c;王卫的财富数减少34亿美元&#xff0c;排名跌出前五。今年一季度&#xff0c;顺丰控股亏损近10亿元&#xff0c;超出市场预期&#xff0c;拖累公司股价一路走低。尽管截止前三季度&#xff0c;顺丰控股实现净利润10.4亿元&#xff0c;但与去年同期相比仍下滑43.5%。</p>\n<p class=\"one-p\">《福布斯》杂志资深编辑、中国内地富豪榜榜单编辑范鲁贤&#xff08;Russell Flannery&#xff09;表示&#xff1a;“无论是电动汽车电池、太阳能设施&#xff0c;还是电池制造设备&#xff0c;这些应对气候变化的产品都有着不断增长的市场需求&#xff0c;并令众多的中国企业家从中获益。这是本榜单中一些企业家的财富实现大幅上涨的主要原因&#xff0c;同时也意味着新的商业投资机会。”</p>\n<p class=\"one-p\">继上半年实现利润增长后&#xff0c;中国瓶装水之王、农夫山泉董事长钟睒睒今年以659亿美元的财富首次登上榜首&#xff0c;其背后的主要原因在于疫情防控效果良好&#xff0c;中国消费支出得到提振。此外&#xff0c;钟睒睒的财富还得益于对北京万泰生物有限公司的成功投资&#xff0c;后者是一家于上交所上市的制药公司&#xff0c;其在10月中旬的股价较上年同期上涨了76%。</p>\n<p class=\"one-p\">位居榜单第二位的是字节跳动创始人张一鸣。作为全球社交媒体现象级应用软件TikTok的运营商&#xff0c;字节跳动帮助张一鸣成为了本榜单上财富数增加最多的富豪&#xff0c;从去年的277亿美元上升至594亿美元。榜单第三位是电池制造商宁德时代的董事长曾毓群。作为全球最大的电动汽车电池供应商&#xff0c;宁德时代的巨大成功帮助曾毓群成为了榜单中个人财富数增加第二多的富豪&#xff0c;从去年的201亿美元上涨至508亿美元。</p>\n<p class=\"one-p\">相比之下&#xff0c;腾讯CEO马化腾的财富从去年的552亿美元下滑至491亿美元&#xff0c;排名也滑落至榜单第四位。另外&#xff0c;由于阿里巴巴旗下金融服务子公司蚂蚁集团推迟上市&#xff0c;加上阿里巴巴本身股价下跌&#xff0c;去年位居榜首的马云今年跌至第五位&#xff0c;财富为415亿美元。</p>\n<p class=\"one-p\">今年前100位上榜者中的新面孔包括中伟新材料总裁邓伟明&#xff08;第63名&#xff0c;资产90.7亿美元&#xff09;、<span class=\"linkNormal\">东鹏饮料</span>总裁林木勤&#xff08;第84名&#xff0c;资产70.5亿美元&#xff09;&#xff0c;以及<span class=\"linkNormal\">锦浪科技</span>大股东王峻适、王一鸣父子&#xff08;第100名&#xff0c;57.4亿美元&#xff09;。而重新回到前100的富豪则包括<span class=\"linkNormal\">天齐锂业</span>董事长蒋卫平&#xff08;第79名&#xff0c;73.1亿美元&#xff09;。</p>\n<p class=\"one-p\">进入福布斯中国内地富豪榜100名所需的最低门槛从一年前的50.3亿美元增至57.4亿美元。</p>\n<p class=\"one-p\"><strong>制榜方法 :</strong></p>\n<p class=\"one-p\">该榜单基于股权及财务信息编制&#xff0c;信息来源包括上榜者家族、上市公司公开资料等。来自上市公司部分的财富统计&#xff0c;使用2021年10月15日的汇率及股票收盘价。私营企业估值基于财务数据基础上的同业比较评估所得。本榜单上榜者包含那些目前已非中国籍&#xff0c;但其主要财富仍来自中国大陆的企业家。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (9, '世界第二富豪贝索斯：20亿美金拿去花，别再骂我不管地球了', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104231836614_mefxh.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p class=\"one-p\">亚马逊公司创始人贝索斯上周末坐着价值6500万美元的湾流G650ER喷气式飞机赴英国格拉斯哥参加联合国气候变化大会COP26。来自全球200多个国家和地区的人们将在这不到两周的时间碰撞对策&#xff0c;应对气候变暖的核心难题。</p>\n<p class=\"one-p\">不过&#xff0c;搭乘私人飞机来关心碳排放&#xff1f;这番操作让贝索斯人未到场先被嘲&#xff0c;但想必堂堂“世界第二富”绝不会感到尴尬&#xff0c;毕竟同行们也是这么干的&#xff0c;光是私人飞机就来了400多架&#xff0c;包括美国总统拜登的空军一号。拜登还得每天坐着大油耗的车队在格拉斯哥和爱丁堡之间30 英里路往返奔波。</p>\n<p class=\"one-p\">焦点继续回到贝索斯。这次他还真没空着手来——在11月2日的演讲上&#xff0c;他宣布通过贝索斯地球基金&#xff08;The Bezos Earth Fund&#xff09;为自然保护和改造粮食系统提供20亿美元。加上今年9月份承诺捐赠的&#xff0c;用于保护地球上30%的陆地和海洋的10亿美元&#xff0c;这些款项将均会在2030年交付。此番慷慨迅速登上了各大海外媒体的版面。至于捐款具体怎么使用还没有确切说法。北京时间11月4日&#xff0c;有消息证实贝索斯已经出售了大约20亿美元的亚马逊股票。此外&#xff0c;贝索斯的十分钟演讲中提到了亚马逊在2019年的气候承诺——2025年让可再生能源为所有业务提供动力&#xff0c;在2040年实现净零排放的目标。</p>\n<p class=\"one-p\">谈及捐款的初心&#xff0c;贝索斯终于提了一嘴自己的蓝色起源火箭&#xff0c;并表示&#xff0c;正是7月份这趟太空之旅让他对环保心有戚戚焉&#xff1a;“从高处回望地球&#xff0c;大气层似乎如此稀薄&#xff0c;世界如此有限&#xff0c;如此脆弱。” 而太空事业正是他此前被环保群体指责的由头——有那么多闲钱为什么不去保护地球&#xff0c;整天老想着“上天”&#xff0c;更别提火箭燃料对地球大气层的影响了。</p>\n<p class=\"one-p\">除了这20亿美金的捐款&#xff0c;贝索斯地球基金还和洛克菲勒基金会、宜家基金会“拉了个小群”——组建一个全球人类和地球能源联盟&#xff0c;帮助贫困国家实现可再生能源转型。地球基金承诺掏出5亿美元支持这个项目。据其官网介绍&#xff0c;该基金建立的基础是贝索斯承诺的100 亿美元赠款&#xff0c;这笔钱会在接下来的十年里发放。</p>\n<p class=\"one-p\">20亿的天价“赎罪券”&#xff1f;</p>\n<p class=\"one-p\">既然如此爽快地掏钱保护地球&#xff0c;为什么贝索斯仍被骂为富不仁&#xff1f;他冤不冤&#xff1f;</p>\n<p class=\"one-p\">作为一家由互联网电商业务驱动的科技巨头&#xff0c;可想而知亚马逊在碳足迹方面的“造诣”。毕竟数十亿件商品是需要坐着飞机、卡车和轮船才能从世界各个角落到达消费者家门口。美联社消息称&#xff0c;为了提高配送效率&#xff0c;亚马逊在今年1月宣布再购入11架飞机。</p>\n<p class=\"one-p\">亚马逊今年6月发布的年度可持续发展报告中指出&#xff0c;2020年其碳排放量为6064万吨&#xff0c;相当于烧了1.4亿桶石油&#xff0c;与2019年相比出现了15%的增长&#xff0c;化石燃料的排放量也猛增 69%。</p>\n<p class=\"one-p\">新冠疫情让全球的经济活动陷入凝滞。根据东英吉利大学等三所英国大学的研究&#xff0c;去年全球的碳排放量因此创下有记录以来最大幅度的削减——24亿吨&#xff0c;同比下降7%。</p>\n<p class=\"one-p\">然而&#xff0c;亚马逊却实实在在地从中受益。居家隔离带来的新需求让全球消费者越发依赖线上零售。2020年底亚马逊的财报显示&#xff0c;全年净销售额增长38%&#xff0c;达到3861亿美元的历史成绩。排放量也伴随着业务的扩张而增长。不过亚马逊方面辩解道&#xff0c;虽然排放总量上去了&#xff0c;但强度降低了&#xff0c;也就是说亚马逊每花费一美元所产生的碳排放量降低了16%。</p>\n<p class=\"one-p\">在气候议题上&#xff0c;亚马逊甚至和自家员工也闹得很难看。美国劳工官员发现亚马逊在去年4月解雇了两名加入了“亚马逊气候正义员工组织”的员工&#xff0c;怀疑此举是为了报复二人公开批评公司在环保和仓库安全问题的行为。该组织对亚马逊提出的目标包括&#xff1a;实现“2030年零排放”&#xff0c;限制和化石燃料公司之间的合作&#xff0c;拒绝出资支持那些不肯承认气候变化事实存在的政客。尽管公司方面不接受这一调查结果&#xff0c;坚称职员被解雇的因为他们“一再违反内部政策”&#xff0c;并非是因为得罪了雇主。</p>\n<p class=\"one-p\">有了之前的种种铺垫&#xff0c;不难理解贝索斯此时出来关怀地球的举动收获掌声寥寥&#xff0c;只被视为理所应当。</p>\n<p class=\"one-p\">另一方面&#xff0c;或许是与其他同等量级的富豪相比&#xff0c;他在慈善事业上的反应有点晚。比如&#xff0c;他并没有签署由巴菲特和盖茨在2010年的号召——让亿万富豪承诺把大部分财富投入慈善。不过&#xff0c;近年来贝索斯的慈善表态变得密集。根据彭博亿万富翁指数&#xff0c;贝索斯净资产高达1960亿美元&#xff08;仅次于马斯克&#xff09;&#xff0c;最新官宣的这20亿捐款占他净资产的1%左右。卸任亚马逊CEO后&#xff0c;他仍持有份额10%左右的股份。根据美国证券交易委员会(SEC) 的文件&#xff0c;贝索斯今年累计出售的股票规模约为86亿美元&#xff0c;部分原因在于为其私人航天公司“蓝色起源”造血。</p>\n<p class=\"one-p\">“这次&#xff0c;我想当个好人”</p>\n<p class=\"one-p\">贝索斯对气候慈善事业的贡献和影响毋庸置疑。接下来的关键是&#xff0c;贝索斯还想做什么&#xff1f;</p>\n<p class=\"one-p\">从亚马逊和贝索斯本人已有的行动&#xff0c;大致可分为慈善、亚马逊产业链和气候科技投资三个方面。</p>\n<p class=\"one-p\">首先是慈善领域。贝索斯称&#xff0c;在明年的会议上他的基金将着眼非洲。在COP26提出的20亿美元捐款的主要目标之一&#xff0c;正是改善粮食供应——通过解决非洲的土地退化问题&#xff0c;提高土壤肥力和产量&#xff0c;还能固碳&#xff0c;促进就业和经济发展。</p>\n<p class=\"one-p\">去年6月&#xff0c;亚马逊的气候承诺基金已经投资了11家气候技术公司&#xff0c;并将一些技术整合到亚马逊的业务链条中。比如&#xff0c;向电动货车和卡车制造商Rivian订购10万台电动货车&#xff0c;预计于2030年上路。据海外科技媒体Geek Wire报道&#xff0c;混凝土生产商CarbonCure Technologies、碳抵消验证平台Pachama、电动汽车电池回收商Redwood Materials、节能电机制造商商Turntide Technologies、电动飞机制造商BETA Technologies、电池软件公司Ion Energy以及氢电航空公司ZeroAvia等一众气候技术初创公司均得到了气候承诺基金的青睐。</p>\n<p class=\"one-p\">以货运业为例。货运是亚马逊最为关键的环节之一&#xff0c;却也是它实现脱碳目标的最大难关。用于运送消费品的船只通常比较旧&#xff0c;多采用传统化石燃料。所以&#xff0c;亚马逊就盯上了来自加州的初创公司Infinium。在最近的一轮融资中&#xff0c;亚马逊为Infinium联合领投了6900万美元的融资。Infinium正在开发超低碳燃料用来取代碳密集型柴油和喷气燃料&#xff0c;可以用于航运、海运以及重型卡车车队。这家公司还在研发由“绿色氢气”和废二氧化碳合成的“电子燃料”。</p>\n<p class=\"one-p\">“世界在过去的20年里已经被宠坏了&#xff0c;当时&#xff0c;由于互联网、软件和云&#xff0c;公司可以在六个月内从零增长到十亿美金&#xff0c;”亚马逊气候承诺基金的管理者彼得森指出&#xff0c;气候技术的问题很难、“它是原子而不是比特&#xff0c;因此他们的扩展要更困难&#xff0c;更需要时间。”</p>\n<p class=\"one-p\">除了亚马逊&#xff0c;气候科技的投资领域也不乏其他积极的身影&#xff0c;比如来自微软的10亿气候创新基金和比尔盖茨牵头的突破能源风险投资公司&#xff08;Breakthrough Energy Ventures&#xff09;等。</p>\n<p class=\"one-p\">至于贝索斯在未来的兴趣重点——太空旅行市场&#xff0c;或许才是会惹出更多争议的部分。贝索斯一直炫耀自家的蓝色起源用的是液态氢和液态氧推进器&#xff0c;比起维珍创始人理查德布兰森的VSS Unity用的混合推进剂更环保。</p>\n<p class=\"one-p\">燃烧推进剂为火箭升入太空提供能量&#xff0c;也会带来温室气体和空气污染物。太空咨询公司Northern Sky Research的首席分析师卡萨波斯基&#xff08;Dallas Kasaboski&#xff09;对Space.com表示&#xff0c;“科学界目前不知道、也没有足够的证据来判断火箭发射可能在什么时候开始对地球产生可衡量的影响。与此同时&#xff0c;随着火箭发射次数的增加&#xff0c;平流层已经发生了变化。”可是&#xff0c;“太空爱好者”贝索斯对太空旅行的增长潜力&#xff0c;显然还有蓬勃的野心。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (10, '首都体育馆和五棵松体育中心将迎来测试赛和测试活动', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104224550238_erko3.gif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p align=\"left\">　　新华社北京10月11日电&#xff08;记者赵建通、马邦杰、董意行、吉宁&#xff09;11日&#xff0c;“相约北京”系列冬季体育赛事北京赛区&#xff08;海淀&#xff09;新闻发布会在中关村国家自主创新示范区展示中心会议中心举行。海淀区相关部门以及首都体育馆场馆群、五棵松体育中心场馆运行团队分别介绍筹备及服务保障测试赛、测试活动相关情况。</p>\n<p>　　据了解&#xff0c;此次“相约北京”赛事海淀区涉及两个场馆、三项赛事。10月13日至17日&#xff0c;首都体育馆将举办亚洲花样滑冰公开赛&#xff0c;10月21日至24日将举办短道速滑世界杯。11月7日至10日&#xff0c;五棵松体育中心将举办冰球国内测试活动。目前&#xff0c;花样滑冰项目测试赛报名人数103人&#xff0c;其中运动员32人&#xff0c;中国运动员人数为17人&#xff1b;短道速滑测试赛报名人数395人&#xff0c;其中运动员248人&#xff0c;中国运动员人数为16人&#xff1b;冰球项目为国内测试活动&#xff0c;有国内4支冰球队伍参加。三项赛事各类入境人员预计494人。</p>\n<p>　　围绕上述三项赛事&#xff0c;海淀区组织辖区科技创新企业&#xff0c;共同设计、搭建科技防疫、机器人等多个科技冬奥应用场景&#xff0c;通过科技助力冬奥。赛场外围布设智慧感知设备&#xff0c;场馆、酒店入口及接驳车辆安装多验合一数字哨点&#xff0c;3秒即可通过“防疫卡”完成“扫码打卡”&#xff0c;每一次出入都将得到健康提醒&#xff1b;赛场入口处布设大规模测温设备&#xff0c;保障运动员快速入场&#xff1b;观众入场区域布设智慧出入管理系统&#xff0c;能够实现快速核验入场&#xff0c;避免人员聚集&#xff1b;智能测温贴可实现24小时体温管理&#xff1b;气溶胶新冠病毒监测系统可有效显示场馆、酒店的空气中是否含有新冠病毒&#xff1b;同时通过科技手段&#xff0c;加强对涉奥环境消杀&#xff0c;如布设消毒机器人&#xff0c;在场馆内的空调安装病原体空气消杀系统&#xff0c;通过无人化手段实现场馆、酒店的自动消杀。</p>\n<p>　　海淀区体育局局长张彦祥表示&#xff0c;组委会按照“一场一策”“一馆一策”的要求&#xff0c;不断细化人员流线&#xff0c;强化闭环管理安排。在住宿服务保障方面&#xff0c;对标冬奥组委赛时住宿保障要求&#xff0c;细化人员住宿分配方案&#xff0c;依据场馆闭环内不同风险程度的人群分类安排酒店集中居住闭环管理&#xff0c;依据“一店一策”的原则制定酒店疫情防控措施&#xff0c;严格“酒店&#43;场馆”两点一线进行闭环管控。</p>\n<p>　　据发布会介绍&#xff0c;海淀区在中关村国际自主创新示范区展示中心会议中心设立新闻中心。在“相约北京”系列冬季体育赛事期间&#xff0c;将为媒体记者提供海淀赛区相关图片、视频及文字等新闻素材。海淀区还将为测试赛、测试活动注册记者提供核酸检测和语言翻译等志愿服务&#xff0c;协调媒体采访、策划组织现场新闻发布及相关集体采访活动。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (11, '比超级计算机快千万倍！中国量子计算研究获重要进展', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104224056206_vdefr.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>　　近日&#xff0c;中科院量子信息与量子科技创新研究院科研团队在超导量子和光量子两种系统的量子计算方面取得重要进展&#xff0c;使我国成为目前世界上唯一在两种物理体系达到“量子计算优越性”里程碑的国家。</p>\n<p>　　经过研究攻关&#xff0c;超导量子计算研究团队构建了66比特可编程超导量子计算原型机“祖冲之二号”&#xff0c;实现了对“量子随机线路取样”任务的快速求解&#xff0c;比目前最快的超级计算机快一千万倍&#xff0c;计算复杂度比谷歌的超导量子计算原型机“悬铃木”高一百万倍&#xff0c;使得我国首次在超导体系达到了“量子计算优越性”里程碑。</p>\n<p>　　同时&#xff0c;光量子计算研究团队构建了113个光子144模式的量子计算原型机“九章二号”&#xff0c;处理特定问题的速度比超级计算机快亿亿亿倍&#xff0c;并增强了光量子计算原型机的编程计算能力。</p>\n<p>　　中国科学技术大学教授 陆朝阳&#xff1a;我们把之前的九章光量子计算机从之前的76个光子增加到了113个光子&#xff0c;比超级计算机快亿亿亿倍。</p>\n<p>　　超导量子比特与光量子比特是国际公认的有望实现可扩展量子计算的物理体系。量子计算机对特定问题的求解超越超级计算机即量子计算优越性&#xff0c;是量子计算发展的第一个里程碑。</p>\n<p>　　中国科学院院士 潘建伟&#xff1a;下一步我们希望能够通过4到5年的努力实现量子纠错&#xff0c;在使用量子纠错的基础之上&#xff0c;我们就可以来探索用一些专用的量子计算机或者量子模拟机来解决一些具有重大应用价值的科学问题。&#xff08;记者 帅俊全 安徽台 方田&#xff09;</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (12, '全国核酸检测机构超1.1万家 便民措施不断落地', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104223810718_6a5ax.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>　　新华社北京10月30日电&#xff08;记者彭韵佳、董瑞丰&#xff09;国家卫生健康委医政医管局监察专员郭燕红30日在国务院联防联控机制新闻发布会上说&#xff0c;当前我国可开展核酸检测的机构数量已经达到11581家&#xff0c;比去年3月提高4.6倍。</p>\n<p>　　郭燕红介绍&#xff0c;目前每天能够检测的数量达到单管单检2910万份&#xff0c;比去年3月提高22.1倍&#xff0c;通过混检的方法&#xff0c;整体检测效率和能力还能实现倍增。</p>\n<p>　　核酸检测在及时发现感染者、锁定感染范围以及降低传播风险等方面具有重要意义。据介绍&#xff0c;为进一步提高核酸检测的服务便利程度&#xff0c;国家卫生健康委将聚焦布局合理化、信息公开化、服务便利化开展工作&#xff1a;</p>\n<p>　　地方以设区市为单位&#xff0c;对核酸检测点进行网格化布局&#xff0c;让老百姓能够就近获得核酸检测服务&#xff1b;</p>\n<p>　　卫生健康行政部门要通过官方网站、客户端、微信公众号以及公共服务的小程序向社会公布辖区内所有核酸检测机构的名称、工作时间等&#xff1b;</p>\n<p>　　核酸检测机构要向社会提供24小时检测服务&#xff0c;对“应检尽检”“愿检尽检”的人群要力争在6小时以内反馈结果。</p>\n<p>　　郭燕红表示&#xff0c;国家卫生健康委将结合疫情防控形势&#xff0c;适时对部分地区进行抽检&#xff0c;重点检查核酸能力的提升情况以及检测的优化情况。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (13, '武夷山国家公园发现两栖动物、大型真菌新物种', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104223701330_qupit.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>　　新华社福州10月31日电&#xff08;记者张华迎&#xff09;记者从福建省林业局获悉&#xff0c;近日科研人员在武夷山国家公园范围内开展生物资源本底调查过程中&#xff0c;发现两栖动物新物种“武夷林蛙”、大型真菌新物种“多形油囊蘑”。相关科研成果已分别在国际学术期刊《Zookeys》《MycoKeys》上发表。</p>\n<p>　　武夷林蛙发现者之一、生态环境部南京环境科学研究所助理研究员吴延庆说&#xff0c;武夷林蛙是趾沟蛙种组中的一员&#xff0c;体型与同区域分布的镇海林蛙相似。与镇海林蛙相比&#xff0c;武夷林蛙的四肢背侧有多行横向排列的细肤褶。据了解&#xff0c;去年8月以来&#xff0c;专家们先后多次在相关水域发现这种林蛙&#xff0c;经过实验室标本比对和基因测序&#xff0c;结果显示这是一种从未被描述过的林蛙&#xff0c;由于在武夷山地区首次发现&#xff0c;故命名为武夷林蛙。</p>\n<p>　　生态环境部南京环境科学研究所助理研究员胡亚萍介绍&#xff0c;油囊蘑属此前被记录分布在欧洲、北美洲的温带地区&#xff0c;武夷山国家公园属于亚热带地区&#xff0c;多形油囊蘑的发现&#xff0c;极大丰富了油囊蘑属的分布范围&#xff0c;为油囊蘑属物种的分布、起源、演化等研究提供了重要的基础数据。</p>\n<p>　　开展生物资源本底调查&#xff0c;摸清生物资源家底、掌握生物多样性状况是提升国家公园建设和管护水平的重要前提。今年4月以来&#xff0c;在上级部门的指导下&#xff0c;武夷山国家公园管理局组织生态环境部南京环境科学研究所等单位启动了为期3年的生物资源本底调查&#xff0c;以掌握区域内生物资源的种类、分布特征和动态变化。</p>\n<p>　　武夷山国家公园横跨福建、江西两省&#xff0c;生物资源丰富、生物多样性富集&#xff0c;保存着世界同纬度带最完整、最典型、面积最大的中亚热带原生性森林生态系统。据了解&#xff0c;自2016年以来&#xff0c;武夷山国家公园已发现雨神角蟾、福建天麻、武夷凤仙花、武夷山对叶兰、武夷山孩儿参等多个新物种。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (14, '国家药品集采开展3年 老百姓用药便宜了多少？', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104222620564_vor4h.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>　　2018年11月&#xff0c;中央全面深化改革委员会第五次会议审议通过了《国家组织药品集中采购试点方案》。随后&#xff0c;中国开始在全国4个直辖市和7个副省级城市进行带量采购试点&#xff0c;简称“4&#43;7”。</p>\n<p>　　如今&#xff0c;国家药品集采开展已经3年&#xff0c;成效如何&#xff1f;老百姓的药费降了吗&#xff1f;</p>\n<p>　<strong><span style=\"color:navy\">　五批集采覆盖218种药品 平均降价54%</span></strong></p>\n<p>　　2018年&#xff0c;伴随“4&#43;7”拉开大幕&#xff0c;药品提质降价成为主旋律。</p>\n<p>　　根据中国药学会和中国医疗保险研究会3日在北京发布的《中国医保药品管理改革进展与成效蓝皮书》&#xff0c;目前&#xff0c;国家组织药品集中带量采购已经成功开展五批&#xff0c;共覆盖218种药品&#xff0c;平均降价54%&#xff0c;中选药品价格从国际价格的2-3倍以上下降到与之相当的水平。</p>\n<p>　　数据显示&#xff0c;集采改革以来截至2021年9月&#xff0c;累计节约费用约2500亿元。</p>\n<p>　　从药品品类来看&#xff0c;国家组织药品集采已经覆盖高血压、糖尿病、高血脂、慢性乙肝等慢性病和常见病的主流用药。</p>\n<p>　　这其中&#xff0c;高血压用药21种&#xff0c;占降压药市场规模的50%以上&#xff0c;使用最广泛的苯磺酸氨氯地平片降价79%&#xff0c;年治疗费用从300元降至60元。</p>\n<p>　　糖尿病用药共有15种&#xff0c;涉及金额约占口服降糖药市场规模的60%以上&#xff0c;集采后平均降价69%&#xff0c;使用最广泛的盐酸二甲双胍片降价53%。</p>\n<p>　　乙肝治疗药物替诺福韦&#xff0c;集采前价格为10.61元/片&#xff0c;年治疗费用3800元&#xff0c;集采后价格降至平均0.38元/片&#xff0c;降幅高达96%&#xff0c;一年治疗费用降至137元。一线用药恩替卡韦和替诺福韦酯年均治疗费用也分别从5500元、6000元下降到70元、150元左右。</p>\n<p>　　在首都医科大学附属北京友谊医院肝病中心主任贾继东看来&#xff0c;随着医保目录的日益完善和药价降低&#xff0c;我国肝病药物选择更加合理&#xff0c;诊断和治疗率得到提高&#xff0c;从而减少肝硬化和肝癌的发生&#xff0c;实现了更优策略的保障目标。</p>\n<p><strong><span style=\"color:navy\">　　救命药可及性增强</span></strong></p>\n<p>　　2018年&#xff0c;电影《我不是药神》让外界对高价抗癌药的关注度提升。如今&#xff0c;通过一系列改革举措&#xff0c;抗癌药的可及性也在增强。</p>\n<p>　　以肿瘤治疗药物吉非替尼为例&#xff0c;集采前价格为132元/片&#xff0c;年治疗费用高达4.7万元以上&#xff0c;集采后价格降至平均41.8元/片&#xff0c;降幅达到69%&#xff0c;年治疗费被控制在了1.5万元左右&#xff0c;医保报销后患者个人仅承担约0.6万元&#xff0c;负担大大减轻。</p>\n<p>　　此外&#xff0c;国家药品准入谈判也提高了患者的用药水平。2018年谈判成功的17种抗癌药&#xff0c;2021年第一季度比谈判前&#xff0c;药品用量增加25.8倍、药品金额增加8.8倍。</p>\n<p>　　蓝皮书显示&#xff0c;2015年第一季度至2021年第一季度&#xff0c;医保药品中抗肿瘤药的金额占比呈上升趋势&#xff0c;从2015年第一季度的7.0%增长至2021年第一季度的13.9%。</p>\n<p>　　抗肿瘤药亚类的金额、用量及同比增长率在谈判药品的带动下都有明显提升。患者对抗肿瘤药的可及性和可负担性均获得较大程度提高。</p>\n<p>　　北京大学肿瘤医院医疗保险服务处处长冷家骅分析称&#xff0c;“随着国家医保局的成立和医保药品目录动态调整机制的建立和逐渐完善&#xff0c;肿瘤诊疗所需创新药物价格昂贵、使用途径不规范、市场供应有限的问题得到极大改善&#xff0c;救急救命的好药的大量引入&#xff0c;优化了目录结构&#xff0c;改善了医疗生态。”</p>\n<p><strong>　<span style=\"color:navy\">　原研药不再享受超国民待遇</span></strong></p>\n<p>　　国家组织药品集采还带来了群众用药质量水平大幅提升。</p>\n<p>　　带量采购将原研药与同等质量的仿制药放在同一平台公平竞争&#xff0c;竞争结果直接与销量挂钩。集采模式下&#xff0c;原研药不再享受超国民待遇&#xff0c;促进了优质仿制药对原研药的替代&#xff0c;大幅提升了群众用药的可及性。</p>\n<p>　　此次发布的蓝皮书显示&#xff0c;第一批集采药品原研药使用量占比从22%降至11%&#xff1b;其中&#xff0c;用量较大的阿托伐他汀钙片原研药占比在“4&#43;7”试点地区从50%降至25%&#xff0c;在其他地区从37%降至11%。</p>\n<p>　　从药品疗效来看&#xff0c;仿制药也没有令人失望。</p>\n<p>　　首都医科大学宣武医院药学部主任张兰根据真实世界研究得出&#xff0c;“4&#43;7”带量采购中标药品中&#xff0c;14个通过一致性评价的仿制药与原研药在临床上具有等效性&#xff0c;能够保障人民群众享受优质、价宜的药品。</p>\n<p>　　如今&#xff0c;为了享受改革红利、抢占市场&#xff0c;仿制药企业正不断加大一致性评价投入力度。</p>\n<p>　　来自蓝皮书的数据显示&#xff0c;截至2021年9月底&#xff0c;已有537个通用名品种、2696个产品通过一致性评价。</p>\n<p>　　分析认为&#xff0c;集采改革使得药品生产行业集中度进一步提升&#xff0c;头部药企将发展重心转向首仿、难仿药品的开发&#xff0c;提升了药品质量水平。</p>\n<p>　　而一系列举措背后&#xff0c;最终受益的将是每一位普通患者。&#xff08;记者 张尼&#xff09;</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (15, '教培机构如何转型？职教培训或是一条明路', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104223430598_908j4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '字迹潦草，重写！', '0', '<p>　　当前&#xff0c;“双减”政策落地&#xff0c;严控学科类培训&#xff0c;教育培训机构或可转型发力职业教育这一板块。</p>\n<p><strong>　　职业教育证书培训</strong></p>\n<p><strong>　　亟待教培机构深度参与</strong></p>\n<p>　　2019年&#xff0c;教育部等部门启动“1&#43;X证书”制度试点&#xff0c;要求职业院校学生毕业时要同时获得学历证书与若干技能等级证书。在政策推动下&#xff0c;在校学生职业技能培训或许是教育培训服务新的增长点。</p>\n<p>　　以浙江杭州的情形为例&#xff0c;31所中职学校已实现了“1&#43;X证书”培训全覆盖。目前看来&#xff0c;学校与教育培训机构的合作方式主要分为两类&#xff1a;一类是紧密合作型&#xff0c;通过共建产业学院等实体形式开展。证书培训纳入学校人才培养体系&#xff0c;学生和企业的认可度较高。另一类是购买服务型。部分学校通过购买培训视频、试题库等服务&#xff0c;并承担学生考证费、教师考评员费用&#xff0c;实现教育培训转移支付。</p>\n<p>　　教育培训机构进入职业教育证书培训领域&#xff0c;证书的含金量是关键。职业教育证书培训亟待更多规模型、领军型企业深度参与&#xff0c;不断增强社会对职业等级证书的认可度。</p>\n<p><strong>　　教培机构应转型&#xff0c;</strong></p>\n<p><strong>　　搭建职业技能人才供应桥梁</strong></p>\n<p>　　当前&#xff0c;中国教育普遍面临的困境是学校教育模式与众多企业实际需求的不匹配。此外&#xff0c;由于社会需求的多元化&#xff0c;新兴行业不断涌现&#xff0c;也需要岗位培训前置。搭建职业技能人才供应桥梁&#xff0c;探索职业教育需求下沉路径&#xff0c;应成为教育培训机构转型的着力点&#xff0c;是拓展职业教育服务领域的关键所在。</p>\n<p>　　具体而言&#xff0c;一方面通过与企业的合作&#xff0c;提供定向招募员工快速适岗培训服务&#xff0c;另一方面为院校提供课程体系、共建职业导向专业。教育培训企业的优势就在于可依托自身技术优势与教研能力&#xff0c;提供更有深度&#xff0c;更符合市场期待的培训解决方案。比如借助大数据分析&#xff0c;可做出行业就业人数预测模型&#xff0c;开展后备人才精准培训。至于发挥在线教育优势&#xff0c;提供适合成人的碎片化培训&#xff0c;更是教育培训企业大有可为的天地。</p>\n<p>　　此外&#xff0c;领军教育企业还可依托全球化布局的战略优势&#xff0c;引入海外先进的高端培训项目及更多国内有需求的国际技能证书&#xff0c;培养全球领先的技能型人才。</p>\n<p><strong>　　深耕合作新天地&#xff0c;</strong></p>\n<p><strong>　　正视行业老问题</strong></p>\n<p>　　职业教育为教育培训机构转型提供了新赛道&#xff0c;但一些现实存在的问题也需要正视。</p>\n<p>　　其一&#xff0c;如前所述&#xff0c;职业教育在校学生现阶段培训需求集中在考证上。相应地&#xff0c;获得教育部门认可的培训资质对于教培机构就尤为重要。由于“1&#43;X证书”体系是以企业为主导&#xff0c;机构难于凭一己之力获得职业教育细分领域的专业资质&#xff0c;如何取得相关企业背书&#xff0c;还需要政策性安排乃至制度性支持。</p>\n<p>　　其二&#xff0c;职业教育培训需要与学校深度合作。职业教育专业数量众多&#xff0c;学科内容分散&#xff0c;技能培训又多需设备支持。因此&#xff0c;无论是培训或是考证&#xff0c;都需要依托学校方可持续发展。目前&#xff0c;教育培训机构对职校教师的培训已有较多经验&#xff0c;接下来怎样拓展机构与学校合作领域&#xff0c;乃至探索共建“教研理事会”&#xff0c;以此推动职业教育类型化、个性化发展&#xff0c;值得教育培训机构深思。</p>\n<p>　　其三&#xff0c;短期就业培训亟待行业规范。此类培训&#xff0c;市场规范性较差&#xff0c;虚假宣传、收费过高等问题久受诟病。规模型教育培训机构如欲参与&#xff0c;当致力引导此类培训形成规范化机制&#xff0c;带动健康生态的培育。</p>\n<p>　　另外&#xff0c;在线教育有望成为职业教育培训主流&#xff0c;教育培训机构应利用自身相关技术与人才优势&#xff0c;有针对性地开发适合职业教育的培训内容&#xff0c;丰富职业教育在线学习的形式&#xff0c;为职业教育在“互联网&#43;”变革中找到高质量发展新模式&#xff0c;贡献独特的力量。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (22, '国际奥委会北京冬奥会协调委员会召开第六次会议', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '新华社', '/uploads/1/image/2021/11/20211104222348689_qh9w7.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 'ec3953cc-0591-11ed-91b1-005056c00008', NULL, '0', '<p>　　新华社北京11月2日电 2日&#xff0c;国际奥委会北京2022年冬奥会协调委员会以视频形式召开第六次会议&#xff0c;就冬奥筹办最后阶段重点问题进行沟通协商。北京市委书记、北京冬奥组委主席蔡奇&#xff0c;国际奥委会北京2022年冬奥会协调委员会主席胡安·安·萨马兰奇通过视频致辞。</p>\n<p>　　11月2日&#xff0c;北京市委书记、北京冬奥组委主席蔡奇通过视频致辞。新华社记者鞠焕宗摄</p>\n<p>　　蔡奇在致辞中代表北京冬奥组委&#xff0c;向协调委员会各位委员长期以来给予北京冬奥会的支持帮助表示感谢。他说&#xff0c;北京2022年冬奥会和冬残奥会是我国重要历史节点的重大标志性活动。中国政府高度重视冬奥筹办工作&#xff0c;习近平主席多次深入赛区一线视察&#xff0c;召开专题会议研究部署&#xff0c;作出一系列重要指示&#xff0c;为我们做好筹办工作指明了方向。北京冬奥组委与国内外各方面紧密合作&#xff0c;全面落实绿色、共享、开放、廉洁的办奥理念&#xff0c;精益求精、稳步有序推进各项筹办任务。前不久&#xff0c;承载着奥林匹克精神的奥运火种顺利抵达北京&#xff0c;发布了《北京2022年冬奥会和冬残奥会防疫手册》&#xff0c;举办了北京冬奥会倒计时100天活动&#xff0c;公布了北京冬奥会和冬残奥会奖牌&#xff0c;赛事准备工作已基本准备就绪&#xff0c;正在举办系列国际测试赛进行全面检验。</p>\n<p>　　蔡奇说&#xff0c;当前&#xff0c;全球新冠肺炎疫情持续蔓延&#xff0c;给冬奥筹办工作带来挑战。希望国际奥委会和北京冬奥组委共同携手&#xff0c;心怀“一起向未来”的美好愿望&#xff0c;展现“更团结”的奥林匹克精神&#xff0c;引导各利益相关方遵守《防疫手册》规定。我们将努力克服各种困难挑战&#xff0c;圆满完成各项筹办任务&#xff0c;举办一届给世界留下深刻印象和美好回忆的奥运盛会。</p>\n<p>　　胡安·安·萨马兰奇在致辞中高度赞赏北京冬奥会和冬残奥会筹办工作。他说&#xff0c;国际测试赛正在进行中&#xff0c;赛事组织工作非常出色&#xff0c;参赛运动员和国际单项体育联合会对比赛场馆反馈极好。北京冬奥会宣传持续升温&#xff0c;冰雪运动和普及推广活动丰富多彩&#xff0c;“带动三亿人参与冰雪运动”的目标正在逐步实现。《防疫手册》的发布&#xff0c;更是为安全成功办赛作出贡献。国际奥委会将与北京冬奥组委保持沟通合作&#xff0c;共同克服各种困难&#xff0c;确保北京冬奥会成功举办。</p>\n<p>　　会议听取了北京冬奥会筹办工作最新进展和冬奥会防疫手册、测试赛及场馆、火炬传递、新闻宣传等内容的专题陈述。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (23, '第一波“双11”数据背后，新消费的潜力有多大？', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104223308496_acfyr.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '111a338c-0591-11ed-9e2d-005056c00008', NULL, '0', '<p id=\"ENAhO3AcQeYxURGy\">　　2021年的“双11”&#xff0c;比往年来得都要早。</p>\n<p id=\"ENAhO3AcQeYxURGy\"></p>\n<p id=\"18naz53YhvYr6v3w\">　　今年的“京东11.11全球热爱季”于10月31日晚8点全面启动&#xff0c;<strong>4个小时内累计售出商品超1.9亿件。</strong></p>\n<p id=\"gwaXcK3k2YQDhSJ1\">　　11月1日零时&#xff0c;天猫“双11”第一波正式开售&#xff0c;据不完全统计&#xff0c;<strong>天猫“双11”开售首小时&#xff0c;超2600个品牌的成交额超过去年11月1日全天。</strong>本季“双11”经历第一波“洪峰”&#xff0c;消费热情全面爆发。</p>\n<p id=\"WSdlEHpJF2GQbhOo\">　　“双11”从“光棍节”到“双节棍”再到全民狂欢&#xff0c;每一届的“双11”似乎都在拥抱变化&#xff0c;拥抱新的消费市场。与往年相比&#xff0c;今年“双11”有三大亮点&#xff1a;</p>\n<p id=\"ZOncgDqqSw7719sA\">　　<strong>一是直播带货已成为“双11”重要销售方式&#xff0c;改变了过去以“商品”为主的引流方式&#xff0c;向着以“内容”为主的引流方式转变。</strong>我们看到&#xff0c;除了短视频平台外&#xff0c;传统电商在今年“双11”都加大了直播渠道的营销投放力度&#xff0c;有更多的主播&#xff0c;更多的商家通过直播渠道来宣传“双11”的优惠商品和服务。</p>\n<p id=\"CC8u4GkP6ceeUETh\">　　<strong>二是消费者个性定制&#xff0c;从过去“商家卖什么&#xff0c;消费者买什么”&#xff0c;到现在“消费者要什么&#xff0c;商家生产什么”。</strong>平台可以根据海量用户数据&#xff0c;深度洞察消费者需求&#xff0c;与商家一起挖掘细分市场&#xff0c;打造单品爆款&#xff0c;实现供应链的智能化。消费者还可以根据个人喜好进行产品定制化生产&#xff0c;如私人订制的衬衫、家具等。</p>\n<p id=\"ATJHAHQz7S918OXM\">　　<strong>三是新国货成为“双11”重要的消费新增长点&#xff0c;消费者已从“只买国际大牌”到“要买国货潮牌”。</strong></p>\n<p id=\"F8evRgofRtjXpLpK\">　　从天猫“双11”开售首小时的数据来看&#xff0c;国货品牌的表现尤为抢眼。据中国经济网报道&#xff0c;鸿星尔克、五菱汽车、小鹏汽车、薇诺娜、云鲸、添可、林氏木业、牧高笛、回力、蕉下、褚橙、方回春堂、太平鸟、bosie等国货品牌&#xff0c;在1小时内就超过了去年全天的销售额。</p>\n<p id=\"BNwqmZfWMszX4BoM\">　　这里新国货既包括新生代品牌&#xff0c;也包括老品牌和老字号的焕新。新国货在美妆、家电、手机、汽车、服装等品类表现抢眼&#xff0c;尤其受到90后、00后年轻人的喜爱&#xff0c;正加速实现对国际品牌的全面赶超。新国货崛起靠的不是低价竞争&#xff0c;而是体现了消费者对商品性价比的追求。</p>\n<p>2020年11月10日&#xff0c;在中国邮政集团广州航空邮件处理中心&#xff0c;工作人员在总包待发区内作业。新华社记者 邓华 摄</p>\n<p id=\"qTAeEzwOvtEp4HD5\">　　在疫情防控进入新的平稳阶段下&#xff0c;作为线上最大的消费购物节&#xff0c;“双11”电商大促无疑对拉动消费具有积极作用。</p>\n<p id=\"g1VgOAwUwmEo5foU\">　　<strong>一是提振消费信心&#xff0c;助力经济增长。</strong>近年来&#xff0c;随着我国经济由高速增长阶段转向高质量发展阶段&#xff0c;消费作为经济增长“压舱石”的重要性日益凸显&#xff0c;消费日益成为拉动中国经济增长的第一动力。今年“双11”比往年开始得更早&#xff0c;将会对10月、11月两个月的实物商品网上零售额有明显的拉动作用。今年以来&#xff0c;我国网络零售市场继续保持稳步增长态势。前三季度&#xff0c;全国网上零售额达9.19万亿元&#xff0c;同比增长18.5%&#xff1b;其中&#xff0c;实物商品网上零售额7.5万亿元&#xff0c;同比增长15.2%&#xff0c;占社会消费品零售总额的比重为23.6%。</p>\n<p id=\"J49dY3wKTUv3dzyG\">　　预计“双11”将对10月、11月两个月的社会消费品零售总额增长有较大的带动作用&#xff0c;大大提振消费信心&#xff0c;彰显我国超大规模市场的无限潜力。</p>\n<p id=\"9jP3dRtmi3MAXGU1\">　　<strong>二是促进消费线上线下进一步融合&#xff0c;消费新模式、新业态层出不穷。</strong>“双11”有越来越多的平台和品牌重视线上和线下消费场景的整合。过去“双11”只是线上电商的“狂欢节”&#xff0c;近年来“双11”将营销进行了全渠道布局&#xff0c;实现了由线下门店体验向线上导流客源&#xff0c;再回到线下购买的数字营销&#xff0c;优化了消费者在线下门店的购物体验&#xff0c;助力了品牌私域流量打造。部分商家借“双11”推广与虚拟现实技术、物联网技术相融合的消费新业态&#xff0c;更多丰富、有趣的新消费形式&#xff0c;如无人超市、无人咖啡店等。</p>\n<p id=\"3ciBIx9wIjHPQDTU\">　　当前&#xff0c;消费已成为我国经济发展的主引擎&#xff0c;在扩大内需的背景下&#xff0c;把超大规模市场优势和消费潜力充分激发出来&#xff0c;是构建新发展格局的必然要求。进一步挖掘新经济拉动消费的潜力&#xff0c;一是要顺应消费升级趋势&#xff0c;借助新一代信息技术&#xff0c;提升传统消费&#xff0c;培育新型消费。积极推动线上线下消费有机融合&#xff0c;平台需要进一步赋能和服务实体经济。二是创新数字产品和服务供给&#xff0c;推动数字消费、服务消费快速发展。促进消费向绿色、健康、安全发展。三是要通过稳定就业、优化收入分配、改善消费环境、强化公共服务、创新消费促进机制等方式&#xff0c;进一步形成需求牵引供给、供给创造需求的更高水平动态平衡&#xff0c;为我国经济实现高质量发展、构建新发展格局注入新动能。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (24, '智利前财长贝拉斯科：拉美经济难以回归增长轨迹', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211105135315234_m5q0c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p class=\"one-p\"><strong>参考消息网11月4日报道</strong>世界报业辛迪加网站11月1日发表智利前财政部长、前总统候选人安德烈斯·贝拉斯科的文章称&#xff0c;拉美经济难以回归增长轨迹。全文摘编如下&#xff1a;</p>\n<p class=\"one-p\">拉美人有很多天赋&#xff0c;其中一个是自我管理不善的非凡能力&#xff0c;就像疫情所表明的那样。在世界人均新冠死亡病例最多的20个国家中&#xff0c;有6个在拉丁美洲。</p>\n<p class=\"one-p\">贫困、医院床位短缺和住房过度拥挤都助长了病毒传播&#xff0c;但仅凭这些还无法解释为何该地区的表现如此糟糕。亚洲和非洲的许多国家也面临同样的问题&#xff0c;但人均死亡病例却较少。</p>\n<p class=\"one-p\">拉丁美洲再次做好了领先全球的准备——这一次是在疫情后的经济失败方面。在大宗商品价格高企的推动下&#xff0c;该地区经历了几个季度的强劲复苏&#xff0c;但一些国家的增长引擎已经开始熄火。国际货币基金组织&#xff08;IMF&#xff09;预计&#xff0c;拉丁美洲将成为2022年世界上增长最慢的地区&#xff0c;它可能永远也不会回到疫情前所展望的人均收入增长路线上了。相比之下&#xff0c;IMF预测发达经济体将很快恢复疫情前的发展轨迹。</p>\n<p class=\"one-p\">标准经济增长理论坚称穷国会逐渐赶上富国。拉丁美洲是这一规律中的例外&#xff1a;在可以预见的未来&#xff0c;它会落后得更多。</p>\n<p class=\"one-p\">尽管面临种种困难&#xff0c;如果能够抓住两个机会&#xff0c;拉丁美洲仍然能够重新实现增长&#xff1a;一个机会是疫情和中国与西方紧张关系加剧所导致的回流&#xff1b;加大对绿色基础设施的投资也会有所帮助。</p>\n<p class=\"one-p\">有句老话说&#xff1a;“巴西是未来之国&#xff0c;永远都是。”如今&#xff0c;太多管理不善的其他拉美国家也面临同样的命运。</p>', NULL, 1, '[]', '[{\"url\": \"/uploads/1/file_demo.zip\", \"name\": \"互联网交通综合服务平台.zip\", \"length\": 47616}, {\"url\": \"/uploads/1/file_demo.zip\", \"name\": \"关于冬季奥运会开幕式的公告.zip\", \"length\": 39424}]', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (25, '峰爆', NULL, NULL, NULL, NULL, '0', NULL, '朱一龙黄志忠演绎中国式救援', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211108190618610_tr5s3.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"华语\", \"type\": \"动作\", \"areaKey\": \"1\", \"typeKey\": \"4\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (26, 'Adobe Reader', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211110112249015_3npw8.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/file_demo.zip', '下载演示_adobe_reader.zip', 158, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p><strong>Adobe Reader 官方中文版</strong>下载&#xff0c;支持打开和使用 Adobe PDF 的工具&#xff0c;可查看、打印和管理 PDF。若已经安装过之前的版本&#xff0c;请先卸载后再安装此版本&#xff01;</p>\n<p>在 Reader 中打开 PDF 后&#xff0c;可以使用多种工具快速查找信息。</p>\n<p>如果您收到一个 PDF 表单&#xff0c;则可以在线填写并以电子方式提交。</p>\n<p>如果收到审阅 PDF 的邀请&#xff0c;则可使用注释和标记工具为其添加批注。</p>\n<p>使用 Reader 的多媒体工具可以播放 PDF 中的视频和音乐。</p>\n<p>如果 PDF 包含敏感信息&#xff0c;则可利用数字身份证对文档进行签名或验证。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"star\": \"★★★★☆\", \"type\": \"国外软件\", \"system\": \"win7\", \"license\": \"收费软件\", \"starKey\": \"4\", \"typeKey\": \"2\", \"language\": \"英文\", \"systemKey\": \"2\", \"licenseKey\": \"2\", \"languageKey\": \"3\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (27, '火狐浏览器', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211110112529820_5igwi.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/file_demo.zip', '下载演示_firefox.zip', 158, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>Mozilla Firefox&#xff0c;中文名通常称为“火狐”或“火狐浏览器”&#xff0c;是一个开源网页浏览器&#xff0c;使用Gecko引擎&#xff08;非ie内核&#xff09;&#xff0c;支持多种操作系统如Windows、Mac和linux。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"star\": \"★★★☆☆\", \"type\": \"国外软件\", \"system\": \"win7\", \"license\": \"免费软件\", \"starKey\": \"3\", \"typeKey\": \"2\", \"language\": \"简体中文\", \"systemKey\": \"2\", \"licenseKey\": \"1\", \"languageKey\": \"1\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (28, 'WPS', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211110134344757_3nv60.png', NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/file_demo.zip', '下载演示_wps.zip', 158, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>WPS Office是由金山软件股份有限公司自主研发的一款办公软件套装&#xff0c;可以实现办公软件最常用的文字、表格、演示等多种功能。具有内存占用低、运行速度快、体积小巧、强大插件平台支持、免费提供海量在线存储空间及文档模板、支持阅读和输出PDF文件、全面兼容微软格式&#xff08;doc/docx/xls/xlsx/ppt/pptx等&#xff09;独特优势。覆盖Windows、Linux、Android、iOS等多个平台。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"star\": \"★★★★☆\", \"type\": \"国外软件\", \"system\": \"win7\", \"license\": \"收费软件\", \"starKey\": \"4\", \"typeKey\": \"2\", \"language\": \"简体中文\", \"systemKey\": \"2\", \"licenseKey\": \"2\", \"languageKey\": \"1\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (29, 'QQ', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211110120854616_w31vb.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/file_demo.zip', '下载演示_qq.zip', 158, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>免费的即时聊天软件&#xff0c;给上网带来更多沟通乐趣。腾讯QQ皮肤呈现视觉盛宴&#xff0c;皮肤编辑器实现个性化面板创意&#xff1b;QQ应用盒子全新呈现&#xff0c;丰富应用满足多彩生活&#xff1b;QQ短信首度面世&#xff0c;畅享无处不在的沟通体验&#xff1b;炫彩字体&#xff0c;炫出聊天个性与风采&#xff1b;QQ支持自定义标签&#xff0c;标签顺序随心换。提示&#xff1a;如果您正在运行着腾讯QQ或者TM ,请退出后再进行一键安装。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"star\": \"★★★★★\", \"type\": \"国产软件\", \"system\": \"win7\", \"license\": \"免费软件\", \"starKey\": \"5\", \"typeKey\": \"1\", \"language\": \"繁体中文\", \"systemKey\": \"1\", \"licenseKey\": \"1\", \"languageKey\": \"2\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (30, 'VS Code 编辑器', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211110121255183_6aqfa.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/file_demo.zip', '下载演示_vscode.zip', 158, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>VSCode&#xff08;全称&#xff1a;Visual Studio Code&#xff09;是一款由微软开发且跨平台的免费源代码编辑器。该软件支持语法高亮、代码自动补全&#xff08;又称 IntelliSense&#xff09;、代码重构、查看定义功能&#xff0c;并且内置了命令行工具和 Git 版本控制系统。用户可以更改主题和键盘快捷方式实现个性化设置&#xff0c;也可以通过内置的扩展程序商店安装扩展以拓展软件功能。</p>\n<p>VS Code 使用 Monaco Editor 作为其底层的代码编辑器。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 1, 0, 13, 0, 0, 0, 13, 13, '{\"star\": \"★★★★☆\", \"type\": \"国产软件\", \"system\": \"win7\", \"license\": \"免费软件\", \"starKey\": \"4\", \"typeKey\": \"1\", \"language\": \"简体中文\", \"systemKey\": \"1\", \"licenseKey\": \"1\", \"languageKey\": \"1\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (31, '关于我妈的一切', NULL, NULL, NULL, NULL, '0', NULL, '徐帆张婧仪演绎中国式母女', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211111105757848_bttmt.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"欧洲\", \"type\": \"悲剧\", \"areaKey\": \"3\", \"typeKey\": \"2\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (32, '热带雨', NULL, NULL, NULL, NULL, '0', NULL, '南国春梦禁忌之恋', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211111105937943_ttq2n.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"韩国\", \"type\": \"爱情\", \"areaKey\": \"4\", \"typeKey\": \"3\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (33, '夏日友晴天', NULL, NULL, NULL, NULL, '0', NULL, '海怪男孩的梦幻冒险之旅', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211111110031366_6gngc.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"华语\", \"type\": \"喜剧\", \"areaKey\": \"1\", \"typeKey\": \"1\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (34, '新逃学威龙', NULL, NULL, NULL, NULL, '0', NULL, '二龙湖浩哥&罗家英演绎爆笑喜剧', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211111110118656_fcr3x.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"欧洲\", \"type\": \"爱情\", \"areaKey\": \"3\", \"typeKey\": \"3\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (35, '星辰大海', NULL, NULL, NULL, NULL, '0', NULL, '刘涛林峯上演豪门恋', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211122154901380_aueka.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"美国\", \"type\": \"喜剧\", \"areaKey\": \"2\", \"typeKey\": \"1\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (36, '一见倾心', NULL, NULL, NULL, NULL, '0', NULL, '司令夫妇星光甜吻表白', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211122154637913_e1e7q.jpg', '/uploads/1/video_demo.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"area\": \"华语\", \"type\": \"悲剧\", \"areaKey\": \"1\", \"typeKey\": \"2\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (37, '美丽的日出日落风景', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211112181255426_puyn8.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, '[{\"url\": \"/uploads/1/image/2021/11/20211112181242149_b7voo.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112181242418_7olxk.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112181242454_v9mmp.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112181242446_1fsr0.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112181242471_w5cci.jpg\", \"name\": \"\", \"description\": \"\"}]', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (38, '清新穿衣搭配 尽显女神风范', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211112182335734_9p89i.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, '[{\"url\": \"/uploads/1/image/2021/11/20211112181835422_e4j2k.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112181835756_xhyeo.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112181835756_l6ylw.jpg\", \"name\": \"\", \"description\": \"\"}]', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (39, '温柔娴静 五官精致', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211112182722661_3kbny.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, '[{\"url\": \"/uploads/1/image/2021/11/20211112182654849_kemtl.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112182654847_0uq5o.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112182654862_t0q85.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112182654870_gl8rg.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112182654870_wrdu4.jpg\", \"name\": \"\", \"description\": \"\"}]', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (40, '优雅迷人 复古温柔', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211112182957845_keu7f.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, '[{\"url\": \"/uploads/1/image/2022/01/20220105215123966_e3gf1.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215123974_9kag6.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215123966_npvr7.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215123981_p4pvt.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215123974_gibmm.jpg\", \"name\": \"\", \"description\": \"\"}]', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (41, '亮片套装蛮腰吸睛 红唇雪肌明艳动人', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211112183104456_7499y.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, '[{\"url\": \"/uploads/1/image/2022/01/20220105215049954_9xhpe.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215049954_gpfsk.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215049954_97jm2.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215049954_3u2m5.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2022/01/20220105215049954_5h18u.jpg\", \"name\": \"\", \"description\": \"\"}]', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (42, '浓眉攻守两端展现统治力', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211112183426133_uukxi.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, '[{\"url\": \"/uploads/1/image/2021/11/20211112183234907_ch5kw.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112183234907_9xnib.jpg\", \"name\": \"\", \"description\": \"\"}, {\"url\": \"/uploads/1/image/2021/11/20211112183234907_8swxk.jpg\", \"name\": \"\", \"description\": \"\"}]', NULL, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (43, 'iPhone 13 Pro Max', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164245284_ls4os.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<div class=\"techspecs-section section-splash-water-resistance\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">防溅、抗水、防尘</div>\n<div class=\"techspecs-column\">\n<p>效果在 IEC 60529 标准下达到 IP68 级别 (在最深 6 米的水下停留时间最长可达 30 分钟)</p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-chip\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">芯片</div>\n<div class=\"techspecs-column\">\n<div class=\"row\">\n<div class=\"column large-2 medium-3 small-12\"> </div>\n<div class=\"column copy large-10 medium-9 small-12 small-push-0\">\n<ul class=\"techspecs-list\"><li>A15 仿生芯片</li><li>全新 6 核中央处理器&#xff0c;具有 2 个性能核心和 4 个能效核心</li><li>全新 5 核图形处理器</li><li>全新 16 核神经网络引擎</li></ul>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>Pro 级 1200 万像素摄像头系统 (长焦、广角及超广角)</li><li>长焦&#xff1a;ƒ/2.8 光圈</li><li>广角&#xff1a;ƒ/1.5 光圈</li><li>超广角&#xff1a;ƒ/1.8 光圈和 120° 视角</li><li>3 倍光学变焦 (放大)&#xff0c;2 倍光学变焦 (缩小)&#xff1b;6 倍光学变焦范围</li><li>最高可达 15 倍数码变焦</li><li>夜间模式人像 (通过激光雷达扫描仪实现)</li><li>人像模式&#xff0c;支持先进的焦外成像和景深控制</li><li>人像光效&#xff0c;支持六种效果 (自然光、摄影室灯光、轮廓光、舞台光、单色舞台光和高调单色光)</li><li>双摄像头光学图像防抖功能 (长焦和广角)</li><li>传感器位移式光学图像防抖功能 (广角)</li><li>六镜式镜头 (长焦和超广角)&#xff1b;七镜式镜头 (广角)</li><li>原彩闪光灯&#xff0c;支持慢速同步</li><li>全景模式 (最高可达 6300 万像素)</li><li>蓝宝石玻璃镜头表面</li><li>100% Focus Pixels (广角)</li><li>夜间模式</li><li>深度融合技术</li><li>智能 HDR 4</li><li>摄影风格</li><li>微距摄影</li><li>Apple ProRAW</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正 (超广角)</li><li>先进的红眼校正功能</li><li>照片地理标记功能</li><li>自动图像防抖功能</li><li>连拍快照模式</li><li>图像拍摄格式&#xff1a;HEIF 和 JPEG</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-recording\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频拍摄</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>电影效果模式可拍摄浅景深视频 (1080p&#xff0c;30 fps)</li><li>杜比视界 HDR 视频拍摄&#xff0c;最高可达 4K&#xff0c;60 fps</li><li>4K 视频拍摄&#xff0c;24 fps、25 fps、30 fps 或 60 fps</li><li>1080p 高清视频拍摄&#xff0c;25 fps、30 fps 或 60 fps</li><li>720p 高清视频拍摄&#xff0c;30 fps</li><li>ProRes 视频拍摄&#xff0c;最高可达 4K&#xff0c;30 fps (128GB 容量机型最高可达 1080p&#xff0c;30 fps)</li><li>双摄像头视频光学图像防抖功能 (长焦和广角)</li><li>传感器位移式视频光学图像防抖功能 (广角)</li><li>3 倍光学变焦 (放大)&#xff0c;2 倍光学变焦 (缩小)&#xff1b;6 倍光学变焦范围</li><li>最高可达 9 倍数码变焦</li><li>音频变焦</li><li>原彩闪光灯</li><li>视频快录功能</li><li>慢动作视频&#xff0c;1080p (120 fps 或 240 fps)</li><li>延时摄影视频&#xff0c;支持防抖功能</li><li>夜间模式延时摄影</li><li>影院级视频防抖功能 (4K、1080p 和 720p)</li><li>连续自动对焦视频</li><li>4K 视频录制过程中拍摄 800 万像素静态照片</li><li>变焦播放</li><li>视频录制格式&#xff1a;HEVC 和 H.264</li><li>立体声录音</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-truedepth-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">原深感摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>1200 万像素摄像头</li><li>ƒ/2.2 光圈</li><li>人像模式&#xff0c;支持先进的焦外成像和景深控制</li><li>人像光效&#xff0c;支持六种效果 (自然光、摄影室灯光、轮廓光、舞台光、单色舞台光和高调单色光)</li><li>动话表情和拟我表情</li><li>夜间模式</li><li>深度融合技术</li><li>智能 HDR 4</li><li>摄影风格</li><li>Apple ProRAW</li><li>电影效果模式可拍摄浅景深视频 (1080p&#xff0c;30 fps)</li><li>杜比视界 HDR 视频拍摄&#xff0c;最高可达 4K&#xff0c;60 fps</li><li>4K 视频拍摄&#xff0c;24 fps、25 fps、30 fps 或 60 fps</li><li>1080p 高清视频拍摄&#xff0c;25 fps、30 fps 或 60 fps</li><li>ProRes 视频拍摄&#xff0c;最高可达 4K&#xff0c;30 fps (128GB 容量机型最高可达 1080p&#xff0c;30 fps)</li><li>慢动作视频&#xff0c;1080p (120 fps)</li><li>延时摄影视频&#xff0c;支持防抖功能</li><li>夜间模式延时摄影</li><li>影院级视频防抖功能 (4K、1080p 和 720p)</li><li>视频快录功能</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正</li><li>视网膜屏闪光灯</li><li>自动图像防抖功能</li><li>连拍快照模式</li></ul>\n</div>\n</div>\n</div>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"price\": \"9688\", \"screen\": \"5.5-5.99英寸\", \"storage\": \"512GB\", \"screenKey\": \"2\", \"guidePrice\": \"9799\", \"storageKey\": \"4\", \"specifications\": \"<div class=\\\"Ptable\\\">\\n<div class=\\\"Ptable-item\\\">\\n<div class=\\\"Ptable\\\">\\n<div class=\\\"Ptable-item\\\">\\n<h3>主体</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>入网型号</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>A2644</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>上市月份</dt>\\n<dd>9月</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>上市年份</dt>\\n<dd>2021年</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>基本信息</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>运营商标志或内容</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>无标志或内容</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>机身厚度(mm)</dt>\\n<dd>7.65</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>机身宽度（mm）</dt>\\n<dd>78.1</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>机身材质</dt>\\n<dd>以官网信息为准</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>机身材质分类</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>机身长度（mm）</dt>\\n<dd>160.8</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>机身重量（g）</dt>\\n<dd>238</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>主芯片</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>CPU品牌</dt>\\n<dd>以官网信息为准</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>屏幕</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>屏幕材质类型</dt>\\n<dd>OLED</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>主屏幕尺寸</dt>\\n<dd>6.7英寸</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>屏幕像素密度（ppi）</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>458&nbsp;ppi</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>后置摄像头</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>后摄主摄光圈</dt>\\n<dd>f/2.8</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>后摄主摄光学防抖</dt>\\n<dd>支持光学防抖</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>后摄2摄像头功能</dt>\\n<dd>超广角</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>后摄2摄光圈</dt>\\n<dd>f/1.8</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>闪光灯</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>前置摄像头</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>前摄主摄光圈</dt>\\n<dd>f/2.2</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>闪光灯</dt>\\n<dd>屏幕补光</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>电池信息</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>电池可拆卸</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>不可拆卸</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>无线充电</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>支持无线充电</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>充电器</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>网络支持</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>SIM卡类型</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>Nano SIM</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>5G网络</dt>\\n<dd>移动5G；联通5G；电信5G</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>4G网络</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>3G/2G网络</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>网络频率(2G/3G)</dt>\\n<dd>以官网信息为准</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>双卡机类型</dt>\\n<dd>双卡双待</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>最大支持SIM卡数量</dt>\\n<dd>2个</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>数据接口</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>耳机接口类型</dt>\\n<dd>Lightning</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>NFC/NFC模式</dt>\\n<dd>支持（读卡器模式）</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>充电接口类型</dt>\\n<dd>Lightning（iPhone）</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>数据传输接口</dt>\\n<dd>WIFI；蓝牙；NFC</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>辅助功能</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>常用功能</dt>\\n<dd>计算器；屏幕录制器</dd>\\n</dl>\\n</div>\\n</div>\\n<div class=\\\"package-list\\\">\\n<h3>包装清单</h3>\\n<p>装有 iOS 15 的 iPhone*1 USB-C 转闪电连接线*1 资料*1</p>\\n</div>\\n</div>\\n</div>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (44, 'Apple iPad Pro 12.9', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164237664_e7b1v.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<div class=\"techspecs-section section-chip\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">芯片</div>\n<div class=\"techspecs-column row\">\n<div class=\"column column-chip-image large-2 medium-3 small-12\"> </div>\n<div class=\"column column-chip-copy large-10 medium-9 small-12\">\n<ul class=\"techspecs-list\"><li>Apple M1 芯片</li><li>8 核中央处理器&#xff0c;具有 4 个性能核心和 4 个能效核心</li><li>8 核图形处理器</li><li>16 核神经网络引擎</li><li>8GB 内存 (存储容量为 128GB、256GB 或 512GB 的机型)</li><li>16GB 内存 (存储容量为 1TB 或 2TB 的机型)</li></ul>\n</div>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>Pro 级摄像头系统&#xff1a;广角和超广角摄像头</li><li>广角&#xff1a;1200 万像素和 ƒ/1.8 光圈</li><li>超广角&#xff1a;1000 万像素、ƒ/2.4 光圈和 125° 视角</li><li>2 倍光学变焦 (缩小)</li><li>最高可达 5 倍数码变焦</li><li>五镜式镜头 (广角和超广角)</li><li>亮度更高的原彩闪光灯</li><li>全景模式 (最高可达 6300 万像素)</li><li>蓝宝石玻璃镜头表面</li><li>Focus Pixels 自动对焦 (广角)</li><li>智能 HDR 3</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正 (超广角)</li><li>先进的红眼校正功能</li><li>照片地理标记功能</li><li>自动图像防抖功能</li><li>连拍快照模式</li><li>图像拍摄格式&#xff1a;HEIF 和 JPEG</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-recording\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频拍摄</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>4K 视频拍摄&#xff1a;24 fps、25 fps、30 fps 或 60 fps (广角)</li><li>1080p 高清视频拍摄&#xff1a;25 fps、30 fps 或 60 fps</li><li>720p 高清视频拍摄&#xff1a;30 fps</li><li>2 倍光学变焦 (缩小)</li><li>音频变焦</li><li>亮度更高的原彩闪光灯</li><li>1080p 慢动作视频&#xff1a;120 fps 或 240 fps</li><li>延时摄影视频 (支持防抖功能)</li><li>扩展的动态范围适用于最高达 30 fps 的视频拍摄</li><li>影院级视频防抖功能 (4K、1080p 和 720p)</li><li>连续自动对焦视频</li><li>变焦播放</li><li>视频录制格式&#xff1a;HEVC 和 H.264</li><li>立体声录音</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-truedepth-camera\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">原深感摄像头</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>1200 万像素超广角摄像头&#xff0c;122° 视角</li><li>ƒ/2.4 光圈</li><li>人像模式&#xff0c;支持先进的焦外成像和景深控制</li><li>人像光效&#xff0c;支持六种效果 (自然光、摄影室灯光、轮廓光、舞台光、单色舞台光和高调单色光)</li><li>动话表情和拟我表情</li><li>智能 HDR 3</li><li>1080p 高清视频拍摄&#xff1a;25 fps、30 fps 或 60 fps</li><li>延时摄影视频 (支持防抖功能)</li><li>扩展的动态范围适用于最高达 30 fps 的视频拍摄</li><li>影院级视频防抖功能 (1080p 和 720p)</li><li>拍摄广色域的照片和实况照片</li><li>镜头畸变校正</li><li>视网膜屏闪光灯</li><li>自动图像防抖功能</li><li>连拍快照模式</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-calling\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频通话<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/ipad-pro/specs/#footnote-4\" rel=\"nofollow\">3</a></sup></div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>FaceTime 视频通话</li><li>人物居中</li><li>使用 iPad 通过无线局域网或蜂窝网络与任何支持 FaceTime 通话功能的设备进行视频通话</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-speakers\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">扬声器</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>四扬声器系统</li></ul>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-microphones\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">麦克风</div>\n<div class=\"techspecs-column\">\n<ul class=\"techspecs-list\"><li>五个录音棚级麦克风&#xff0c;可用于通话、视频拍摄和音频录制</li></ul>\n</div>\n</div>\n</div>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"price\": \"10688\", \"screen\": \"5.5-5.99英寸\", \"storage\": \"128GB\", \"screenKey\": \"2\", \"guidePrice\": \"10899\", \"storageKey\": \"2\", \"specifications\": \"<div class=\\\"Ptable\\\">\\n<div class=\\\"Ptable-item\\\">\\n<h3>主体</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>认证型号</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>A2378</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>型号</dt>\\n<dd>MHNH3CH/A</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>网络连接</dt>\\n<dd>WiFi版</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>上市时间</dt>\\n<dd>2021年4月</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>翻新类型</dt>\\n<dd>全新</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>端口</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>USB接口</dt>\\n<dd>Type-C</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>规格</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>产品净重（kg）</dt>\\n<dd>0.682</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>功能</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>前置摄像头</dt>\\n<dd>1200W</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>后置摄像头</dt>\\n<dd>1200W</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>连接</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>连接方式</dt>\\n<dd>Wi-Fi</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>配置</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>显示芯片</dt>\\n<dd>Apple M1 芯片</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>显示</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>屏幕类型</dt>\\n<dd>Liquid 视网膜 XDR 显示屏</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>音效</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>扬声器数量</dt>\\n<dd>4个</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>麦克风</dt>\\n<dd>5个麦克风</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>电源</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>续航时间</dt>\\n<dd>使用无线局域网浏览网页，或观看视频，使用时间最长可达 10 小时</dd>\\n</dl>\\n</div>\\n</div>\\n<div class=\\\"package-list\\\">\\n<h3>包装清单</h3>\\n<p>iPad&nbsp;Pro USB-C 充电线 (1&nbsp;米) 20W USB-C 电源适配器</p>\\n</div>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (45, 'MacBook Pro 16', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164225222_8sby8.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<div class=\"techspecs-section section-display\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">显示屏</div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">Liquid 视网膜 XDR 显示屏</p>\n<p>14.2 英寸 (对角线) Liquid 视网膜 XDR 显示<span class=\"nowrap\">屏<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-1\" rel=\"nofollow\">1</a></sup>&#xff1b;</span>初始分辨率 3024 x 1964<br class=\"large\" />(254 ppi)</p>\n<br />\n<p class=\"techspecs-subheader\">XDR (极致动态范围)</p>\n<p> </p>\n<p>最高可达 1000 尼特持续 (全屏) 亮度&#xff0c;1600 尼特峰值亮度</p>\n<p>1000000:1 对比度</p>\n<p> </p>\n<p class=\"techspecs-subheader\">色彩</p>\n<p> </p>\n<p>10 亿色彩</p>\n<p>广色域 (P3)</p>\n<p>原彩显示技术</p>\n<p> </p>\n<p class=\"techspecs-subheader\">刷新率</p>\n<p> </p>\n<p>ProMotion 自适应刷新率技术&#xff0c;最高可达 120Hz</p>\n<p>固定刷新率&#xff1a;47.95Hz、48.00Hz、50.00Hz、59.94Hz、60.00Hz</p>\n<p> </p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-memory\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">内存</div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">16GB</p>\n<p>16GB 统一内存</p>\n<p class=\"techspecs-subheader\">可选配&#xff1a;</p>\n<p>32GB (M1 Pro 或 M1 Max 机型) 或 64GB (M1 Max 机型)</p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-battery-and-power\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">电池和电源<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-2\" rel=\"nofollow\">2</a></sup></div>\n<div class=\"techspecs-column\">\n<p>最长可达 17 小时的 Apple TV app 影片<span class=\"nowrap\">播放</span></p>\n<p>最长可达 11 小时的无线上网</p>\n<p>70 瓦时锂聚合物电池<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-2\" rel=\"nofollow\">2</a></sup></p>\n<p>67W USB-C 电源适配器 (随附于 8 核中央处理器的 M1 Pro 机型)</p>\n<p>96W USB-C 电源适配器 (随附于 10 核中央处理器的 M1 Pro 或 M1 Max 机型&#xff1b;8 核中央处理器的 M1 Pro 机型可选配)</p>\n<p>USB-C 转 MagSafe 3 连接线</p>\n<p>可快速充电 (使用 96W USB-C 电源适配器)</p>\n</div>\n</div>\n</div>\n<div class=\"techspecs-section section-storage\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">存储设备<sup class=\"footnote footnote-number\"><a href=\"https://www.apple.com.cn/macbook-pro-14-and-16/specs/#footnote-3\" rel=\"nofollow\">3</a></sup></div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">512GB</p>\n512GB 固态硬盘\n<p class=\"techspecs-subheader\">可选配&#xff1a;</p>\n1TB、2TB、4TB 或 8TB</div>\n<div class=\"techspecs-column\">\n<p class=\"techspecs-subheader\">1TB</p>\n1TB 固态硬盘\n<p class=\"techspecs-subheader\">可选配&#xff1a;</p>\n2TB、4TB 或 8TB</div>\n</div>\n</div>\n<div class=\"techspecs-section section-charging-and-expansion\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">充电和外设扩展</div>\n<div class=\"techspecs-column small-spans-2-columns\">\n<p class=\"techspecs-subheader\"> </p>\n<p><span class=\"techspecs-subheader\">SDXC 卡插槽</span></p>\n<p><span class=\"techspecs-subheader\">HDMI 端口</span></p>\n<p><span class=\"techspecs-subheader\">3.5 毫米耳机插孔</span></p>\n<p><span class=\"techspecs-subheader\">MagSafe 3 端口</span></p>\n<p><span class=\"techspecs-subheader\">三个雷雳 4 (USB-C) 端口&#xff0c;均可支持&#xff1a;</span></p>\n<p>充电</p>\n<p>DisplayPort</p>\n<p>雷雳 4 (速率最高可达 40Gb/s)</p>\n<p>USB 4 (速率最高可达 40Gb/s)</p>\n<span class=\"caption caption-1\">SDXC 卡插槽</span> <span class=\"caption caption-2\">雷雳 4</span> <span class=\"caption caption-3\">HDMI</span><span class=\"caption caption-4\">MagSafe 3</span><span class=\"caption caption-5\">雷雳 4</span><span class=\"caption caption-6\">耳机插孔</span> </div>\n</div>\n</div>\n<div class=\"techspecs-section section-video-support\">\n<div class=\"techspecs-row\">\n<div class=\"techspecs-rowheader\">视频支持</div>\n<div class=\"techspecs-column small-spans-2-columns\">\n<p class=\"techspecs-subheader\">同时支持初始分辨率下的内置显示屏 (可显示十亿色彩) 以及&#xff1a;</p>\n<p>多达两台分辨率最高达 6K (60Hz) 的外接显示器&#xff0c;支持超过十亿色彩 (M1 Pro 机型)&#xff1b;或<br class=\"large\" />多达三台分辨率最高达 6K (60Hz) 的外接显示器&#xff0c;以及一台分辨率最高达 4K (60Hz) 的外接显示器&#xff0c;均支持超过十亿色彩 (M1 Max 机型)</p>\n<p class=\"techspecs-subheader\">雷雳 4 数字视频输出</p>\n<p>通过 USB‑C 进行原生 DisplayPort 输出</p>\n<p>使用转换器支持进行 VGA、HDMI、DVI 和雷雳 2 输出 (转换器需单独<span class=\"nowrap\">购买)</span></p>\n<p class=\"techspecs-subheader\">HDMI 数字视频输出</p>\n<p>支持一台分辨率最高达 4K (60Hz) 的显示器</p>\n<p>使用 HDMI 转 DVI 转换器进行 DVI 输出 (转换器需单独购买)</p>\n</div>\n</div>\n</div>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"price\": \"18388\", \"screen\": \"5.5-5.99英寸\", \"storage\": \"512GB\", \"screenKey\": \"2\", \"guidePrice\": \"18499\", \"storageKey\": \"4\", \"specifications\": \"<div class=\\\"Ptable\\\">\\n<div class=\\\"Ptable-item\\\">\\n<h3>主体</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>型号</dt>\\n<dd>MVVJ2CH/A</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>认证型号</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>A2141</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>机器规格</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>产品尺寸（mm）</dt>\\n<dd>35.79cmX24.59cmX1.62cm</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>产品净重</dt>\\n<dd>2kg</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>内存</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>内存类型</dt>\\n<dd class=\\\"Ptable-tips\\\"></dd>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>最大支持容量</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>内存频率</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>插槽数量</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>音效系统</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>内置麦克风</dt>\\n<dd>内置麦克风</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>端口</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>显示端口</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>处理器</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>处理器加速频率</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>核心数</dt>\\n<dd>六核</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>处理器基准频率</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>线程数</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>CPU集成显卡</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>CPU型号</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>CPU类型</dt>\\n<dd>第九代智能英特尔酷睿i7处理器</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>显卡</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>显存容量</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>显存位宽</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>显存类型</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>类型</dt>\\n<dd>独立显卡</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>硬盘</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>M.2接口数量</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>网络传输</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>局域网</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>其它设备</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>摄像头</dt>\\n<dd>有摄像头</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>电源</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>电池容量</dt>\\n<dd>100Wh</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>电源适配器</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>理论续航时间</dt>\\n<dd>5-8小时, 具体时间视使用环境而定</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>电池芯数</dt>\\n<dd>其他</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>输入设备</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>键盘</dt>\\n<dd>全尺寸键盘</dd>\\n</dl>\\n</div>\\n<div class=\\\"Ptable-item\\\">\\n<h3>显示器</h3>\\n<dl class=\\\"clearfix\\\">\\n<dt>显示比例</dt>\\n<dd>宽屏16：10</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>屏幕尺寸</dt>\\n<dd>其他</dd>\\n</dl>\\n<dl class=\\\"clearfix\\\">\\n<dt>屏幕类型</dt>\\n<dd>LCD</dd>\\n</dl>\\n</div>\\n</div>\\n<div class=\\\"package-list\\\">\\n<h3>包装清单</h3>\\n<p>MacBook Pro&times; 1、电源适配器&times; 1、充电线&times; 1 三包凭证（保修卡）*1</p>\\n</div>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (46, '捷安特 TCR ADV SL 0 DISC', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164216015_x598j.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p><strong>顶级效率</strong></p>\n<p>以先进的碳纤制造工艺&#xff0c;打造业界最强刚性/重量比车架&#xff1b;</p>\n<p>增加空力通常意味着增加重量&#xff0c;为了实现保持同级内最佳刚性重量比的目标&#xff0c;必须尽可能降低重量&#xff0c;以平衡为空力所新增的车架面积。这个目标是以四个最先进的制造工艺来实现。</p>\n<p><strong>顶尖空力</strong></p>\n<p>以整合式空气力学设计为核心&#xff0c;我们在德国Immenstaad的GST风洞实验室&#xff0c;将车架、前叉、零组件和轮组系统全数纳入&#xff0c;完善了整体空力系统&#xff1b;</p>\n<p>全新TCR在空力性能上面有着长足的突破&#xff0c;相比前一代TCR可说是最有感的性能提升。逐一分析、验证和测试每一管件外形&#xff0c;达成在大范围的侧风角度下都显著的降低骑乘风阻。这是在冲刺和单飞时&#xff0c;有史以来最快的TCR。</p>\n<p><strong>全面操控</strong></p>\n<p>凭借完全整合的碟煞科技&#xff0c;全新TCR Advanced SL Disc无论晴雨天气&#xff0c;都 有着优越的制动力和刹车手感。此性能需求来自专业公路选手&#xff0c;他们终日在 高速下坡和过弯的各种路面上征战数小时。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"公路车\", \"price\": \"42800\", \"typeKey\": \"1\", \"guidePrice\": \"45600\", \"specifications\": \"<div class=\\\"specs_text\\\">下表为最新配置，取代任何打印或PDF格式的信息。规格和价格如有变更，恕不另行通知。</div>\\n<div class=\\\"specs_text\\\">&nbsp;</div>\\n<div class=\\\"specs_box spreadmore_shadow\\\">\\n<div class=\\\"specs_box_table\\\">\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">FRAME/车架</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>车架</td>\\n<td>Advanced SL-Grade Composite, Integrated Seatpost</td>\\n</tr>\\n<tr>\\n<td>前叉</td>\\n<td>Advanced SL-Grade Composite, Full-Composite OverDrive 2 Steerer</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Components/组件</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>车把</td>\\n<td>New Giant Contact SLR</td>\\n</tr>\\n<tr>\\n<td>车首竖杆</td>\\n<td>New Giant Contact SLR</td>\\n</tr>\\n<tr>\\n<td>座垫杆</td>\\n<td>Advanced SL-Grade Composite, Integrated Design</td>\\n</tr>\\n<tr>\\n<td>座垫</td>\\n<td>Giant Fleet SLR</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Drivetrain/传动系统</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>前变速器</td>\\n<td>SRAM RED eTap AXS</td>\\n</tr>\\n<tr>\\n<td>前变速器</td>\\n<td>SRAM RED eTap AXS</td>\\n</tr>\\n<tr>\\n<td>后变速器</td>\\n<td>SRAM RED eTap AXS</td>\\n</tr>\\n<tr>\\n<td>刹车</td>\\n<td>SRAM RED eTap AXS HRD (hydraulic road disc)</td>\\n</tr>\\n<tr>\\n<td>飞轮</td>\\n<td>SRAM RED, 12-speed, 10x28</td>\\n</tr>\\n<tr>\\n<td>链条</td>\\n<td>SRAM RED D1, 12-speed</td>\\n</tr>\\n<tr>\\n<td>大齿盘</td>\\n<td>SRAM RED D1 DUB , 35/48 with integrated Quaq Dzero Power Meter</td>\\n</tr>\\n<tr>\\n<td>中轴</td>\\n<td>SRAM DUB, Press Fit</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Wheels/轮组</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>轮胎</td>\\n<td>Cadex Road Race Tubeless, 700x28mm (25c),170 TPI, Folding</td>\\n</tr>\\n<tr>\\n<td>轮圈</td>\\n<td>Cadex L1, 42mm Disc Wheel Hookless + Carbon spoke System with GIANT patented DBL (Dynamic Balanced Lacing) technology</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Other/其它</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>其他</td>\\n<td>Computer Mount with Giant, Garmin, Wahoo tray</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>\\n</div>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (47, '捷安特 XTC ADV SL 1', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164200397_fjk26.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>超轻量、超高效率的越野车&#xff0c;是捷安特XC选手挑战世界杯赛事的最佳武器&#xff1b;</p>\n<p>以ADVANCED SL碳纤手工打造&#xff0c;专为快速、稳定的29寸车架设计&#xff0c;表现出超强的灵敏性和高效率。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"山地车\", \"price\": \"23800\", \"typeKey\": \"2\", \"guidePrice\": \"24900\", \"specifications\": \"<div class=\\\"specs_text\\\">下表为最新配置，取代任何打印或PDF格式的信息。规格和价格如有变更，恕不另行通知。</div>\\n<div class=\\\"specs_box spreadmore_shadow\\\">\\n<div class=\\\"specs_box_table\\\">\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">FRAME/车架</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>尺寸</td>\\n<td>S, M, L</td>\\n</tr>\\n<tr>\\n<td>颜色</td>\\n<td>Chameleon Neptune</td>\\n</tr>\\n<tr>\\n<td>车架</td>\\n<td>Advanced SL-Grade Composite</td>\\n</tr>\\n<tr>\\n<td>前叉</td>\\n<td>RockShox SID SL Select, 100mm, Charger 2 RL damper, 44mm offset, 15x110 Maxle Stealth, remote lockout</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Components/组件</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>车把</td>\\n<td>Giant Contact SL XC Flat, 750x31.8</td>\\n</tr>\\n<tr>\\n<td>车首竖杆</td>\\n<td>Giant Contact SL</td>\\n</tr>\\n<tr>\\n<td>座垫杆</td>\\n<td>Giant Contact Switch, 100mm, 30.9, Shimano remote</td>\\n</tr>\\n<tr>\\n<td>座垫</td>\\n<td>Giant Contact SL (neutral)</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Drivetrain/传动系统</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>变速把手</td>\\n<td>Shimano Deore XT</td>\\n</tr>\\n<tr>\\n<td>后变速器</td>\\n<td>Shimano Deore XT</td>\\n</tr>\\n<tr>\\n<td>刹车</td>\\n<td>Shimano Deore XT</td>\\n</tr>\\n<tr>\\n<td>刹车握把</td>\\n<td>Shimano Deore XT</td>\\n</tr>\\n<tr>\\n<td>飞轮</td>\\n<td>Shimano Deore XT, 10x51</td>\\n</tr>\\n<tr>\\n<td>链条</td>\\n<td>KMC X-12</td>\\n</tr>\\n<tr>\\n<td>大齿盘</td>\\n<td>Shimano Deore XT, 34t</td>\\n</tr>\\n<tr>\\n<td>中轴</td>\\n<td>Shimano, press fit</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Wheels/轮组</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>辐条</td>\\n<td>Giant XCR-1 29 WheelSystem</td>\\n</tr>\\n<tr>\\n<td>轮圈</td>\\n<td>Giant XCR-1 29 WheelSystem</td>\\n</tr>\\n<tr>\\n<td>花鼓</td>\\n<td>Giant XCR-1 29 WheelSystem</td>\\n</tr>\\n<tr>\\n<td>轮胎</td>\\n<td>Maxxis Aspen 29x2.25, foldable, TLR, EXO, tubeless</td>\\n</tr>\\n</tbody>\\n</table>\\n&nbsp;\\n<table cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<thead>\\n<tr>\\n<th colspan=\\\"2\\\">Other/其它</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>其他</td>\\n<td>tubeless prepared</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>\\n</div>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (48, '佳能 RF50mm F1.8 STM', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164143293_bh9k6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>小型轻量又亲民的F1.8大光圈标准定焦镜头</p>\n<p class=\"icp-mb80 icp-center\">一直以来&#xff0c;佳能50mm F1.8级别的大光圈标准定焦镜头因其广泛的适用性、明亮的大光圈以及小巧轻便的镜身&#xff0c;从胶片机时代就受到了广大摄影爱好者的喜爱。</p>\n<p class=\"icp-mb80 icp-center\">RF50mm F1.8 STM发挥了RF卡口短后对焦距离的优势&#xff0c;采用了1片非球面镜片&#xff0c;并针对RF卡口进行了优化配置&#xff0c;实现了高画质与小型轻量的兼备。</p>\n<p class=\"icp-mb80 icp-center\">这样一款轻巧的F1.8大光圈镜具备高性价比&#xff0c;让更多普通用户能够轻松拥有&#xff0c;体验大光圈的魅力。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"定焦\", \"mount\": \"RF\", \"price\": \"1299\", \"typeKey\": \"1\", \"mountKey\": \"2\", \"guidePrice\": \"1399\", \"specifications\": \"<table class=\\\"spec_table\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<tbody>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头焦距</td>\\n<td class=\\\"noright\\\">50mm</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头结构</td>\\n<td class=\\\"noright\\\">5组6片</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>光圈叶片</td>\\n<td class=\\\"noright\\\">7片（圆形光圈）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最小光圈</td>\\n<td class=\\\"noright\\\">22</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最近对焦距离</td>\\n<td class=\\\"noright\\\">约0.3米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大放大倍率</td>\\n<td class=\\\"noright\\\">约0.25倍</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>驱动系统</td>\\n<td class=\\\"noright\\\">STM + 齿轮型单元</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>手抖动补偿效果</td>\\n<td class=\\\"noright\\\">-</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>滤镜直径</td>\\n<td class=\\\"noright\\\">43毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大直径及长度</td>\\n<td class=\\\"noright\\\">约&Phi;69.2&times;40.5毫米（收纳状态）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>重量</td>\\n<td class=\\\"noright\\\">约160克</td>\\n</tr>\\n</tbody>\\n</table>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (49, '佳能 RF35mm F1.8 MACRO IS STM', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164131270_159y8.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>小型轻量通用性强的F1.8大光圈RF广角微距镜头</p>\n<p class=\"icp-mb80 icp-center\">佳能EOS R系列专用微距镜头&#xff0c;利用RF卡口大口径与短后对焦距离&#xff0c;实现了镜头高画质与光学结构的小型化。</p>\n<p class=\"icp-mb80 icp-center\">镜头35mm的焦距与F1.8的大光圈&#xff0c;适合日常街拍等&#xff0c;小型轻量化的机身为日常携带提供了保障。</p>\n<p class=\"icp-mb80 icp-center\">约0.5倍的最大放大倍率&#xff0c;可将被摄体拍大&#xff0c;呈现出精致的细节及梦幻般的照片效果。</p>\n<p class=\"icp-mb80 icp-center\">采用双重IS影像稳定器&#xff0c;防抖效果最大5级&#xff0c;可有效抑制拍摄时的抖动。</p>\n<p class=\"icp-mb80 icp-center\">此外&#xff0c;镜头可安装佳能微距闪光灯&#xff0c;便于微距作品创作。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"定焦\", \"mount\": \"RF\", \"price\": \"3299\", \"typeKey\": \"1\", \"mountKey\": \"2\", \"guidePrice\": \"3499\", \"specifications\": \"<table class=\\\"spec_table\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<tbody>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头焦距</td>\\n<td class=\\\"noright\\\">35mm</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头结构</td>\\n<td class=\\\"noright\\\">9组11片</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>光圈叶片</td>\\n<td class=\\\"noright\\\">9片（圆形光圈）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最小光圈</td>\\n<td class=\\\"noright\\\">22</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最近对焦距离</td>\\n<td class=\\\"noright\\\">约0.17米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大放大倍率</td>\\n<td class=\\\"noright\\\">约0.5倍</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>驱动系统</td>\\n<td class=\\\"noright\\\">STM +齿轮型单元</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>手抖动补偿效果</td>\\n<td class=\\\"noright\\\">5级（基于CIPA测试标准，使用EOS R时）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>滤镜直径</td>\\n<td class=\\\"noright\\\">52毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大直径及长度</td>\\n<td class=\\\"noright\\\">约&Phi;74.4&times;62.8毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>重量</td>\\n<td class=\\\"noright\\\">约305克</td>\\n</tr>\\n</tbody>\\n</table>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (50, '佳能 RF50mm F1.2 L USM', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164118336_t9ca3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>F1.2大光圈下兼具高画质的RF标准定焦镜头</p>\n<p class=\"icp-mb80 icp-center\">佳能EOS R系列专用镜头&#xff0c;镜头设计运用了RF卡口大口径与短后对焦距离&#xff0c;使F1.2大光圈与高画质兼备。</p>\n<p class=\"icp-mb80 icp-center\">镜头采用了3片非球面镜片与1片UD&#xff08;超低色散&#xff09;镜片的搭配&#xff0c;并使用了新玻璃材料镜片&#xff0c;通过合理的镜片布局&#xff0c;有效抑制多种像差的同时&#xff0c;实现了F1.2光圈下画面中心到边缘的高画质表现。</p>\n<p class=\"icp-mb80 icp-center\">ASC镀膜的采用&#xff0c;提升了镜头防反射的效果&#xff0c;从而抑制眩光与鬼影的产生。获得清晰通透的效果。</p>\n<p class=\"icp-mb80 icp-center\">F1.2的大光圈配合令人叹服的高画质表现&#xff0c;为专业摄影师提供了更多创作的感动。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"定焦\", \"mount\": \"RF\", \"price\": \"13999\", \"typeKey\": \"1\", \"mountKey\": \"2\", \"guidePrice\": \"14999\", \"specifications\": \"<table class=\\\"spec_table\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<tbody>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头焦距</td>\\n<td class=\\\"noright\\\">50mm</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头结构</td>\\n<td class=\\\"noright\\\">9组15片</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>光圈叶片</td>\\n<td class=\\\"noright\\\">10片（圆形光圈）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最小光圈</td>\\n<td class=\\\"noright\\\">16</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最近对焦距离</td>\\n<td class=\\\"noright\\\">约0.4米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大放大倍率</td>\\n<td class=\\\"noright\\\">约0.19倍</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>驱动系统</td>\\n<td class=\\\"noright\\\">环形USM超声波马达</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>手抖动补偿效果</td>\\n<td class=\\\"noright\\\">-</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>滤镜直径</td>\\n<td class=\\\"noright\\\">77毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大直径及长度</td>\\n<td class=\\\"noright\\\">约&Phi;89.8&times;108毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>重量</td>\\n<td class=\\\"noright\\\">约950克</td>\\n</tr>\\n</tbody>\\n</table>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (51, '佳能 RF24-70mm F2.8 L IS USM', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164107120_casro.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>覆盖经典焦段&#xff0c;具备IS影像稳定器的新生“大三元”</p>\n<p class=\"icp-mb80 icp-center\">RF卡口的专用镜头&#xff0c;焦距覆盖24mm广角到70mm中远摄的经典焦段&#xff0c;是新生RF系列“大三元”中备受瞩目的镜头之一。</p>\n<p class=\"icp-mb80 icp-center\">得易于RF卡口大口径与短后对焦距离的优势&#xff0c;在实现画面整体高画质&#xff0c;且不增加镜头体积的前提下&#xff0c;配备了IS影像稳定器&#xff0c;具有最大5级的手抖动补偿效果。配合恒定F2.8的大光圈与利用率很高的镜头焦距&#xff0c;能够应对婚纱、人像、街拍、风光等非常丰富的拍摄题材&#xff0c;用途广泛。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"变焦\", \"mount\": \"RF\", \"price\": \"14999\", \"typeKey\": \"2\", \"mountKey\": \"2\", \"guidePrice\": \"15299\", \"specifications\": \"<table class=\\\"spec_table\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<tbody>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头焦距</td>\\n<td class=\\\"noright\\\">24-70mm</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头结构</td>\\n<td class=\\\"noright\\\">15组21片</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>光圈叶片</td>\\n<td class=\\\"noright\\\">9片（圆形光圈）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最小光圈</td>\\n<td class=\\\"noright\\\">22</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最近对焦距离</td>\\n<td class=\\\"noright\\\">广角端：约0.21米，远摄端：约0.38米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大放大倍率</td>\\n<td class=\\\"noright\\\">约0.24倍（24mm时），约0.3倍（32mm时），约0.22倍（70mm时）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>驱动系统</td>\\n<td class=\\\"noright\\\">NANO USM超声波马达</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>手抖动补偿效果</td>\\n<td class=\\\"noright\\\">5级（基于CIPA测试标准，70mm焦距端，使用EOS R时）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>滤镜直径</td>\\n<td class=\\\"noright\\\">82毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大直径及长度</td>\\n<td class=\\\"noright\\\">约&Phi;88.5&times;125.7毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>重量</td>\\n<td class=\\\"noright\\\">约900克</td>\\n</tr>\\n</tbody>\\n</table>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (52, '佳能 RF70-200mm F2.8 L IS USM', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164011361_t92c6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>新生“大三元”&#xff0c;5级防抖且大幅小型化的RF“小白IS”</p>\n<p class=\"icp-mb80 icp-center\">佳能EOS R系列专用“大三元”镜头&#xff0c;得益于佳能自主研发的大口径RF卡口与短后对焦距离带来的光学设计灵活性&#xff0c;基于UD非球面镜片、双NANO USM超声波马达的电子浮动对焦机构等多项技术的导入&#xff0c;实现了镜头长度的大幅缩减&#xff0c;具有非常好的机动性与便携性。并具备与备受好评的EF 70-200mm f/2.8L IS III USM相同甚至更好的画质表现。</p>\n<p class=\"icp-mb80 icp-center\">不吝惜地导入高级光学设计使最近对焦距离缩短至约0.7米&#xff0c;整个变焦区域下最近到最远焦距下都能获得高画质表现。</p>\n<p class=\"icp-mb80 icp-center\">最大相当于5级快门速度的防抖效果&#xff0c;加上小型轻量镜身&#xff0c;让手持拍摄更加安心。</p>\n<p class=\"icp-mb80 icp-center\">镜头采用防尘防水滴结构、实施防污氟镀膜&#xff0c;具有很高的可靠性。适用于人像、动物、体育、新闻报道等广泛领域。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '{\"type\": \"变焦\", \"mount\": \"RF\", \"price\": \"17299\", \"typeKey\": \"2\", \"mountKey\": \"2\", \"guidePrice\": \"17699\", \"specifications\": \"<table class=\\\"spec_table\\\" cellspacing=\\\"0\\\" cellpadding=\\\"0\\\">\\n<tbody>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头焦距</td>\\n<td class=\\\"noright\\\">70-200mm</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>镜头结构</td>\\n<td class=\\\"noright\\\">13组17片</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>光圈叶片</td>\\n<td class=\\\"noright\\\">9片（圆形光圈）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最小光圈</td>\\n<td class=\\\"noright\\\">32</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最近对焦距离</td>\\n<td class=\\\"noright\\\">约0.7米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大放大倍率</td>\\n<td class=\\\"noright\\\">约0.23倍(200mm时)</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>驱动系统</td>\\n<td class=\\\"noright\\\">NANO USM超声波马达</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>手抖动补偿效果</td>\\n<td class=\\\"noright\\\">5级（基于CIPA测试标准，200mm焦距端，使用EOS R时）</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>滤镜直径</td>\\n<td class=\\\"noright\\\">77毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>最大直径及长度</td>\\n<td class=\\\"noright\\\">约&Phi;89.9&times;146毫米</td>\\n</tr>\\n<tr class=\\\"tab_gray01\\\">\\n<td>重量</td>\\n<td class=\\\"noright\\\">约1070克(不含三脚架座)</td>\\n</tr>\\n</tbody>\\n</table>\"}', NULL);
INSERT INTO `ujcms_article_ext` VALUES (53, 'Freemarker参考手册', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164704288_njy3g.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/freemarker_manual_zh_cn.pdf', NULL, 'FreeMarker中文手册.pdf', 2413908, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (54, 'Spring Boot Reference Documentation', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2021/11/20211118164649038_maqmg.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/uploads/1/freemarker_manual_zh_cn.pdf', NULL, 'FreeMarker中文手册.pdf', 2413908, NULL, '1', NULL, NULL, NULL, NULL, '0', '', NULL, 1, NULL, NULL, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (105, '王嘉男8米36逆袭摘金 中国跳远首次夺冠', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2022/07/20220717224717470_aigpqpf4m567.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '21c4c130-05dc-11ed-8007-005056c00008', NULL, '0', '<p>2022年俄勒冈田径世锦赛第二比赛日争夺&#xff0c;男子跳远王嘉男一鸣惊人&#xff0c;凭借最后一跳的惊人表现&#xff0c;跳出8米36的成绩&#xff0c;实现逆袭获得冠军&#xff0c;这也是中国男子跳远历史上首枚世锦赛金牌。其余出战各项目资格赛的中国选手许双双、陆佳雯谢文骏均无缘晋级。波兰名将法伊德克在男子链球项目上完成世锦赛五连冠&#xff1b;女子10000米埃塞俄比亚选手吉迪拿到金牌。</p>\n<p>男子跳远决赛&#xff0c;王嘉男第一跳就发挥出色7米94&#xff0c;第三跳跃出8米03升至第五。直至最后一跳&#xff0c;王嘉男才调整到最佳状态&#xff0c;拼尽全力奋力一跃&#xff0c;加速起跳充分&#xff0c;成绩有效达到8米36&#xff0c;实现逆袭获得冠军。东京奥运冠军&#xff0c;希腊选手坦托格鲁以8米32的成绩获得亚军&#xff0c;瑞士的艾哈迈尔8米16拿到铜牌。</p>\n<p>女子100米预赛&#xff0c;葛曼棋、梁小静携手出战&#xff0c;三年前的多哈世锦赛&#xff0c;两人都止步半决赛。梁小静和葛曼棋&#xff0c;分别以11秒25和11秒17排名各自小组第五。预赛总排名&#xff0c;葛曼棋成为小组第三之外的三个最好成绩之一&#xff0c;压哨进入半决赛。英国选手史密斯10秒84排名第一&#xff0c;牙买加名将弗雷泽跑出10秒87紧随其后。</p>\n<p>男子110米栏预赛&#xff0c;带伤出战的谢文骏以13秒577完赛&#xff0c;仅落后以小q晋级的西班牙人洛皮斯0.004秒&#xff0c;位列总第25无缘晋级半决赛。女子跳高资格赛&#xff0c;首次参加世锦赛的小将陆佳雯尝试1.81米的横杆三次失败&#xff0c;最终以1米75的成绩排名小组第14无缘决赛。女子3000米障碍预赛&#xff0c;许双双跑出9分39秒17的成绩&#xff0c;总排名第32无缘决赛。</p>\n<p>男子链球决赛&#xff0c;波兰选手包揽冠亚军&#xff0c;法伊德克以81米98的成绩完成该项目五连冠&#xff0c;沃伊切赫-诺维茨基81米03获得亚军&#xff0c;挪威选手亨里克森80米87排名第三。</p>\n<p>女子10000米&#xff0c;埃塞俄比亚的吉迪以30分09秒94的成绩夺冠&#xff0c;弥补上届屈居亚军的遗憾。肯尼双姝奥比里和基普肯博伊&#xff0c;分别以30分10秒02和30分10秒07分获亚军和季军。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 1, 0, 4, 0, 0, 0, 4, 4, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (155, '世锦赛百米飞人大战美国包揽前三 科尔利9秒86夺冠', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '/uploads/1/image/2022/07/20220717225518239_r9ik60zsoq3l.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0b896ec7-47ea-11ef-836c-3497f689bfe2', NULL, '0', '<p>2022年田径世锦赛第二比赛日&#xff0c;重头戏男子100米决赛&#xff0c;美国选手刷屏展现强大统治力&#xff0c;本赛季第一人科尔利一路领先&#xff0c;以9秒86的成绩获得冠军&#xff0c;布莱西和布罗梅尔分别拿到亚军和季军。</p>\n<p>男子百米飞人大战&#xff0c;苏炳添半决赛10秒30小组垫底&#xff0c;总排名第23无缘决赛。东京奥运冠军雅各布斯因伤退赛&#xff0c;牙买加小将塞维尔以9秒90排名半决赛第一&#xff0c;美国四位名将科尔利、科尔曼、布莱西和布罗梅尔&#xff0c;南非的辛比内和日本的萨尼-布朗都进入决赛</p>\n<p>决赛科尔利在第四道&#xff0c;布莱西第三道&#xff0c;科尔曼和布罗梅尔在第七道和第八道。出发后科尔利冲了出去&#xff0c;超强加速取得领先位置&#xff0c;旁道的布莱西不断施压紧追不舍&#xff0c;不过科尔利还是保持很好的节奏&#xff0c;第八道的布罗梅尔途中跑紧紧追赶&#xff0c;不过科尔利还是守住优势&#xff0c;率先冲过终点线。</p>\n<p>最终科尔利以9秒86的成绩获得冠军&#xff0c;布莱西和布罗梅尔均跑出9秒88的成绩&#xff0c;分列亚军和季军&#xff0c;美国选手包揽前三。辛比内与卫冕冠军科尔曼分别以10秒01排名第五和第六&#xff0c;萨尼-布朗10秒06位列第七。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (156, '苏炳添百米半决赛10秒30 无缘晋级世锦赛决赛', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '5fae304b-b6de-11ee-bdff-3497f689bfe2', '字迹潦草', '0', '<p>2022年尤金田径世锦赛迎来了第二个比赛日的较量&#xff0c;男子百米半决赛在今日上演。苏炳添位于第二小组出场&#xff0c;以10秒30获得第8名&#xff0c;无缘晋级。</p>\n<p>本组比赛&#xff0c;克利以10秒02的成绩获得小组第一&#xff0c;科尔曼获得小组第二名&#xff0c;成绩为10秒05。只有小组前两名和2个最好成绩能够晋级决赛。</p>\n<p>男子百米飞人大战&#xff0c;苏炳添预赛时跑出10秒15&#xff0c;凭借比较千分位成绩&#xff0c;以0.003秒的微弱优势&#xff0c;成为各小组前三之外三个最好成绩之一的选手&#xff0c;惊险进入半决赛。</p>\n<p>半决赛分为三组进行&#xff0c;取小组前三和两个成绩最好者进入决赛。苏炳添在第二组&#xff0c;与预赛第一科尔利、卫冕冠军科尔曼和加拿大名将德格拉塞展开竞争。发令枪响出发&#xff0c;苏炳添起跑顺利加速前进&#xff0c;不过进入途中跑还是有些加不上速度&#xff0c;科尔利一马当先&#xff0c;科尔曼紧随其后&#xff0c;两位美国名将携手冲线。最终苏炳添以10秒30列小组最后一位&#xff0c;科尔利10秒02&#xff0c;科尔曼10秒05&#xff0c;两人占据前二位。</p>\n<p>第一组布罗梅尔、尤罕-布雷克、辛比尼和日本的萨尼-布朗同场竞技&#xff0c;布罗梅尔起跑后抬头加速很快占据领先位置&#xff0c;辛比尼紧随其后&#xff0c;尤罕-布雷克节奏感一般&#xff0c;萨尼-布朗后程也冲了出去。这组最终辛比尼和布罗梅尔均为9秒97占据小组前两位。</p>\n<p>第三组&#xff0c;东京奥运冠军雅各布斯&#xff0c;因为伤势原因退赛。牙买加小将塞维尔与美国选手布莱西&#xff0c;分别以9秒90和9秒93的成绩&#xff0c;在前两位冲线。半决赛总排名&#xff0c;塞维尔第一布莱西第二&#xff0c;苏炳添排在最后一位无缘决赛。</p>\n<div>\n<div>\n<div>\n<p> </p>\n</div>\n</div>\n</div>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `ujcms_article_ext` VALUES (205, '新羽球赛黄鸭混双0-2败北获亚军 国羽三项决赛全败', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', '<p>2022年世界羽联新加坡公开赛&#xff0c;混双决赛王懿律/黄东萍0-2不敌泰国名将德差波/沙西丽&#xff0c;女双决赛张殊贤/郑雨0-2败给印尼组合拉哈尤/拉马丹蒂&#xff0c;国羽本站比赛一冠未获&#xff0c;拿到包括女单在内的三项亚军。</p>\n<p>混双王懿律/黄东萍半决赛2-0拿下队友郭新娃/张殊贤&#xff0c;打进决赛面对泰国名将德差波/沙西丽。此前王懿律/黄东萍与德差波/沙西丽有过多达15此交手&#xff0c;黄鸭组合8胜7负稍占上风&#xff0c;但最近2次碰面均输球。</p>\n<p>首局王懿律/黄东萍很快陷入被动&#xff0c;两人在前半场的竞争中处于明显下风&#xff0c;逐渐被拉开分差&#xff0c;9-12后连丢4分&#xff0c;战至11-16后又是连输4分&#xff0c;以12-21先负一局。第二局王懿律/黄东萍上来4-1领先被反超&#xff0c;12-15连得3分到15平&#xff0c;可惜局末阶段未能顶住对手的攻势&#xff0c;连输5分后挽回2个赛点&#xff0c;还是以17-21再丢一局&#xff0c;总比分0-2落败无缘冠军。</p>\n<p>女双张殊贤/郑雨半决赛2-0淘汰队友杜玥/李汶妹&#xff0c;本赛季继全英赛和马来西亚公开赛后&#xff0c;第三次打进决赛&#xff0c;与印尼组合拉哈尤/拉马丹蒂争夺冠军。此前双方两次交手&#xff0c;张殊贤/郑雨都不敌对手。</p>\n<p>首局张殊贤/郑雨进入状态较慢&#xff0c;印尼组合配合默契攻势更猛&#xff0c;张殊贤/郑雨一直未能找到节奏&#xff0c;前半段4-10括号&#xff0c;追到11-13后又连丢5分&#xff0c;以14-21先输一局。第二局张殊贤/郑雨展开反击&#xff0c;开局不错一度以8-4领先&#xff0c;不过很快被印尼组合一波攻势追上比分&#xff0c;到暂停时只以11-10领先。胶着至13平后&#xff0c;张殊贤/郑雨连续丢分又被拉开分差&#xff0c;尽管顽强追到16-18&#xff0c;但最终还是以17-21落败&#xff0c;总比分0-2告负获得亚军。</p>', NULL, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for ujcms_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_article_tag`;
CREATE TABLE `ujcms_article_tag`  (
  `article_id_` bigint NOT NULL,
  `tag_id_` bigint NOT NULL,
  `order_` int NOT NULL DEFAULT 999999,
  PRIMARY KEY (`article_id_`, `tag_id_`) USING BTREE,
  INDEX `idx_articletag_composite`(`tag_id_` ASC, `article_id_` ASC) USING BTREE,
  CONSTRAINT `fk_articletag_article` FOREIGN KEY (`article_id_`) REFERENCES `ujcms_article` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_articletag_tag` FOREIGN KEY (`tag_id_`) REFERENCES `ujcms_tag` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章与Tag关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_article_tag
-- ----------------------------
INSERT INTO `ujcms_article_tag` VALUES (4, 1, 0);
INSERT INTO `ujcms_article_tag` VALUES (5, 2, 0);
INSERT INTO `ujcms_article_tag` VALUES (24, 1, 0);

-- ----------------------------
-- Table structure for ujcms_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_attachment`;
CREATE TABLE `ujcms_attachment`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `name_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称',
  `path_` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储路径',
  `url_` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '访问路径',
  `length_` bigint NOT NULL COMMENT '文件长度',
  `created_` datetime NOT NULL COMMENT '创建时间',
  `used_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `url_`(`url_` ASC) USING BTREE,
  INDEX `idx_attachment_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_attachment_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_attachment_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_attachment_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_attachment
-- ----------------------------
INSERT INTO `ujcms_attachment` VALUES (231, 1, 1, '20211104125459284_gxtub.jpg', '/1/image/2021/11/20211104125504412_of8lq.jpg', '/uploads/1/image/2021/11/20211104125504412_of8lq.jpg', 76521, '2021-11-04 12:55:04', '1');
INSERT INTO `ujcms_attachment` VALUES (233, 1, 1, '20211104125539508_jenam.jpg', '/1/image/2021/11/20211104125546515_u445l.jpg', '/uploads/1/image/2021/11/20211104125546515_u445l.jpg', 45698, '2021-11-04 12:55:47', '1');
INSERT INTO `ujcms_attachment` VALUES (235, 1, 1, '20211104165719803_p4ra8.jpg', '/1/image/2021/11/20211104165740209_ceomo.jpg', '/uploads/1/image/2021/11/20211104165740209_ceomo.jpg', 116185, '2021-11-04 16:57:40', '1');
INSERT INTO `ujcms_attachment` VALUES (236, 1, 1, '冬奥会.jpg', '/1/image/2021/11/20211104222348689_qh9w7.jpg', '/uploads/1/image/2021/11/20211104222348689_qh9w7.jpg', 95461, '2021-11-04 22:23:49', '1');
INSERT INTO `ujcms_attachment` VALUES (237, 1, 1, '药品采购.jpg', '/1/image/2021/11/20211104222620564_vor4h.jpg', '/uploads/1/image/2021/11/20211104222620564_vor4h.jpg', 20127, '2021-11-04 22:26:21', '1');
INSERT INTO `ujcms_attachment` VALUES (239, 1, 1, '飞行员.jpg', '/1/image/2021/11/20211104222710636_nk33a.jpg', '/uploads/1/image/2021/11/20211104222710636_nk33a.jpg', 666057, '2021-11-04 22:27:11', '1');
INSERT INTO `ujcms_attachment` VALUES (240, 1, 1, '马尔代夫3.jpg', '/1/image/2021/11/20211104222746839_hjqth.jpg', '/uploads/1/image/2021/11/20211104222746839_hjqth.jpg', 521947, '2021-11-04 22:27:47', '1');
INSERT INTO `ujcms_attachment` VALUES (241, 1, 1, '歼10_2.jpg', '/1/image/2021/11/20211104222955607_po1m3.jpg', '/uploads/1/image/2021/11/20211104222955607_po1m3.jpg', 44449, '2021-11-04 22:29:56', '1');
INSERT INTO `ujcms_attachment` VALUES (242, 1, 1, '双11.jpg', '/1/image/2021/11/20211104223308496_acfyr.jpg', '/uploads/1/image/2021/11/20211104223308496_acfyr.jpg', 76581, '2021-11-04 22:33:09', '1');
INSERT INTO `ujcms_attachment` VALUES (243, 1, 1, '教培转型.jpg', '/1/image/2021/11/20211104223430598_908j4.jpg', '/uploads/1/image/2021/11/20211104223430598_908j4.jpg', 79023, '2021-11-04 22:34:31', '1');
INSERT INTO `ujcms_attachment` VALUES (244, 1, 1, '武夷山.jpg', '/1/image/2021/11/20211104223701330_qupit.jpg', '/uploads/1/image/2021/11/20211104223701330_qupit.jpg', 115720, '2021-11-04 22:37:01', '1');
INSERT INTO `ujcms_attachment` VALUES (245, 1, 1, '核酸检测.png', '/1/image/2021/11/20211104223810718_6a5ax.png', '/uploads/1/image/2021/11/20211104223810718_6a5ax.png', 327737, '2021-11-04 22:38:11', '1');
INSERT INTO `ujcms_attachment` VALUES (246, 1, 1, '量子计算.jpg', '/1/image/2021/11/20211104224056206_vdefr.jpg', '/uploads/1/image/2021/11/20211104224056206_vdefr.jpg', 30815, '2021-11-04 22:40:56', '1');
INSERT INTO `ujcms_attachment` VALUES (247, 1, 1, '五棵松体育中心.gif', '/1/image/2021/11/20211104224550238_erko3.gif', '/uploads/1/image/2021/11/20211104224550238_erko3.gif', 271905, '2021-11-04 22:45:50', '1');
INSERT INTO `ujcms_attachment` VALUES (248, 1, 1, '贝索斯.jpg', '/1/image/2021/11/20211104231836614_mefxh.jpg', '/uploads/1/image/2021/11/20211104231836614_mefxh.jpg', 72698, '2021-11-04 23:18:37', '1');
INSERT INTO `ujcms_attachment` VALUES (249, 1, 1, '福布斯排行.jpg', '/1/image/2021/11/20211104232420442_dqx8h.jpg', '/uploads/1/image/2021/11/20211104232420442_dqx8h.jpg', 78695, '2021-11-04 23:24:20', '1');
INSERT INTO `ujcms_attachment` VALUES (250, 1, 1, '智利前财长.jpg', '/1/image/2021/11/20211105135315234_m5q0c.jpg', '/uploads/1/image/2021/11/20211105135315234_m5q0c.jpg', 26366, '2021-11-05 13:53:15', '1');
INSERT INTO `ujcms_attachment` VALUES (255, 1, 1, '视频_峰爆.jpg', '/1/image/2021/11/20211108190618610_tr5s3.jpg', '/uploads/1/image/2021/11/20211108190618610_tr5s3.jpg', 293501, '2021-11-08 19:06:19', '1');
INSERT INTO `ujcms_attachment` VALUES (256, 1, 1, '下载_pdf.jpeg', '/1/image/2021/11/20211110112249015_3npw8.jpg', '/uploads/1/image/2021/11/20211110112249015_3npw8.jpg', 16758, '2021-11-10 11:22:49', '1');
INSERT INTO `ujcms_attachment` VALUES (258, 1, 1, '下载_火狐.jpg', '/1/image/2021/11/20211110112529820_5igwi.jpg', '/uploads/1/image/2021/11/20211110112529820_5igwi.jpg', 25100, '2021-11-10 11:25:30', '1');
INSERT INTO `ujcms_attachment` VALUES (261, 1, 1, '下载_qq.jpeg', '/1/image/2021/11/20211110120854616_w31vb.jpg', '/uploads/1/image/2021/11/20211110120854616_w31vb.jpg', 25390, '2021-11-10 12:08:55', '1');
INSERT INTO `ujcms_attachment` VALUES (262, 1, 1, '下载_vscode.jpeg', '/1/image/2021/11/20211110121255183_6aqfa.jpg', '/uploads/1/image/2021/11/20211110121255183_6aqfa.jpg', 13415, '2021-11-10 12:12:55', '1');
INSERT INTO `ujcms_attachment` VALUES (264, 1, 1, '下载_wps.jpg', '/1/image/2021/11/20211110134344757_3nv60.png', '/uploads/1/image/2021/11/20211110134344757_3nv60.png', 19931, '2021-11-10 13:43:45', '1');
INSERT INTO `ujcms_attachment` VALUES (265, 1, 1, '视频_关于我妈的一切.jpg', '/1/image/2021/11/20211111105757848_bttmt.jpg', '/uploads/1/image/2021/11/20211111105757848_bttmt.jpg', 127952, '2021-11-11 10:57:58', '1');
INSERT INTO `ujcms_attachment` VALUES (266, 1, 1, '视频_热带雨.jpg', '/1/image/2021/11/20211111105937943_ttq2n.jpg', '/uploads/1/image/2021/11/20211111105937943_ttq2n.jpg', 276104, '2021-11-11 10:59:38', '1');
INSERT INTO `ujcms_attachment` VALUES (267, 1, 1, '视频_夏日友晴天.jpg', '/1/image/2021/11/20211111110031366_6gngc.jpg', '/uploads/1/image/2021/11/20211111110031366_6gngc.jpg', 366386, '2021-11-11 11:00:32', '1');
INSERT INTO `ujcms_attachment` VALUES (268, 1, 1, '视频_新逃学威龙.jpg', '/1/image/2021/11/20211111110118656_fcr3x.jpg', '/uploads/1/image/2021/11/20211111110118656_fcr3x.jpg', 309231, '2021-11-11 11:01:19', '1');
INSERT INTO `ujcms_attachment` VALUES (271, 1, 1, '图片_风光A.jpg', '/1/image/2021/11/20211112181242149_b7voo.jpg', '/uploads/1/image/2021/11/20211112181242149_b7voo.jpg', 295109, '2021-11-12 18:12:42', '1');
INSERT INTO `ujcms_attachment` VALUES (272, 1, 1, '图片_风光A2.jpg', '/1/image/2021/11/20211112181242418_7olxk.jpg', '/uploads/1/image/2021/11/20211112181242418_7olxk.jpg', 330761, '2021-11-12 18:12:43', '1');
INSERT INTO `ujcms_attachment` VALUES (273, 1, 1, '图片_风光A4.jpg', '/1/image/2021/11/20211112181242454_v9mmp.jpg', '/uploads/1/image/2021/11/20211112181242454_v9mmp.jpg', 239945, '2021-11-12 18:12:43', '1');
INSERT INTO `ujcms_attachment` VALUES (274, 1, 1, '图片_风光A3.jpg', '/1/image/2021/11/20211112181242446_1fsr0.jpg', '/uploads/1/image/2021/11/20211112181242446_1fsr0.jpg', 250721, '2021-11-12 18:12:43', '1');
INSERT INTO `ujcms_attachment` VALUES (275, 1, 1, '图片_风光A5.jpg', '/1/image/2021/11/20211112181242471_w5cci.jpg', '/uploads/1/image/2021/11/20211112181242471_w5cci.jpg', 300083, '2021-11-12 18:12:43', '1');
INSERT INTO `ujcms_attachment` VALUES (276, 1, 1, '图片_风光A.jpg', '/1/image/2021/11/20211112181255426_puyn8.jpg', '/uploads/1/image/2021/11/20211112181255426_puyn8.jpg', 295109, '2021-11-12 18:12:55', '1');
INSERT INTO `ujcms_attachment` VALUES (277, 1, 1, '图片_人物A.jpg', '/1/image/2021/11/20211112181835422_e4j2k.jpg', '/uploads/1/image/2021/11/20211112181835422_e4j2k.jpg', 341525, '2021-11-12 18:18:36', '1');
INSERT INTO `ujcms_attachment` VALUES (278, 1, 1, '图片_人物A2.jpg', '/1/image/2021/11/20211112181835756_xhyeo.jpg', '/uploads/1/image/2021/11/20211112181835756_xhyeo.jpg', 383544, '2021-11-12 18:18:36', '1');
INSERT INTO `ujcms_attachment` VALUES (279, 1, 1, '图片_人物A3.jpg', '/1/image/2021/11/20211112181835756_l6ylw.jpg', '/uploads/1/image/2021/11/20211112181835756_l6ylw.jpg', 423700, '2021-11-12 18:18:36', '1');
INSERT INTO `ujcms_attachment` VALUES (283, 1, 1, '20211112182329645_6onbd.jpg', '/1/image/2021/11/20211112182335734_9p89i.jpg', '/uploads/1/image/2021/11/20211112182335734_9p89i.jpg', 7420, '2021-11-12 18:23:36', '1');
INSERT INTO `ujcms_attachment` VALUES (284, 1, 1, '图片_人物B.jpg', '/1/image/2021/11/20211112182654849_kemtl.jpg', '/uploads/1/image/2021/11/20211112182654849_kemtl.jpg', 484276, '2021-11-12 18:26:55', '1');
INSERT INTO `ujcms_attachment` VALUES (285, 1, 1, '图片_人物B4.jpg', '/1/image/2021/11/20211112182654847_0uq5o.jpg', '/uploads/1/image/2021/11/20211112182654847_0uq5o.jpg', 588021, '2021-11-12 18:26:55', '1');
INSERT INTO `ujcms_attachment` VALUES (286, 1, 1, '图片_人物B5.jpg', '/1/image/2021/11/20211112182654862_t0q85.jpg', '/uploads/1/image/2021/11/20211112182654862_t0q85.jpg', 528184, '2021-11-12 18:26:55', '1');
INSERT INTO `ujcms_attachment` VALUES (287, 1, 1, '图片_人物B3.jpg', '/1/image/2021/11/20211112182654870_gl8rg.jpg', '/uploads/1/image/2021/11/20211112182654870_gl8rg.jpg', 509891, '2021-11-12 18:26:55', '1');
INSERT INTO `ujcms_attachment` VALUES (288, 1, 1, '图片_人物B2.jpg', '/1/image/2021/11/20211112182654870_wrdu4.jpg', '/uploads/1/image/2021/11/20211112182654870_wrdu4.jpg', 521543, '2021-11-12 18:26:55', '1');
INSERT INTO `ujcms_attachment` VALUES (290, 1, 1, '20211112182713417_f4uww.jpg', '/1/image/2021/11/20211112182722661_3kbny.jpg', '/uploads/1/image/2021/11/20211112182722661_3kbny.jpg', 11540, '2021-11-12 18:27:23', '1');
INSERT INTO `ujcms_attachment` VALUES (297, 1, 1, '20211112182953577_ffrn1.jpg', '/1/image/2021/11/20211112182957845_keu7f.jpg', '/uploads/1/image/2021/11/20211112182957845_keu7f.jpg', 10736, '2021-11-12 18:29:58', '1');
INSERT INTO `ujcms_attachment` VALUES (304, 1, 1, '20211112183059445_obndb.jpg', '/1/image/2021/11/20211112183104456_7499y.jpg', '/uploads/1/image/2021/11/20211112183104456_7499y.jpg', 6411, '2021-11-12 18:31:05', '1');
INSERT INTO `ujcms_attachment` VALUES (305, 1, 1, '图片_篮球戴维斯.jpg', '/1/image/2021/11/20211112183234907_ch5kw.jpg', '/uploads/1/image/2021/11/20211112183234907_ch5kw.jpg', 210437, '2021-11-12 18:32:35', '1');
INSERT INTO `ujcms_attachment` VALUES (306, 1, 1, '图片_篮球戴维斯3.jpg', '/1/image/2021/11/20211112183234907_9xnib.jpg', '/uploads/1/image/2021/11/20211112183234907_9xnib.jpg', 188184, '2021-11-12 18:32:35', '1');
INSERT INTO `ujcms_attachment` VALUES (307, 1, 1, '图片_篮球戴维斯2.jpg', '/1/image/2021/11/20211112183234907_8swxk.jpg', '/uploads/1/image/2021/11/20211112183234907_8swxk.jpg', 384952, '2021-11-12 18:32:35', '1');
INSERT INTO `ujcms_attachment` VALUES (309, 1, 1, '20211112183418657_st7x0.jpg', '/1/image/2021/11/20211112183426133_uukxi.jpg', '/uploads/1/image/2021/11/20211112183426133_uukxi.jpg', 16718, '2021-11-12 18:34:26', '1');
INSERT INTO `ujcms_attachment` VALUES (328, 1, 1, '产品_rf70-200_f28.jpg', '/1/image/2021/11/20211118164011361_t92c6.jpg', '/uploads/1/image/2021/11/20211118164011361_t92c6.jpg', 107892, '2021-11-18 16:40:11', '1');
INSERT INTO `ujcms_attachment` VALUES (329, 1, 1, '产品_rf24-70_f28.jpg', '/1/image/2021/11/20211118164107120_casro.jpg', '/uploads/1/image/2021/11/20211118164107120_casro.jpg', 104179, '2021-11-18 16:41:07', '1');
INSERT INTO `ujcms_attachment` VALUES (330, 1, 1, '产品_rf50f12.jpg', '/1/image/2021/11/20211118164118336_t9ca3.jpg', '/uploads/1/image/2021/11/20211118164118336_t9ca3.jpg', 91944, '2021-11-18 16:41:18', '1');
INSERT INTO `ujcms_attachment` VALUES (331, 1, 1, '产品_rf35f18.jpg', '/1/image/2021/11/20211118164131270_159y8.jpg', '/uploads/1/image/2021/11/20211118164131270_159y8.jpg', 69310, '2021-11-18 16:41:31', '1');
INSERT INTO `ujcms_attachment` VALUES (332, 1, 1, '产品_rf50f18.jpg', '/1/image/2021/11/20211118164143293_bh9k6.jpg', '/uploads/1/image/2021/11/20211118164143293_bh9k6.jpg', 68766, '2021-11-18 16:41:43', '1');
INSERT INTO `ujcms_attachment` VALUES (333, 1, 1, '产品_xtc_advanced_1.jpg', '/1/image/2021/11/20211118164200397_fjk26.jpg', '/uploads/1/image/2021/11/20211118164200397_fjk26.jpg', 90569, '2021-11-18 16:42:00', '1');
INSERT INTO `ujcms_attachment` VALUES (334, 1, 1, '产品_tcradvsl3disc.jpg', '/1/image/2021/11/20211118164216015_x598j.jpg', '/uploads/1/image/2021/11/20211118164216015_x598j.jpg', 103739, '2021-11-18 16:42:16', '1');
INSERT INTO `ujcms_attachment` VALUES (335, 1, 1, '产品_macbookpro16.jpg', '/1/image/2021/11/20211118164225222_8sby8.jpg', '/uploads/1/image/2021/11/20211118164225222_8sby8.jpg', 247937, '2021-11-18 16:42:25', '1');
INSERT INTO `ujcms_attachment` VALUES (336, 1, 1, '产品_ipad-pro-12.jpg', '/1/image/2021/11/20211118164237664_e7b1v.jpg', '/uploads/1/image/2021/11/20211118164237664_e7b1v.jpg', 438649, '2021-11-18 16:42:38', '1');
INSERT INTO `ujcms_attachment` VALUES (337, 1, 1, '产品_iPhone13ProMax.png', '/1/image/2021/11/20211118164245284_ls4os.png', '/uploads/1/image/2021/11/20211118164245284_ls4os.png', 603577, '2021-11-18 16:42:46', '1');
INSERT INTO `ujcms_attachment` VALUES (338, 1, 1, '文库_2.png', '/1/image/2021/11/20211118164649038_maqmg.png', '/uploads/1/image/2021/11/20211118164649038_maqmg.png', 4682, '2021-11-18 16:46:49', '1');
INSERT INTO `ujcms_attachment` VALUES (339, 1, 1, '文库_1.png', '/1/image/2021/11/20211118164704288_njy3g.png', '/uploads/1/image/2021/11/20211118164704288_njy3g.png', 905, '2021-11-18 16:47:04', '1');
INSERT INTO `ujcms_attachment` VALUES (341, 1, 1, '20211122154631621_v09ml.jpg', '/1/image/2021/11/20211122154637913_e1e7q.jpg', '/uploads/1/image/2021/11/20211122154637913_e1e7q.jpg', 8952, '2021-11-22 15:46:38', '1');
INSERT INTO `ujcms_attachment` VALUES (345, 1, 1, '20211122154857624_al5b2.jpg', '/1/image/2021/11/20211122154901380_aueka.jpg', '/uploads/1/image/2021/11/20211122154901380_aueka.jpg', 9264, '2021-11-22 15:49:02', '1');
INSERT INTO `ujcms_attachment` VALUES (347, 1, 1, '图片_人物D3.jpg', '/1/image/2022/01/20220105215049954_gpfsk.jpg', '/uploads/1/image/2022/01/20220105215049954_gpfsk.jpg', 335507, '2022-01-05 21:50:50', '1');
INSERT INTO `ujcms_attachment` VALUES (348, 1, 1, '图片_人物D1.jpg', '/1/image/2022/01/20220105215049954_9xhpe.jpg', '/uploads/1/image/2022/01/20220105215049954_9xhpe.jpg', 584654, '2022-01-05 21:50:50', '1');
INSERT INTO `ujcms_attachment` VALUES (349, 1, 1, '图片_人物D4.jpg', '/1/image/2022/01/20220105215049954_97jm2.jpg', '/uploads/1/image/2022/01/20220105215049954_97jm2.jpg', 438424, '2022-01-05 21:50:50', '1');
INSERT INTO `ujcms_attachment` VALUES (350, 1, 1, '图片_人物D.jpg', '/1/image/2022/01/20220105215049954_3u2m5.jpg', '/uploads/1/image/2022/01/20220105215049954_3u2m5.jpg', 478687, '2022-01-05 21:50:50', '1');
INSERT INTO `ujcms_attachment` VALUES (351, 1, 1, '图片_人物D5.jpg', '/1/image/2022/01/20220105215049954_5h18u.jpg', '/uploads/1/image/2022/01/20220105215049954_5h18u.jpg', 179085, '2022-01-05 21:50:51', '1');
INSERT INTO `ujcms_attachment` VALUES (352, 1, 1, '图片_人物C.jpg', '/1/image/2022/01/20220105215123974_9kag6.jpg', '/uploads/1/image/2022/01/20220105215123974_9kag6.jpg', 475719, '2022-01-05 21:51:24', '1');
INSERT INTO `ujcms_attachment` VALUES (353, 1, 1, '图片_人物C3.jpg', '/1/image/2022/01/20220105215123966_e3gf1.jpg', '/uploads/1/image/2022/01/20220105215123966_e3gf1.jpg', 299533, '2022-01-05 21:51:24', '1');
INSERT INTO `ujcms_attachment` VALUES (354, 1, 1, '图片_人物C5.jpg', '/1/image/2022/01/20220105215123981_p4pvt.jpg', '/uploads/1/image/2022/01/20220105215123981_p4pvt.jpg', 616889, '2022-01-05 21:51:24', '1');
INSERT INTO `ujcms_attachment` VALUES (355, 1, 1, '图片_人物C4.jpg', '/1/image/2022/01/20220105215123974_gibmm.jpg', '/uploads/1/image/2022/01/20220105215123974_gibmm.jpg', 544891, '2022-01-05 21:51:24', '1');
INSERT INTO `ujcms_attachment` VALUES (356, 1, 1, '图片_人物C2.jpg', '/1/image/2022/01/20220105215123966_npvr7.jpg', '/uploads/1/image/2022/01/20220105215123966_npvr7.jpg', 397961, '2022-01-05 21:51:24', '1');
INSERT INTO `ujcms_attachment` VALUES (748, 1, 1, '20220717224712923_f3ioyhaab958.jpg', '/1/image/2022/07/20220717224717470_aigpqpf4m567.jpg', '/uploads/1/image/2022/07/20220717224717470_aigpqpf4m567.jpg', 11080, '2022-07-17 22:47:18', '1');
INSERT INTO `ujcms_attachment` VALUES (750, 1, 1, '20220717225516353_0lyaluifjbki.jpg', '/1/image/2022/07/20220717225518239_r9ik60zsoq3l.jpg', '/uploads/1/image/2022/07/20220717225518239_r9ik60zsoq3l.jpg', 13057, '2022-07-17 22:55:18', '1');

-- ----------------------------
-- Table structure for ujcms_attachment_refer
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_attachment_refer`;
CREATE TABLE `ujcms_attachment_refer`  (
  `id_` bigint NOT NULL,
  `attachment_id_` bigint NOT NULL,
  `refer_type_` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '引用类型',
  `refer_id_` bigint NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `idx_attachmentrefer_unique`(`attachment_id_` ASC, `refer_type_` ASC, `refer_id_` ASC) USING BTREE,
  INDEX `idx_attachmentrefer_type_id`(`refer_type_` ASC, `refer_id_` ASC) USING BTREE,
  CONSTRAINT `fk_attachmentrefer_attachment` FOREIGN KEY (`attachment_id_`) REFERENCES `ujcms_attachment` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_attachment_refer
-- ----------------------------
INSERT INTO `ujcms_attachment_refer` VALUES (1, 231, 'block_item', 7);
INSERT INTO `ujcms_attachment_refer` VALUES (2, 233, 'block_item', 5);
INSERT INTO `ujcms_attachment_refer` VALUES (3, 235, 'block_item', 6);
INSERT INTO `ujcms_attachment_refer` VALUES (125, 236, 'article', 22);
INSERT INTO `ujcms_attachment_refer` VALUES (5, 237, 'article', 14);
INSERT INTO `ujcms_attachment_refer` VALUES (6, 239, 'article', 6);
INSERT INTO `ujcms_attachment_refer` VALUES (375, 240, 'article', 4);
INSERT INTO `ujcms_attachment_refer` VALUES (8, 241, 'article', 3);
INSERT INTO `ujcms_attachment_refer` VALUES (129, 242, 'article', 23);
INSERT INTO `ujcms_attachment_refer` VALUES (275, 243, 'article', 15);
INSERT INTO `ujcms_attachment_refer` VALUES (11, 244, 'article', 13);
INSERT INTO `ujcms_attachment_refer` VALUES (12, 245, 'article', 12);
INSERT INTO `ujcms_attachment_refer` VALUES (13, 246, 'article', 11);
INSERT INTO `ujcms_attachment_refer` VALUES (14, 247, 'article', 10);
INSERT INTO `ujcms_attachment_refer` VALUES (15, 248, 'article', 9);
INSERT INTO `ujcms_attachment_refer` VALUES (16, 249, 'article', 8);
INSERT INTO `ujcms_attachment_refer` VALUES (374, 250, 'article', 24);
INSERT INTO `ujcms_attachment_refer` VALUES (80, 255, 'article', 25);
INSERT INTO `ujcms_attachment_refer` VALUES (331, 256, 'article', 26);
INSERT INTO `ujcms_attachment_refer` VALUES (327, 258, 'article', 27);
INSERT INTO `ujcms_attachment_refer` VALUES (329, 261, 'article', 29);
INSERT INTO `ujcms_attachment_refer` VALUES (328, 262, 'article', 30);
INSERT INTO `ujcms_attachment_refer` VALUES (330, 264, 'article', 28);
INSERT INTO `ujcms_attachment_refer` VALUES (79, 265, 'article', 31);
INSERT INTO `ujcms_attachment_refer` VALUES (78, 266, 'article', 32);
INSERT INTO `ujcms_attachment_refer` VALUES (77, 267, 'article', 33);
INSERT INTO `ujcms_attachment_refer` VALUES (76, 268, 'article', 34);
INSERT INTO `ujcms_attachment_refer` VALUES (28, 271, 'article', 37);
INSERT INTO `ujcms_attachment_refer` VALUES (29, 272, 'article', 37);
INSERT INTO `ujcms_attachment_refer` VALUES (30, 273, 'article', 37);
INSERT INTO `ujcms_attachment_refer` VALUES (31, 274, 'article', 37);
INSERT INTO `ujcms_attachment_refer` VALUES (32, 275, 'article', 37);
INSERT INTO `ujcms_attachment_refer` VALUES (33, 276, 'article', 37);
INSERT INTO `ujcms_attachment_refer` VALUES (34, 277, 'article', 38);
INSERT INTO `ujcms_attachment_refer` VALUES (35, 278, 'article', 38);
INSERT INTO `ujcms_attachment_refer` VALUES (36, 279, 'article', 38);
INSERT INTO `ujcms_attachment_refer` VALUES (37, 283, 'article', 38);
INSERT INTO `ujcms_attachment_refer` VALUES (38, 284, 'article', 39);
INSERT INTO `ujcms_attachment_refer` VALUES (39, 285, 'article', 39);
INSERT INTO `ujcms_attachment_refer` VALUES (40, 286, 'article', 39);
INSERT INTO `ujcms_attachment_refer` VALUES (41, 287, 'article', 39);
INSERT INTO `ujcms_attachment_refer` VALUES (42, 288, 'article', 39);
INSERT INTO `ujcms_attachment_refer` VALUES (43, 290, 'article', 39);
INSERT INTO `ujcms_attachment_refer` VALUES (44, 297, 'article', 40);
INSERT INTO `ujcms_attachment_refer` VALUES (45, 304, 'article', 41);
INSERT INTO `ujcms_attachment_refer` VALUES (46, 305, 'article', 42);
INSERT INTO `ujcms_attachment_refer` VALUES (47, 306, 'article', 42);
INSERT INTO `ujcms_attachment_refer` VALUES (48, 307, 'article', 42);
INSERT INTO `ujcms_attachment_refer` VALUES (49, 309, 'article', 42);
INSERT INTO `ujcms_attachment_refer` VALUES (89, 328, 'article', 52);
INSERT INTO `ujcms_attachment_refer` VALUES (90, 329, 'article', 51);
INSERT INTO `ujcms_attachment_refer` VALUES (91, 330, 'article', 50);
INSERT INTO `ujcms_attachment_refer` VALUES (92, 331, 'article', 49);
INSERT INTO `ujcms_attachment_refer` VALUES (93, 332, 'article', 48);
INSERT INTO `ujcms_attachment_refer` VALUES (94, 333, 'article', 47);
INSERT INTO `ujcms_attachment_refer` VALUES (95, 334, 'article', 46);
INSERT INTO `ujcms_attachment_refer` VALUES (96, 335, 'article', 45);
INSERT INTO `ujcms_attachment_refer` VALUES (97, 336, 'article', 44);
INSERT INTO `ujcms_attachment_refer` VALUES (98, 337, 'article', 43);
INSERT INTO `ujcms_attachment_refer` VALUES (60, 338, 'article', 54);
INSERT INTO `ujcms_attachment_refer` VALUES (61, 339, 'article', 53);
INSERT INTO `ujcms_attachment_refer` VALUES (74, 341, 'article', 36);
INSERT INTO `ujcms_attachment_refer` VALUES (75, 345, 'article', 35);
INSERT INTO `ujcms_attachment_refer` VALUES (64, 347, 'article', 41);
INSERT INTO `ujcms_attachment_refer` VALUES (65, 348, 'article', 41);
INSERT INTO `ujcms_attachment_refer` VALUES (66, 349, 'article', 41);
INSERT INTO `ujcms_attachment_refer` VALUES (67, 350, 'article', 41);
INSERT INTO `ujcms_attachment_refer` VALUES (68, 351, 'article', 41);
INSERT INTO `ujcms_attachment_refer` VALUES (69, 352, 'article', 40);
INSERT INTO `ujcms_attachment_refer` VALUES (70, 353, 'article', 40);
INSERT INTO `ujcms_attachment_refer` VALUES (71, 354, 'article', 40);
INSERT INTO `ujcms_attachment_refer` VALUES (72, 355, 'article', 40);
INSERT INTO `ujcms_attachment_refer` VALUES (73, 356, 'article', 40);
INSERT INTO `ujcms_attachment_refer` VALUES (225, 748, 'article', 105);
INSERT INTO `ujcms_attachment_refer` VALUES (226, 750, 'article', 155);

-- ----------------------------
-- Table structure for ujcms_block
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_block`;
CREATE TABLE `ujcms_block`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `alias_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '别名',
  `scope_` smallint NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
  `with_link_url_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `with_subtitle_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `with_description_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `with_image_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `with_mobile_image_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `link_url_required_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `subtitle_required_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `description_required_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `image_required_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `mobile_image_required_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `image_width_` int NOT NULL DEFAULT 300 COMMENT '图片宽度',
  `image_height_` int NOT NULL DEFAULT 200 COMMENT '图片高度',
  `mobile_image_width_` int NOT NULL DEFAULT 300 COMMENT '手机端图片宽度',
  `mobile_image_height_` int NOT NULL DEFAULT 200 COMMENT '手机端图片高度',
  `recommendable_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `order_` int NOT NULL DEFAULT 999999,
  `with_video_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `video_required_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_block_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_block_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '区块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_block
-- ----------------------------
INSERT INTO `ujcms_block` VALUES (1, NULL, '首页焦点', 'focus', 2, '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', 1200, 600, 300, 200, '1', '1', 1, '0', '0');

-- ----------------------------
-- Table structure for ujcms_block_item
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_block_item`;
CREATE TABLE `ujcms_block_item`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `block_id_` bigint NOT NULL,
  `article_id_` bigint NULL DEFAULT NULL,
  `title_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `subtitle_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '副标题',
  `description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `link_url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
  `image_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `mobile_image_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机端图片',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `order_` bigint NOT NULL,
  `target_blank_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `video_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `uk_blockitem_block_article`(`article_id_` ASC, `block_id_` ASC) USING BTREE,
  INDEX `idx_blockitem_block`(`block_id_` ASC) USING BTREE,
  INDEX `idx_blockitem_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_blockitem_article` FOREIGN KEY (`article_id_`) REFERENCES `ujcms_article` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_blockitem_block` FOREIGN KEY (`block_id_`) REFERENCES `ujcms_block` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_blockitem_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '区块条目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_block_item
-- ----------------------------
INSERT INTO `ujcms_block_item` VALUES (5, 1, 1, 3, '夕阳下歼10起飞参加演习 画面超美', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104125546515_u445l.jpg', NULL, '1', 5, '0', NULL);
INSERT INTO `ujcms_block_item` VALUES (6, 1, 1, 4, '面临三重生存威胁 全球持续变暖马尔代夫恐将“消失”', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104165740209_ceomo.jpg', NULL, '1', 6, '0', NULL);
INSERT INTO `ujcms_block_item` VALUES (7, 1, 1, 6, '英姿飒爽！陆军首批10名女飞行学员完成首次单飞', NULL, NULL, NULL, '/uploads/1/image/2021/11/20211104125504412_of8lq.jpg', NULL, '1', 7, '0', NULL);

-- ----------------------------
-- Table structure for ujcms_channel
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_channel`;
CREATE TABLE `ujcms_channel`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `parent_id_` bigint NULL DEFAULT NULL,
  `channel_model_id_` bigint NOT NULL,
  `article_model_id_` bigint NOT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `alias_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '别名',
  `nav_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `process_key_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程标识',
  `type_` smallint NOT NULL DEFAULT 1 COMMENT '类型(1:常规栏目,2:单页栏目,3:转向链接,4:链接到第一篇文章,5:链接到第一个子栏目)',
  `depth_` smallint NOT NULL DEFAULT 1 COMMENT '层级',
  `order_` int NOT NULL DEFAULT 999999 COMMENT '排列顺序',
  `target_blank_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否新窗口打开',
  `image_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `link_url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转向链接地址',
  `article_template_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章模板',
  `channel_template_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '栏目模板',
  `performance_type_id_` bigint NULL DEFAULT NULL,
  `page_size_` smallint NOT NULL DEFAULT 20 COMMENT '每页条数',
  `order_desc_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否倒序排序',
  `allow_comment_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否允许评论',
  `allow_contribute_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否允许投稿',
  `allow_search_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否允许搜索',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  `views_` bigint NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `self_views_` bigint NOT NULL DEFAULT 0 COMMENT '栏目页浏览次数',
  `mains_json_` json NULL COMMENT '自定义主字段JSON',
  `clobs_json_` json NULL COMMENT '自定义大字段JSON',
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `uk_channel_alias_site`(`alias_` ASC, `site_id_` ASC) USING BTREE,
  INDEX `idx_channel_model_article`(`article_model_id_` ASC) USING BTREE,
  INDEX `idx_channel_model_channel`(`channel_model_id_` ASC) USING BTREE,
  INDEX `idx_channel_order`(`order_` ASC) USING BTREE,
  INDEX `idx_channel_parent`(`parent_id_` ASC) USING BTREE,
  INDEX `idx_channel_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_channel_performance_type`(`performance_type_id_` ASC) USING BTREE,
  CONSTRAINT `fk_channel_model_article` FOREIGN KEY (`article_model_id_`) REFERENCES `ujcms_model` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_channel_model_channel` FOREIGN KEY (`channel_model_id_`) REFERENCES `ujcms_model` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_channel_parent` FOREIGN KEY (`parent_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_channel_performance_type` FOREIGN KEY (`performance_type_id_`) REFERENCES `ujcms_performance_type` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_channel_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_channel
-- ----------------------------
INSERT INTO `ujcms_channel` VALUES (4, 1, NULL, 12, 11, '新闻', 'news', '1', NULL, 1, 1, 1, '0', NULL, NULL, 'article', 'channel', NULL, 10, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 12, 3, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (8, 1, 4, 12, 11, '国内', 'china', '1', NULL, 2, 2, 2, '0', NULL, NULL, 'article', 'channel', NULL, 10, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 5, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (9, 1, 4, 12, 11, '国际', 'world', '1', NULL, 1, 2, 3, '0', NULL, NULL, 'article', 'channel', NULL, 10, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 4, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (10, 1, NULL, 12, 14, '图片', 'photo', '1', NULL, 1, 1, 4, '0', NULL, NULL, 'article', 'channel', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 2, 1, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (11, 1, NULL, 12, 15, '视频', 'video', '1', NULL, 1, 1, 8, '0', NULL, NULL, 'article', 'channel_video', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (12, 1, NULL, 12, 16, '下载', 'download', '1', NULL, 1, 1, 11, '0', NULL, NULL, 'article_download', 'channel_download', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 14, 1, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (13, 1, NULL, 12, 17, '文库', 'wenku', '1', NULL, 1, 1, 15, '0', NULL, NULL, 'article_wenku', 'channel_wenku', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 3, 2, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (14, 1, NULL, 12, 18, '产品', 'product', '1', NULL, 1, 1, 18, '0', NULL, NULL, 'article_product', 'channel_product', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (25, 1, 10, 12, 14, '人物图库', '25', '1', NULL, 1, 2, 5, '0', NULL, NULL, 'article', 'channel', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (26, 1, 10, 12, 14, '旅游摄影', '26', '1', NULL, 1, 2, 6, '0', NULL, NULL, 'article', 'channel', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 1, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (27, 1, 10, 12, 14, '自然景观', '27', '1', NULL, 1, 2, 7, '0', NULL, NULL, 'article', 'channel', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (28, 1, 12, 12, 16, '媒体软件', '28', '1', NULL, 1, 2, 12, '0', NULL, NULL, 'article_download', 'channel_download', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (29, 1, 12, 12, 16, '网络软件', '29', '1', NULL, 1, 2, 13, '0', NULL, NULL, 'article_download', 'channel_download', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 13, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (30, 1, 12, 12, 16, '系统工具', '30', '1', NULL, 1, 2, 14, '0', NULL, NULL, 'article_download', 'channel_download', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (31, 1, 14, 12, 18, '手机', '31', '1', NULL, 1, 2, 19, '0', NULL, NULL, 'article_product', 'channel_product', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (32, 1, 14, 12, 20, '自行车', '32', '1', NULL, 1, 2, 20, '0', NULL, NULL, 'article_product', 'channel_product', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (33, 1, 14, 12, 21, '相机', '33', '1', NULL, 1, 2, 21, '0', NULL, NULL, 'article_product', 'channel_product', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (34, 1, 13, 12, 17, '教育文库', '34', '1', NULL, 1, 2, 16, '0', NULL, NULL, 'article_wenku', 'channel_wenku', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (35, 1, 13, 12, 17, '专业资料', '35', '1', NULL, 1, 2, 17, '0', NULL, NULL, 'article_wenku', 'channel_wenku', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 1, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (36, 1, 11, 12, 15, '电影', '36', '1', NULL, 1, 2, 9, '0', NULL, NULL, 'article', 'channel_video', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (37, 1, 11, 12, 15, '电视剧', '37', '1', NULL, 1, 2, 10, '0', NULL, NULL, 'article', 'channel_video', NULL, 20, '1', '1', '1', '1', '2023-06-07 17:02:59', '2023-06-07 17:02:59', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (89, 1, NULL, 12, 11, '留言', 'message-board', '1', NULL, 3, 1, 22, '0', NULL, '/message-board', NULL, NULL, NULL, 20, '1', '1', '0', '0', '2023-08-08 13:03:52', '2023-08-08 13:03:52', 0, 0, NULL, NULL);
INSERT INTO `ujcms_channel` VALUES (91, 1, NULL, 12, 11, '关于我们', 'about-us', '1', NULL, 2, 1, 23, '0', NULL, NULL, 'article', 'channel_about', NULL, 20, '1', '1', '0', '0', '2023-08-08 13:05:59', '2023-08-08 13:05:59', 17, 6, NULL, NULL);

-- ----------------------------
-- Table structure for ujcms_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_channel_ext`;
CREATE TABLE `ujcms_channel_ext`  (
  `id_` bigint NOT NULL,
  `seo_title_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO描述',
  `static_file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '静态页文件',
  `mobile_static_file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机端静态页文件',
  `text_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '正文',
  `markdown_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Markdown正文',
  `editor_type_` smallint NOT NULL DEFAULT 1 COMMENT '编辑器类型(1:富文本编辑器,2:Markdown编辑器)',
  PRIMARY KEY (`id_`) USING BTREE,
  CONSTRAINT `fk_channelext_channel` FOREIGN KEY (`id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '栏目扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_channel_ext
-- ----------------------------
INSERT INTO `ujcms_channel_ext` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (9, NULL, NULL, NULL, '/channels/world/index.html', NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ujcms_channel_ext` VALUES (91, NULL, NULL, NULL, NULL, NULL, '<p>UJCMS是一款基于Java、MyBatis、Vue3、ElementPlus等主流技术开发的内容管理系统，具有高效、稳定、安全、易用等特点，适用于政府、事业单位、企业、学校等各种类型的客户，可以满足不同行业和场景的需求。</p>\n<p>我们的团队成员都是从事Java开发多年的资深工程师，拥有丰富的项目经验和专业技能，能够为客户提供高质量的产品和解决方案。</p>\n<p>如果您对我们的产品或服务感兴趣，欢迎您随时联系我们，我们将竭诚为您服务。</p>', NULL, 1);

-- ----------------------------
-- Table structure for ujcms_channel_tree
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_channel_tree`;
CREATE TABLE `ujcms_channel_tree`  (
  `ancestor_id_` bigint NOT NULL,
  `descendant_id_` bigint NOT NULL,
  PRIMARY KEY (`ancestor_id_`, `descendant_id_`) USING BTREE,
  INDEX `idx_channeltree_composite`(`descendant_id_` ASC, `ancestor_id_` ASC) USING BTREE,
  CONSTRAINT `fk_channeltree_ancestor` FOREIGN KEY (`ancestor_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_channeltree_descendant` FOREIGN KEY (`descendant_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '栏目树形结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_channel_tree
-- ----------------------------
INSERT INTO `ujcms_channel_tree` VALUES (4, 4);
INSERT INTO `ujcms_channel_tree` VALUES (4, 8);
INSERT INTO `ujcms_channel_tree` VALUES (4, 9);
INSERT INTO `ujcms_channel_tree` VALUES (8, 8);
INSERT INTO `ujcms_channel_tree` VALUES (9, 9);
INSERT INTO `ujcms_channel_tree` VALUES (10, 10);
INSERT INTO `ujcms_channel_tree` VALUES (10, 25);
INSERT INTO `ujcms_channel_tree` VALUES (10, 26);
INSERT INTO `ujcms_channel_tree` VALUES (10, 27);
INSERT INTO `ujcms_channel_tree` VALUES (11, 11);
INSERT INTO `ujcms_channel_tree` VALUES (11, 36);
INSERT INTO `ujcms_channel_tree` VALUES (11, 37);
INSERT INTO `ujcms_channel_tree` VALUES (12, 12);
INSERT INTO `ujcms_channel_tree` VALUES (12, 28);
INSERT INTO `ujcms_channel_tree` VALUES (12, 29);
INSERT INTO `ujcms_channel_tree` VALUES (12, 30);
INSERT INTO `ujcms_channel_tree` VALUES (13, 13);
INSERT INTO `ujcms_channel_tree` VALUES (13, 34);
INSERT INTO `ujcms_channel_tree` VALUES (13, 35);
INSERT INTO `ujcms_channel_tree` VALUES (14, 14);
INSERT INTO `ujcms_channel_tree` VALUES (14, 31);
INSERT INTO `ujcms_channel_tree` VALUES (14, 32);
INSERT INTO `ujcms_channel_tree` VALUES (14, 33);
INSERT INTO `ujcms_channel_tree` VALUES (25, 25);
INSERT INTO `ujcms_channel_tree` VALUES (26, 26);
INSERT INTO `ujcms_channel_tree` VALUES (27, 27);
INSERT INTO `ujcms_channel_tree` VALUES (28, 28);
INSERT INTO `ujcms_channel_tree` VALUES (29, 29);
INSERT INTO `ujcms_channel_tree` VALUES (30, 30);
INSERT INTO `ujcms_channel_tree` VALUES (31, 31);
INSERT INTO `ujcms_channel_tree` VALUES (32, 32);
INSERT INTO `ujcms_channel_tree` VALUES (33, 33);
INSERT INTO `ujcms_channel_tree` VALUES (34, 34);
INSERT INTO `ujcms_channel_tree` VALUES (35, 35);
INSERT INTO `ujcms_channel_tree` VALUES (36, 36);
INSERT INTO `ujcms_channel_tree` VALUES (37, 37);
INSERT INTO `ujcms_channel_tree` VALUES (89, 89);
INSERT INTO `ujcms_channel_tree` VALUES (91, 91);

-- ----------------------------
-- Table structure for ujcms_config
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_config`;
CREATE TABLE `ujcms_config`  (
  `id_` bigint NOT NULL,
  `context_path_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上下文路径',
  `port_` int NULL DEFAULT NULL COMMENT '端口号',
  `multi_domain_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `channel_url_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '栏目URL地址',
  `article_url_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章URL地址',
  `default_site_id_` bigint NOT NULL,
  `upload_settings_` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `security_settings_` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `register_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注册设置',
  `sms_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '短信设置',
  `email_settings_` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upload_storage_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件存储点设置',
  `html_storage_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'HTML存储点设置',
  `template_storage_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模板存储点设置',
  `customs_settings_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自定义设置',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '全局配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_config
-- ----------------------------
INSERT INTO `ujcms_config` VALUES (1, NULL, 8080, '0', NULL, NULL, 1, '{\"imageTypes\":\"jpg,jpeg,png,gif\",\"videoTypes\":\"mp4,m3u8\",\"docTypes\":\"pdf,doc,docx,xls,xlsx,ppt,pptx\",\"fileTypes\":\"zip,7z,gz,bz2,iso,rar,pdf,doc,docx,xls,xlsx,ppt,pptx\",\"imageLimit\":0,\"videoLimit\":0,\"docLimit\":0,\"fileLimit\":0,\"imageMaxWidth\":1920,\"imageMaxHeight\":0,\"videoLimitByte\":0,\"imageLimitByte\":0,\"docLimitByte\":0,\"fileLimitByte\":0,\"docInputAccept\":\".zip,.7z,.gz,.bz2,.iso,.rar,.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx\",\"videoInputAccept\":\".mp4,.m3u8\",\"fileInputAccept\":\".zip,.7z,.gz,.bz2,.iso,.rar,.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx\",\"imageInputAccept\":\".jpg,.jpeg,.png,.gif\"}', NULL, '{\"enabled\":false,\"verifyMode\":1,\"usernameMinLength\":4,\"usernameMaxLength\":12,\"usernameRegex\":\"^[0-9a-zA-Z\\\\u4e00-\\\\u9fa5\\\\.\\\\-_]+$\",\"avatar\":\"/uploads/avatar/default/default.png\",\"smallAvatarSize\":80,\"mediumAvatarSize\":240,\"largeAvatarSize\":960}', NULL, NULL, NULL, NULL, NULL, '{\"oauth\":false}');

-- ----------------------------
-- Table structure for ujcms_dict
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_dict`;
CREATE TABLE `ujcms_dict`  (
  `id_` bigint NOT NULL,
  `type_id_` bigint NOT NULL,
  `parent_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `value_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '值',
  `remark_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `order_` int NOT NULL DEFAULT 999999,
  `sys_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_dict_dicttype`(`type_id_` ASC) USING BTREE,
  INDEX `idx_dict_parent`(`parent_id_` ASC) USING BTREE,
  CONSTRAINT `fk_dict_dicttype` FOREIGN KEY (`type_id_`) REFERENCES `ujcms_dict_type` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dict_parent` FOREIGN KEY (`parent_id_`) REFERENCES `ujcms_dict` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_dict
-- ----------------------------
INSERT INTO `ujcms_dict` VALUES (1, 2, NULL, '文章审核', 'sys_article', NULL, 32767, '1', '1');
INSERT INTO `ujcms_dict` VALUES (2, 2, NULL, '表单审核', 'sys_form', NULL, 999999, '1', '1');
INSERT INTO `ujcms_dict` VALUES (507, 1, NULL, '新华网', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (508, 1, NULL, '人民网', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (511, 100, NULL, '国产软件', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (512, 100, NULL, '国外软件', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (513, 101, NULL, '免费软件', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (514, 101, NULL, '收费软件', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (515, 102, NULL, '简体中文', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (516, 102, NULL, '繁体中文', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (517, 103, NULL, '★★★★★', '5', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (518, 103, NULL, '★★★★☆', '4', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (519, 103, NULL, '★★★☆☆', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (520, 103, NULL, '★★☆☆☆', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (521, 103, NULL, '★☆☆☆☆', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (522, 104, NULL, 'win7', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (523, 104, NULL, 'win10', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (524, 104, NULL, 'linux', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (525, 104, NULL, 'unix', '4', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (526, 104, NULL, 'mac', '5', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (527, 102, NULL, '英文', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (528, 105, NULL, '华语', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (529, 105, NULL, '美国', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (530, 105, NULL, '欧洲', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (531, 105, NULL, '韩国', '4', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (532, 105, NULL, '日本', '5', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (533, 105, NULL, '其它', '6', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (534, 106, NULL, '喜剧', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (535, 106, NULL, '悲剧', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (536, 106, NULL, '爱情', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (537, 106, NULL, '动作', '4', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (538, 106, NULL, '枪战', '5', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (539, 106, NULL, '犯罪', '6', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (540, 106, NULL, '惊悚', '7', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (541, 106, NULL, '恐怖', '8', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (542, 106, NULL, '悬疑', '9', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (543, 106, NULL, '动画', '10', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (544, 106, NULL, '家庭', '11', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (545, 106, NULL, '奇幻', '12', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (546, 106, NULL, '魔幻', '13', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (547, 106, NULL, '科幻', '14', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (548, 106, NULL, '战争', '15', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (549, 106, NULL, '武侠', '16', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (550, 106, NULL, '青春', '17', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (551, 106, NULL, '功夫', '18', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (552, 106, NULL, '灾难', '19', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (553, 107, NULL, '64GB', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (554, 107, NULL, '128GB', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (555, 107, NULL, '256GB', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (556, 107, NULL, '512GB', '4', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (557, 108, NULL, '5.0-5.49英寸', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (558, 108, NULL, '5.5-5.99英寸', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (559, 108, NULL, '6.0-6.49英寸', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (560, 108, NULL, '6.5英寸以上', '4', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (561, 109, NULL, '公路车', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (562, 109, NULL, '山地车', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (563, 110, NULL, '定焦', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (564, 110, NULL, '变焦', '2', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (565, 109, NULL, '旅行车', '3', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (566, 107, NULL, '1TB', '5', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (567, 111, NULL, 'EF', '1', NULL, 32767, '0', '1');
INSERT INTO `ujcms_dict` VALUES (568, 111, NULL, 'RF', '2', NULL, 32767, '0', '1');

-- ----------------------------
-- Table structure for ujcms_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_dict_type`;
CREATE TABLE `ujcms_dict_type`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `alias_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '别名',
  `remark_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `scope_` smallint NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
  `order_` int NOT NULL DEFAULT 999999,
  `sys_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `data_type_` smallint NOT NULL DEFAULT 0 COMMENT '数据类型(0:字符串,1:整型)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_dicttype_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_dicttype_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_dict_type
-- ----------------------------
INSERT INTO `ujcms_dict_type` VALUES (1, NULL, '文章来源', 'sys_article_source', NULL, 2, 32767, '1', 0);
INSERT INTO `ujcms_dict_type` VALUES (2, NULL, '流程类型', 'sys_process_category', NULL, 2, 32767, '1', 0);
INSERT INTO `ujcms_dict_type` VALUES (100, 1, '下载_类型', 'download_type', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (101, 1, '下载_授权', 'download_license', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (102, 1, '下载_语言', 'download_language', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (103, 1, '下载_星级', 'download_star', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (104, 1, '下载_环境', 'download_system', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (105, 1, '视频_地区', 'video_area', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (106, 1, '视频_类型', 'video_type', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (107, 1, '产品_手机_机身存储', 'product_phone_storage', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (108, 1, '产品_手机_屏幕尺寸', 'product_phone_screen', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (109, 1, '产品_自行车_类型', 'product_bike_type', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (110, 1, '产品_相机_类型', 'product_camera_type', NULL, 0, 32767, '0', 0);
INSERT INTO `ujcms_dict_type` VALUES (111, 1, '产品_相机_卡口', 'product_camera_mount', NULL, 0, 32767, '0', 0);

-- ----------------------------
-- Table structure for ujcms_error_word
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_error_word`;
CREATE TABLE `ujcms_error_word`  (
  `id_` bigint NOT NULL,
  `name_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `correct_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '正确词',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '易错词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_error_word
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_example
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_example`;
CREATE TABLE `ujcms_example`  (
  `id_` bigint NOT NULL,
  `name_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `description_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `height_` int NULL DEFAULT NULL COMMENT '身高',
  `birthday_` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '示例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_example
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_form
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_form`;
CREATE TABLE `ujcms_form`  (
  `id_` bigint NOT NULL,
  `type_id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `org_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `modified_user_id_` bigint NOT NULL,
  `process_instance_id_` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程实例ID',
  `reject_reason_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退回原因',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'IP地址',
  `order_` bigint NOT NULL COMMENT '排序',
  `status_` smallint NOT NULL COMMENT '状态(0:已审核,10:草稿,11:待审核,12:审核中,20:已删除,22:已退回)',
  `mains_json_` json NULL COMMENT '自定义主字段',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_form_org`(`org_id_` ASC) USING BTREE,
  INDEX `idx_form_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_form_type`(`type_id_` ASC) USING BTREE,
  INDEX `idx_form_user`(`user_id_` ASC) USING BTREE,
  INDEX `idx_form_user_modified`(`modified_user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_form_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_form_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_form_type` FOREIGN KEY (`type_id_`) REFERENCES `ujcms_form_type` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_form_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_form_user_modified` FOREIGN KEY (`modified_user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '表单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_form
-- ----------------------------
INSERT INTO `ujcms_form` VALUES (61183683675010049, 61183662909535234, 1, 1, 1, 1, NULL, NULL, '2024-06-12 16:16:55', '2024-06-12 16:16:55', '0:0:0:0:0:0:0:1', 61183683675010049, 0, '{\"name\": \"张三\", \"phone\": \"18866668888\", \"address\": \"火星路188号\"}');

-- ----------------------------
-- Table structure for ujcms_form_ext
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_form_ext`;
CREATE TABLE `ujcms_form_ext`  (
  `id_` bigint NOT NULL,
  `clobs_json_` json NULL COMMENT '自定义大字段',
  PRIMARY KEY (`id_`) USING BTREE,
  CONSTRAINT `fk_formext_form` FOREIGN KEY (`id_`) REFERENCES `ujcms_form` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '表单大字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_form_ext
-- ----------------------------
INSERT INTO `ujcms_form_ext` VALUES (61183683675010049, NULL);

-- ----------------------------
-- Table structure for ujcms_form_type
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_form_type`;
CREATE TABLE `ujcms_form_type`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `model_id_` bigint NOT NULL,
  `process_key_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程标识',
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `list_template_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列表模板',
  `item_template_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详情模板',
  `mode_` smallint NOT NULL DEFAULT 2 COMMENT '模式(0:前台游客,1:前台登录用户,2:仅后台用户)',
  `viewable_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '前台可查看',
  `order_` bigint NOT NULL COMMENT '排序',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_formtype_model`(`model_id_` ASC) USING BTREE,
  INDEX `idx_formtype_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_formtype_model` FOREIGN KEY (`model_id_`) REFERENCES `ujcms_model` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_formtype_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '表单类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_form_type
-- ----------------------------
INSERT INTO `ujcms_form_type` VALUES (61183662909535234, 1, 61183631521461250, NULL, '在线报名', NULL, NULL, 2, '0', 61183662909535234, '1');

-- ----------------------------
-- Table structure for ujcms_global
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_global`;
CREATE TABLE `ujcms_global`  (
  `name_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '值',
  PRIMARY KEY (`name_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '全局表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_global
-- ----------------------------
INSERT INTO `ujcms_global` VALUES ('sys_view_count', '{\"day\":[2024,9,13],\"week\":[2024,9,9],\"month\":[2024,9,1],\"quarter\":[2024,7,1],\"year\":[2024,1,1]}');
INSERT INTO `ujcms_global` VALUES ('sys_visitor_count', '{\"visitor\":0}');

-- ----------------------------
-- Table structure for ujcms_group
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_group`;
CREATE TABLE `ujcms_group`  (
  `id_` bigint NOT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `description_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `all_access_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `type_` smallint NOT NULL DEFAULT 2 COMMENT '类型(1:系统,2:常规,3:IP组)',
  `order_` int NOT NULL DEFAULT 999999,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_group
-- ----------------------------
INSERT INTO `ujcms_group` VALUES (1, '游客组', '未登录的用户属于游客组', '1', 1, 1);
INSERT INTO `ujcms_group` VALUES (8, '管理组', '后台管理员默认属于管理组', '1', 2, 2);
INSERT INTO `ujcms_group` VALUES (10, '普通组', '前台注册用户默认属于普通组', '1', 2, 3);

-- ----------------------------
-- Table structure for ujcms_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_group_access`;
CREATE TABLE `ujcms_group_access`  (
  `group_id_` bigint NOT NULL,
  `channel_id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  PRIMARY KEY (`group_id_`, `channel_id_`) USING BTREE,
  INDEX `idx_groupaccess_composite`(`channel_id_` ASC, `group_id_` ASC) USING BTREE,
  INDEX `idx_groupaccess_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_groupaccess_channel` FOREIGN KEY (`channel_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_groupaccess_group` FOREIGN KEY (`group_id_`) REFERENCES `ujcms_group` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_groupaccess_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户组访问权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_import_data
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_import_data`;
CREATE TABLE `ujcms_import_data`  (
  `id_` bigint NOT NULL,
  `table_name_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名',
  `current_id_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前主键值',
  `orig_id_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '原主键值',
  `orig_parent_id_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原上级主键值',
  `type_` smallint NOT NULL DEFAULT 1 COMMENT '类型(1:数据迁移,2:站点导入)',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '导入数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_import_data
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_login_log`;
CREATE TABLE `ujcms_login_log`  (
  `id_` bigint NOT NULL,
  `user_id_` bigint NULL DEFAULT NULL,
  `login_name_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录名',
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'IP地址',
  `created_` datetime NOT NULL COMMENT '创建日期',
  `type_` smallint NOT NULL COMMENT '类型(1:登录,2:修改密码,9:退出)',
  `status_` smallint NOT NULL DEFAULT 1 COMMENT '状态(0:成功,1:用户名不存在,2:密码错误,3:验证码错误,4:短信错误)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_loginlog_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_loginlog_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_login_log
-- ----------------------------
INSERT INTO `ujcms_login_log` VALUES (65398725924999681, 1, 'admin', '0:0:0:0:0:0:0:1', '2024-09-13 17:29:30', 1, 0);
INSERT INTO `ujcms_login_log` VALUES (65400026845017090, 1, 'admin', '0:0:0:0:0:0:0:1', '2024-09-13 18:10:52', 1, 0);

-- ----------------------------
-- Table structure for ujcms_message_board
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_message_board`;
CREATE TABLE `ujcms_message_board`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `reply_user_id_` bigint NULL DEFAULT NULL,
  `type_id_` bigint NOT NULL,
  `title_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言标题',
  `text_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '留言内容',
  `reply_text_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `created_` datetime NOT NULL COMMENT '创建日期',
  `reply_date_` datetime NULL DEFAULT NULL COMMENT '回复日期',
  `contact_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `nickname_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `address_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系地址',
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'IP地址',
  `open_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `replied_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `recommended_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `status_` smallint NOT NULL DEFAULT 1 COMMENT '状态(0:已审核,1:未审核,2:已屏蔽)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_messageboard_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_messageboard_user`(`user_id_` ASC) USING BTREE,
  INDEX `idx_messageboard_user_reply`(`reply_user_id_` ASC) USING BTREE,
  INDEX `idx_messageboard_type`(`type_id_` ASC) USING BTREE,
  CONSTRAINT `fk_messageboard_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_messageboard_type` FOREIGN KEY (`type_id_`) REFERENCES `ujcms_message_board_type` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_messageboard_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_messageboard_user_reply` FOREIGN KEY (`reply_user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '留言板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_message_board
-- ----------------------------
INSERT INTO `ujcms_message_board` VALUES (62272224050072577, 1, 0, 1, 62271616407096322, '关于版本发布', '请问新版本什么时候发布？', '<p>您好，根据技术部反馈的信息，新版本将在近期发布。敬请关注，谢谢！</p>', '2024-07-06 17:00:41', '2024-07-06 17:01:45', NULL, NULL, NULL, NULL, NULL, '0:0:0:0:0:0:0:1', '1', '1', '0', 0);

-- ----------------------------
-- Table structure for ujcms_message_board_type
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_message_board_type`;
CREATE TABLE `ujcms_message_board_type`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `description_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `order_` bigint NOT NULL COMMENT '排列顺序',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_messageboardtype_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_messageboardtype_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '留言类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_message_board_type
-- ----------------------------
INSERT INTO `ujcms_message_board_type` VALUES (62271616407096322, 1, '咨询', NULL, 62271616407096322);
INSERT INTO `ujcms_message_board_type` VALUES (62271625263893505, 1, '建议', NULL, 62271625263893505);

-- ----------------------------
-- Table structure for ujcms_model
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_model`;
CREATE TABLE `ujcms_model`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `type_` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型(article:文章,channel:栏目,user:用户,site:站点设置,global:全局设置)',
  `scope_` smallint NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
  `order_` int NOT NULL,
  `mains_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '主字段集',
  `asides_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '右侧字段集',
  `customs_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '自定义字段集',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_model
-- ----------------------------
INSERT INTO `ujcms_model` VALUES (1, NULL, '全局设置模型', 'global', 2, 32767, NULL, NULL, '[{\"code\":\"oauth\",\"type\":\"switch\",\"name\":\"第三方登录\",\"double\":false,\"inactiveValue\":\"0\",\"activeValue\":\"1\",\"defaultValue\":false}]');
INSERT INTO `ujcms_model` VALUES (2, NULL, '用户模型', 'user', 2, 32767, NULL, NULL, NULL);
INSERT INTO `ujcms_model` VALUES (11, NULL, '新闻', 'article', 2, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":200,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageListType\":\"pictureCard\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"type\":\"editor\",\"editorType\":1,\"editorSwitch\":true,\"label\":\"article.text\"},{\"code\":\"tags\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.tags\"},{\"code\":\"audio\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.audio\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', '[]');
INSERT INTO `ujcms_model` VALUES (12, NULL, '常规', 'channel', 2, 32767, NULL, NULL, '[]');
INSERT INTO `ujcms_model` VALUES (13, NULL, '站点设置模型', 'site', 2, 32767, NULL, NULL, '[{\"code\":\"company\",\"type\":\"text\",\"name\":\"公司名称\",\"double\":false},{\"code\":\"icp\",\"type\":\"text\",\"name\":\"ICP备案号\",\"double\":false}]');
INSERT INTO `ujcms_model` VALUES (14, 1, '图片', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":200,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":false,\"double\":false,\"required\":true,\"label\":\"article.text\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', NULL);
INSERT INTO `ujcms_model` VALUES (15, 1, '视频', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":200,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":false,\"double\":false,\"required\":true,\"label\":\"article.text\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', '[{\"code\":\"area\",\"type\":\"select\",\"name\":\"地区\",\"double\":true,\"dictTypeId\":\"105\",\"dataType\":\"string\"},{\"code\":\"type\",\"type\":\"select\",\"name\":\"类型\",\"double\":true,\"dictTypeId\":\"106\",\"dataType\":\"string\"}]');
INSERT INTO `ujcms_model` VALUES (16, 1, '下载', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":340,\"imageHeight\":340,\"imageMode\":\"manual\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.file\",\"name\":\"文件\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', '[{\"code\":\"type\",\"type\":\"radio\",\"name\":\"软件类型\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":\"100\",\"dataType\":\"string\"},{\"code\":\"license\",\"type\":\"radio\",\"name\":\"授权方式\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":\"101\",\"dataType\":\"string\"},{\"code\":\"language\",\"type\":\"select\",\"name\":\"界面语言\",\"double\":true,\"dictTypeId\":\"102\",\"dataType\":\"string\"},{\"code\":\"star\",\"type\":\"select\",\"name\":\"推荐星级\",\"double\":true,\"dictTypeId\":\"103\",\"dataType\":\"string\"},{\"code\":\"system\",\"type\":\"checkbox\",\"name\":\"运行环境\",\"double\":false,\"checkStyle\":\"default\",\"defaultValue\":[],\"multiple\":true,\"dictTypeId\":\"104\",\"defaultValueKey\":[],\"dataType\":\"string\"}]');
INSERT INTO `ujcms_model` VALUES (17, 1, '文库', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":300,\"imageHeight\":300,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":false,\"double\":false,\"required\":true,\"label\":\"article.text\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', NULL);
INSERT INTO `ujcms_model` VALUES (18, 1, '产品（手机）', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":800,\"imageHeight\":800,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\",\"name\":\"产品介绍\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', '[{\"code\":\"price\",\"type\":\"number\",\"name\":\"价格\",\"double\":true,\"precision\":2},{\"code\":\"guidePrice\",\"type\":\"number\",\"name\":\"厂商指导价\",\"double\":true,\"precision\":2},{\"code\":\"storage\",\"type\":\"radio\",\"name\":\"机身存储\",\"double\":false,\"checkStyle\":\"default\",\"dictTypeId\":\"107\",\"dataType\":\"string\"},{\"code\":\"screen\",\"type\":\"radio\",\"name\":\"屏幕尺寸\",\"double\":false,\"checkStyle\":\"default\",\"dictTypeId\":\"108\",\"dataType\":\"string\"},{\"code\":\"specifications\",\"type\":\"tinyEditor\",\"name\":\"规格与包装\",\"double\":false,\"minHeight\":300,\"maxHeight\":500}]');
INSERT INTO `ujcms_model` VALUES (20, 1, '产品（自行车）', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":800,\"imageHeight\":800,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\",\"name\":\"产品介绍\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', '[{\"code\":\"price\",\"type\":\"number\",\"name\":\"价格\",\"double\":true,\"precision\":2},{\"code\":\"guidePrice\",\"type\":\"number\",\"name\":\"厂商指导价\",\"double\":true,\"precision\":2},{\"code\":\"type\",\"type\":\"radio\",\"name\":\"类型\",\"double\":false,\"checkStyle\":\"default\",\"dictTypeId\":\"109\",\"dataType\":\"string\"},{\"code\":\"specifications\",\"type\":\"tinyEditor\",\"name\":\"规格与包装\",\"double\":false,\"minHeight\":300,\"maxHeight\":500}]');
INSERT INTO `ujcms_model` VALUES (21, 1, '产品（相机）', 'article', 0, 32767, '[{\"code\":\"title\",\"must\":true,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.title\"},{\"code\":\"subtitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.subtitle\"},{\"code\":\"fullTitle\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fullTitle\"},{\"code\":\"linkUrl\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.linkUrl\"},{\"code\":\"seoKeywords\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.seoKeywords\"},{\"code\":\"seoDescription\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"label\":\"article.seoDescription\"},{\"code\":\"author\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.author\"},{\"code\":\"editor\",\"must\":false,\"show\":false,\"double\":true,\"required\":false,\"label\":\"article.editor\"},{\"code\":\"image\",\"must\":false,\"show\":true,\"double\":false,\"required\":false,\"type\":\"image\",\"imageWidth\":800,\"imageHeight\":800,\"imageMode\":\"resize\",\"label\":\"article.image\"},{\"code\":\"file\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.file\"},{\"code\":\"video\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.video\"},{\"code\":\"doc\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.doc\"},{\"code\":\"imageList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"type\":\"imageList\",\"imageMaxWidth\":1920,\"imageMaxHeight\":1920,\"label\":\"article.imageList\"},{\"code\":\"fileList\",\"must\":false,\"show\":false,\"double\":false,\"required\":false,\"label\":\"article.fileList\"},{\"code\":\"text\",\"must\":false,\"show\":true,\"double\":false,\"required\":true,\"label\":\"article.text\",\"name\":\"产品介绍\"}]', '[{\"code\":\"channel\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.channel\"},{\"code\":\"org\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.org\"},{\"code\":\"publishDate\",\"must\":true,\"show\":true,\"required\":true,\"label\":\"article.publishDate\"},{\"code\":\"source\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.source\"},{\"code\":\"articleTemplate\",\"must\":false,\"show\":true,\"required\":false,\"label\":\"article.articleTemplate\"},{\"code\":\"allowComment\",\"must\":false,\"show\":true,\"required\":true,\"label\":\"article.allowComment\"},{\"code\":\"user\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.user\"},{\"code\":\"created\",\"must\":false,\"show\":false,\"required\":true,\"label\":\"article.created\"},{\"code\":\"modifiedUser\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modifiedUser\"},{\"code\":\"modified\",\"must\":false,\"show\":false,\"required\":false,\"label\":\"article.modified\"}]', '[{\"code\":\"price\",\"type\":\"number\",\"name\":\"价格\",\"double\":true},{\"code\":\"guidePrice\",\"type\":\"number\",\"name\":\"厂商指导价\",\"double\":true,\"precision\":2},{\"code\":\"type\",\"type\":\"radio\",\"name\":\"类型\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":\"110\",\"dataType\":\"string\"},{\"code\":\"mount\",\"type\":\"radio\",\"name\":\"卡口\",\"double\":true,\"checkStyle\":\"default\",\"dictTypeId\":\"111\",\"dataType\":\"string\"},{\"code\":\"specifications\",\"type\":\"tinyEditor\",\"name\":\"规格与包装\",\"double\":false,\"minHeight\":300,\"maxHeight\":500}]');
INSERT INTO `ujcms_model` VALUES (61183631521461250, 1, '在线报名', 'form', 0, 999999, NULL, NULL, '[{\"code\":\"name\",\"type\":\"text\",\"name\":\"姓名\",\"double\":false,\"dataType\":\"string\",\"clob\":false,\"showInList\":true},{\"code\":\"address\",\"type\":\"text\",\"name\":\"地址\",\"double\":false,\"dataType\":\"string\",\"clob\":false},{\"code\":\"phone\",\"type\":\"text\",\"name\":\"联系电话\",\"double\":false,\"dataType\":\"string\",\"clob\":false,\"showInList\":true}]');

-- ----------------------------
-- Table structure for ujcms_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_operation_log`;
CREATE TABLE `ujcms_operation_log`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `name_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `module_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模块',
  `request_method_` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方法',
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'IP地址',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `audit_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `type_` smallint NOT NULL COMMENT '类型(0:其它,1:新增,2:修改,3:删除)',
  `status_` smallint NOT NULL DEFAULT 1 COMMENT '状态(0:失败,1:成功)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_operationlog_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_operationlog_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_operationlog_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_operationlog_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_operation_log_ext
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_operation_log_ext`;
CREATE TABLE `ujcms_operation_log_ext`  (
  `id_` bigint NOT NULL,
  `request_url_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求URL',
  `request_body_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求体',
  `response_entity_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应体',
  `exception_stack_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常堆栈',
  PRIMARY KEY (`id_`) USING BTREE,
  CONSTRAINT `fk_operationlogext_log` FOREIGN KEY (`id_`) REFERENCES `ujcms_operation_log` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_operation_log_ext
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_org
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_org`;
CREATE TABLE `ujcms_org`  (
  `id_` bigint NOT NULL,
  `parent_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `phone_` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `address_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `contacts_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `depth_` smallint NOT NULL DEFAULT 1 COMMENT '层级',
  `order_` int NOT NULL DEFAULT 999999 COMMENT '排序',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_org_order`(`order_` ASC) USING BTREE,
  INDEX `idx_org_parent`(`parent_id_` ASC) USING BTREE,
  CONSTRAINT `fk_org_parent` FOREIGN KEY (`parent_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_org
-- ----------------------------
INSERT INTO `ujcms_org` VALUES (0, NULL, '前台组织', NULL, NULL, NULL, 1, 1);
INSERT INTO `ujcms_org` VALUES (1, NULL, '总部', NULL, NULL, NULL, 1, 1);

-- ----------------------------
-- Table structure for ujcms_org_article
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_org_article`;
CREATE TABLE `ujcms_org_article`  (
  `org_id_` bigint NOT NULL,
  `channel_id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`org_id_`, `channel_id_`) USING BTREE,
  INDEX `idx_orgarticle_composite`(`channel_id_` ASC, `org_id_` ASC) USING BTREE,
  INDEX `idx_orgarticle_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_orgarticle_channel` FOREIGN KEY (`channel_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orgarticle_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orgarticle_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织文章权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_org_article
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_org_channel
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_org_channel`;
CREATE TABLE `ujcms_org_channel`  (
  `org_id_` bigint NOT NULL,
  `channel_id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`org_id_`, `channel_id_`) USING BTREE,
  INDEX `idx_orgchannel_composite`(`channel_id_` ASC, `org_id_` ASC) USING BTREE,
  INDEX `idx_orgchannel_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_orgchannel_channel` FOREIGN KEY (`channel_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orgchannel_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orgchannel_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织栏目权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_org_channel
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_org_perm
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_org_perm`;
CREATE TABLE `ujcms_org_perm`  (
  `org_id_` bigint NOT NULL,
  `perm_org_id_` bigint NOT NULL,
  PRIMARY KEY (`org_id_`, `perm_org_id_`) USING BTREE,
  INDEX `idx_orgperm_composite`(`perm_org_id_` ASC, `org_id_` ASC) USING BTREE,
  CONSTRAINT `fk_orgperm_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orgperm_perm` FOREIGN KEY (`perm_org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_org_perm
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_org_tree
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_org_tree`;
CREATE TABLE `ujcms_org_tree`  (
  `ancestor_id_` bigint NOT NULL,
  `descendant_id_` bigint NOT NULL,
  PRIMARY KEY (`ancestor_id_`, `descendant_id_`) USING BTREE,
  INDEX `idx_orgtree_composite`(`descendant_id_` ASC, `ancestor_id_` ASC) USING BTREE,
  CONSTRAINT `fk_orgtree_ancestor` FOREIGN KEY (`ancestor_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orgtree_descendant` FOREIGN KEY (`descendant_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织树形结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_org_tree
-- ----------------------------
INSERT INTO `ujcms_org_tree` VALUES (1, 1);

-- ----------------------------
-- Table structure for ujcms_performance_type
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_performance_type`;
CREATE TABLE `ujcms_performance_type`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `score_` int NOT NULL DEFAULT 0 COMMENT '分数',
  `order_` bigint NOT NULL COMMENT '排序',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_performancetype_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_performancetype_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '绩效类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_performance_type
-- ----------------------------
INSERT INTO `ujcms_performance_type` VALUES (62401880487402498, 1, '资讯类', 2, 62401880487402498);
INSERT INTO `ujcms_performance_type` VALUES (62401886289697793, 1, '分析类', 5, 62401886289697793);

-- ----------------------------
-- Table structure for ujcms_push
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_push`;
CREATE TABLE `ujcms_push`  (
  `id_` bigint NOT NULL,
  `from_article_id_` bigint NOT NULL,
  `to_article_id_` bigint NOT NULL,
  `from_site_id_` bigint NOT NULL,
  `to_site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `created_` datetime NOT NULL COMMENT '推送时间',
  `type_` smallint NOT NULL DEFAULT 1 COMMENT '推送类型(1:复制,2:映射,3:引用)',
  `scope_` smallint NOT NULL DEFAULT 1 COMMENT '推送范围(1:站内,2:站外)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_push_article_from`(`from_article_id_` ASC) USING BTREE,
  INDEX `idx_push_article_to`(`to_article_id_` ASC) USING BTREE,
  INDEX `idx_push_site_from`(`from_site_id_` ASC) USING BTREE,
  INDEX `idx_push_site_to`(`to_site_id_` ASC) USING BTREE,
  INDEX `idx_push_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_push_article_from` FOREIGN KEY (`from_article_id_`) REFERENCES `ujcms_article` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_push_article_to` FOREIGN KEY (`to_article_id_`) REFERENCES `ujcms_article` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_push_site_from` FOREIGN KEY (`from_site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_push_site_to` FOREIGN KEY (`to_site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_push_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '推送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_push
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_role
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_role`;
CREATE TABLE `ujcms_role`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NULL DEFAULT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `permission_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '功能权限',
  `grant_permission_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '授权权限',
  `global_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `all_article_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `data_scope_` smallint NOT NULL DEFAULT 1 COMMENT '数据权限范围(1:所有,2:本组织,3:自身)',
  `rank_` smallint NOT NULL DEFAULT 32767 COMMENT '等级',
  `type_` smallint NOT NULL DEFAULT 4 COMMENT '类型(1:系统管理员,2:安全管理员,3:审计管理员,4:常规角色)',
  `scope_` smallint NOT NULL DEFAULT 0 COMMENT '共享范围(0:本站私有,1:子站点共享,2:全局共享)',
  `order_` int NOT NULL DEFAULT 999999,
  `all_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `all_grant_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `all_channel_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `all_status_permission_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '所有状态权限',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_role_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_role_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_role
-- ----------------------------
INSERT INTO `ujcms_role` VALUES (1, 1, '管理角色', NULL, NULL, NULL, '1', '1', 1, 1, 4, 0, 1, '1', '1', '1', '0');

-- ----------------------------
-- Table structure for ujcms_role_article
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_role_article`;
CREATE TABLE `ujcms_role_article`  (
  `role_id_` bigint NOT NULL,
  `channel_id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  PRIMARY KEY (`role_id_`, `channel_id_`) USING BTREE,
  INDEX `idx_rolearticle_composite`(`channel_id_` ASC, `role_id_` ASC) USING BTREE,
  INDEX `idx_rolearticle_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_rolearticle_channel` FOREIGN KEY (`channel_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rolearticle_role` FOREIGN KEY (`role_id_`) REFERENCES `ujcms_role` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rolearticle_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色文章权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_role_article
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_role_channel
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_role_channel`;
CREATE TABLE `ujcms_role_channel`  (
  `role_id_` bigint NOT NULL,
  `channel_id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  PRIMARY KEY (`role_id_`, `channel_id_`) USING BTREE,
  INDEX `idx_rolechanel_composite`(`channel_id_` ASC, `role_id_` ASC) USING BTREE,
  INDEX `idx_rolechannel_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_rolechannel_channel` FOREIGN KEY (`channel_id_`) REFERENCES `ujcms_channel` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rolechannel_role` FOREIGN KEY (`role_id_`) REFERENCES `ujcms_role` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rolechannel_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色栏目权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_role_channel
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_role_org
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_role_org`;
CREATE TABLE `ujcms_role_org`  (
  `role_id_` bigint NOT NULL,
  `org_id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  PRIMARY KEY (`role_id_`, `org_id_`) USING BTREE,
  INDEX `idx_roleorg_composite`(`org_id_` ASC, `role_id_` ASC) USING BTREE,
  INDEX `idx_roleorg_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_roleorg_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_roleorg_role` FOREIGN KEY (`role_id_`) REFERENCES `ujcms_role` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_roleorg_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色组织权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_role_org
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_sensitive_word`;
CREATE TABLE `ujcms_sensitive_word`  (
  `id_` bigint NOT NULL,
  `name_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '敏感词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_sensitive_word
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_seq
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_seq`;
CREATE TABLE `ujcms_seq`  (
  `name_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `next_val_` bigint NOT NULL DEFAULT 1 COMMENT '下一个值',
  `cache_size_` int NOT NULL DEFAULT 0 COMMENT '缓存数量(大于0时有效，等于0则由程序确定大小)',
  PRIMARY KEY (`name_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主键序列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_seq
-- ----------------------------
INSERT INTO `ujcms_seq` VALUES ('article', 305, 0);
INSERT INTO `ujcms_seq` VALUES ('article_custom', 448, 0);
INSERT INTO `ujcms_seq` VALUES ('article_file', 3, 0);
INSERT INTO `ujcms_seq` VALUES ('article_image', 27, 0);
INSERT INTO `ujcms_seq` VALUES ('attachment', 847, 0);
INSERT INTO `ujcms_seq` VALUES ('attachment_refer', 424, 0);
INSERT INTO `ujcms_seq` VALUES ('block', 3, 0);
INSERT INTO `ujcms_seq` VALUES ('block_item', 8, 0);
INSERT INTO `ujcms_seq` VALUES ('channel', 139, 0);
INSERT INTO `ujcms_seq` VALUES ('channel_custom', 1, 0);
INSERT INTO `ujcms_seq` VALUES ('dict', 619, 0);
INSERT INTO `ujcms_seq` VALUES ('dict_type', 112, 0);
INSERT INTO `ujcms_seq` VALUES ('group', 11, 0);
INSERT INTO `ujcms_seq` VALUES ('login_log', 2601, 0);
INSERT INTO `ujcms_seq` VALUES ('model', 22, 0);
INSERT INTO `ujcms_seq` VALUES ('operation_log', 901, 0);
INSERT INTO `ujcms_seq` VALUES ('org', 111, 0);
INSERT INTO `ujcms_seq` VALUES ('role', 3, 0);
INSERT INTO `ujcms_seq` VALUES ('site', 52, 0);
INSERT INTO `ujcms_seq` VALUES ('site_custom', 55, 0);
INSERT INTO `ujcms_seq` VALUES ('storage', 4, 0);
INSERT INTO `ujcms_seq` VALUES ('survey', 101, 0);
INSERT INTO `ujcms_seq` VALUES ('survey_item', 101, 0);
INSERT INTO `ujcms_seq` VALUES ('survey_option', 101, 0);
INSERT INTO `ujcms_seq` VALUES ('tag', 51, 0);
INSERT INTO `ujcms_seq` VALUES ('task', 1051, 0);
INSERT INTO `ujcms_seq` VALUES ('user', 13, 0);
INSERT INTO `ujcms_seq` VALUES ('visit_log', 437, 0);
INSERT INTO `ujcms_seq` VALUES ('visit_page', 5113, 0);
INSERT INTO `ujcms_seq` VALUES ('visit_stat', 3844, 0);
INSERT INTO `ujcms_seq` VALUES ('visit_trend', 1863, 0);
INSERT INTO `ujcms_seq` VALUES ('vote', 51, 0);
INSERT INTO `ujcms_seq` VALUES ('vote_option', 51, 0);

-- ----------------------------
-- Table structure for ujcms_short_message
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_short_message`;
CREATE TABLE `ujcms_short_message`  (
  `id_` bigint NOT NULL,
  `type_` smallint NOT NULL DEFAULT 1 COMMENT '类型(1:手机短信,2:邮件短信)',
  `receiver_` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人(手机号码或邮件地址)',
  `code_` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `send_date_` datetime NOT NULL COMMENT '发送时间',
  `attempts_` int NOT NULL,
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'IP地址',
  `usage_` smallint NOT NULL COMMENT '用途(0:测试,1:注册,2:登录,3:双因子登录,4:找回密码,5:修改手机号码,6:修改邮箱地址)',
  `status_` smallint NOT NULL DEFAULT 0 COMMENT '状态(0:未使用,1:验证正确,2:验证错误,3:已过期)',
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '短信表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_short_message
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_site
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_site`;
CREATE TABLE `ujcms_site`  (
  `id_` bigint NOT NULL,
  `parent_id_` bigint NULL DEFAULT NULL,
  `org_id_` bigint NOT NULL,
  `model_id_` bigint NOT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `protocol_` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '协议(http,https)',
  `domain_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '域名',
  `sub_dir_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子目录',
  `theme_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '主题',
  `mobile_theme_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default' COMMENT '手机端主题',
  `page_size_` smallint NOT NULL DEFAULT 20 COMMENT '每页条数',
  `logo_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'LOGO',
  `seo_title_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords_` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO描述',
  `static_file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '静态页文件',
  `mobile_static_file_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机端静态页文件',
  `watermark_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '水印设置',
  `html_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '静态页设置',
  `depth_` smallint NOT NULL DEFAULT 1 COMMENT '层级',
  `order_` int NOT NULL DEFAULT 999999 COMMENT '排序',
  `status_` smallint NOT NULL DEFAULT 0 COMMENT '状态(0:正常,1:关闭)',
  `message_board_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '留言板设置',
  `editor_settings_` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编辑器设置',
  `views_` bigint NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `self_views_` bigint NOT NULL DEFAULT 0 COMMENT '首页浏览次数',
  `today_views_` int NOT NULL DEFAULT 0 COMMENT '今日浏览次数',
  `yesterday_views_` int NOT NULL DEFAULT 0 COMMENT '昨日浏览次数',
  `max_views_` int NOT NULL DEFAULT 0 COMMENT '最高浏览次数',
  `max_date_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最高浏览日期',
  `mains_json_` json NULL COMMENT '自定义主字段JSON',
  `clobs_json_` json NULL COMMENT '自定义大字段JSON',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_site_model`(`model_id_` ASC) USING BTREE,
  INDEX `idx_site_order`(`order_` ASC) USING BTREE,
  INDEX `idx_site_org`(`org_id_` ASC) USING BTREE,
  INDEX `idx_site_parent`(`parent_id_` ASC) USING BTREE,
  CONSTRAINT `fk_site_model` FOREIGN KEY (`model_id_`) REFERENCES `ujcms_model` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_site_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_site_parent` FOREIGN KEY (`parent_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '站点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_site
-- ----------------------------
INSERT INTO `ujcms_site` VALUES (1, NULL, 1, 13, 'UJCMS演示站', 'http', 'localhost', NULL, '/1/default', '/1/default', 10, NULL, NULL, NULL, NULL, '/index.html', NULL, '{\"enabled\":false,\"overlay\":null,\"position\":9,\"dissolve\":50,\"minWidth\":300,\"minHeight\":300}', '{\"enabled\":false,\"auto\":true,\"listPages\":1,\"channel\":\"/channels/{channel_alias}/index\",\"article\":\"/articles/{article_id}\"}', 1, 1, 0, '{\"enabled\":true,\"loginRequired\":true}', NULL, 330, 282, 0, 0, 132, '2024-07-17 00:00:00', '{\"icp\": \"赣ICP备12001124号\", \"company\": \"南昌蓝智科技有限公司\"}', NULL);

-- ----------------------------
-- Table structure for ujcms_site_tree
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_site_tree`;
CREATE TABLE `ujcms_site_tree`  (
  `ancestor_id_` bigint NOT NULL,
  `descendant_id_` bigint NOT NULL,
  PRIMARY KEY (`ancestor_id_`, `descendant_id_`) USING BTREE,
  INDEX `idx_sitetree_composite`(`descendant_id_` ASC, `ancestor_id_` ASC) USING BTREE,
  CONSTRAINT `fk_sitetree_ancestor` FOREIGN KEY (`ancestor_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sitetree_descendant` FOREIGN KEY (`descendant_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '站点树形结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_site_tree
-- ----------------------------
INSERT INTO `ujcms_site_tree` VALUES (1, 1);

-- ----------------------------
-- Table structure for ujcms_survey
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_survey`;
CREATE TABLE `ujcms_survey`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `title_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `begin_date_` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `end_date_` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `mode_` smallint NOT NULL DEFAULT 1 COMMENT '模式(1:独立访客,2:独立IP,3:独立用户)',
  `times_` int NOT NULL DEFAULT 0 COMMENT '参与人次',
  `interval_` int NOT NULL DEFAULT 0 COMMENT '重复问答间隔天数(0:不可重复问答)',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  `order_` bigint NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_survey_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_survey_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调查问卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_survey
-- ----------------------------
INSERT INTO `ujcms_survey` VALUES (1, 1, '用户体验及满意度调查', NULL, NULL, NULL, '2023-08-08 16:49:25', 1, 0, 0, '1', 1);
INSERT INTO `ujcms_survey` VALUES (51, 1, '南方供暖已成各界共识，你对江西供暖怎么看？', '近年来，每逢供暖期，呼吁“南方集中供暖”的话题都会成为热点。清华大学建筑节能研究中心的调研报告显示，并非所有南方城市有供暖需求，真正需要的是国家划定的“夏热冬冷”地区，包括上海、重庆、湖北、湖南、安徽、江西、江苏、浙江、四川等。这些省份冬季室温远低于北方城市集中供热时的室内温度。你对江西供暖怎么看？', NULL, NULL, '2023-08-08 16:56:07', 1, 0, 0, '1', 51);

-- ----------------------------
-- Table structure for ujcms_survey_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_survey_feedback`;
CREATE TABLE `ujcms_survey_feedback`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `survey_id_` bigint NOT NULL,
  `user_id_` bigint NULL DEFAULT NULL,
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `cookie_` bigint NULL DEFAULT NULL COMMENT 'Cookie',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_surveyfeedback_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_surveyfeedback_survey`(`survey_id_` ASC) USING BTREE,
  INDEX `idx_surveyfeedback_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_surveyfeedback_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyfeedback_survey` FOREIGN KEY (`survey_id_`) REFERENCES `ujcms_survey` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyfeedback_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调查问卷反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_survey_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_survey_item
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_survey_item`;
CREATE TABLE `ujcms_survey_item`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `survey_id_` bigint NOT NULL,
  `title_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `order_` int NOT NULL DEFAULT 999999 COMMENT '排序',
  `multiple_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否多选',
  `essay_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否问答',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_surveyitem_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_surveyitem_survey`(`survey_id_` ASC) USING BTREE,
  CONSTRAINT `fk_surveyitem_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyitem_survey` FOREIGN KEY (`survey_id_`) REFERENCES `ujcms_survey` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调查问卷条目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_survey_item
-- ----------------------------
INSERT INTO `ujcms_survey_item` VALUES (1, 1, 1, '您是通过什么渠道知道本站的？', 1, '0', '0');
INSERT INTO `ujcms_survey_item` VALUES (2, 1, 1, '您最希望增加的功能是什么？', 2, '1', '0');
INSERT INTO `ujcms_survey_item` VALUES (51, 1, 51, '你支持江西供暖吗？', 1, '0', '0');
INSERT INTO `ujcms_survey_item` VALUES (52, 1, 51, '你觉得“集中供暖”和“分散供暖”哪个模式比较好？', 2, '0', '0');
INSERT INTO `ujcms_survey_item` VALUES (53, 1, 51, '如果采取供暖，你比较担心以下哪些问题？', 3, '1', '0');
INSERT INTO `ujcms_survey_item` VALUES (54, 1, 51, '您有什么建议？', 4, '0', '1');

-- ----------------------------
-- Table structure for ujcms_survey_item_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_survey_item_feedback`;
CREATE TABLE `ujcms_survey_item_feedback`  (
  `id_` bigint NOT NULL,
  `survey_item_id_` bigint NOT NULL,
  `survey_feedback_id_` bigint NOT NULL,
  `survey_id_` bigint NOT NULL,
  `answer_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回答',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_surveyitemfeed_feed`(`survey_feedback_id_` ASC) USING BTREE,
  INDEX `idx_surveyitemfeed_item`(`survey_item_id_` ASC) USING BTREE,
  INDEX `idx_surveyitemfeed_survey`(`survey_id_` ASC) USING BTREE,
  CONSTRAINT `fk_surveyitemfeed_feed` FOREIGN KEY (`survey_feedback_id_`) REFERENCES `ujcms_survey_feedback` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyitemfeed_item` FOREIGN KEY (`survey_item_id_`) REFERENCES `ujcms_survey_item` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyitemfeed_survey` FOREIGN KEY (`survey_id_`) REFERENCES `ujcms_survey` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调查问卷条目与调查反馈关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_survey_item_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_survey_option
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_survey_option`;
CREATE TABLE `ujcms_survey_option`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `survey_id_` bigint NOT NULL,
  `item_id_` bigint NOT NULL,
  `title_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `count_` int NOT NULL DEFAULT 0 COMMENT '得票数',
  `order_` int NOT NULL DEFAULT 999999 COMMENT '排序',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_surveyoption_item`(`item_id_` ASC) USING BTREE,
  INDEX `idx_surveyoption_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_surveyoption_survey`(`survey_id_` ASC) USING BTREE,
  CONSTRAINT `fk_surveyoption_item` FOREIGN KEY (`item_id_`) REFERENCES `ujcms_survey_item` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyoption_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyoption_survey` FOREIGN KEY (`survey_id_`) REFERENCES `ujcms_survey` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调查问卷选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_survey_option
-- ----------------------------
INSERT INTO `ujcms_survey_option` VALUES (1, 1, 1, 1, '朋友推荐', 0, 1);
INSERT INTO `ujcms_survey_option` VALUES (2, 1, 1, 1, '网络平台', 0, 2);
INSERT INTO `ujcms_survey_option` VALUES (3, 1, 1, 1, '搜索引擎', 0, 3);
INSERT INTO `ujcms_survey_option` VALUES (4, 1, 1, 1, '其他', 0, 4);
INSERT INTO `ujcms_survey_option` VALUES (5, 1, 1, 2, '自定义表单', 0, 1);
INSERT INTO `ujcms_survey_option` VALUES (6, 1, 1, 2, '可视化专题', 0, 2);
INSERT INTO `ujcms_survey_option` VALUES (7, 1, 1, 2, '拖拽式页面设计', 0, 3);
INSERT INTO `ujcms_survey_option` VALUES (8, 1, 1, 2, '微信公众号及小程序功能', 0, 4);
INSERT INTO `ujcms_survey_option` VALUES (9, 1, 1, 2, '购物功能', 0, 5);
INSERT INTO `ujcms_survey_option` VALUES (51, 1, 51, 51, '支持', 0, 1);
INSERT INTO `ujcms_survey_option` VALUES (52, 1, 51, 51, '不支持', 0, 2);
INSERT INTO `ujcms_survey_option` VALUES (53, 1, 51, 51, '无所谓', 0, 3);
INSERT INTO `ujcms_survey_option` VALUES (54, 1, 51, 52, '集中供暖比较好', 0, 1);
INSERT INTO `ujcms_survey_option` VALUES (55, 1, 51, 52, '分散供暖比较好', 0, 2);
INSERT INTO `ujcms_survey_option` VALUES (56, 1, 51, 52, '无所谓', 0, 3);
INSERT INTO `ujcms_survey_option` VALUES (57, 1, 51, 53, '花销', 0, 1);
INSERT INTO `ujcms_survey_option` VALUES (58, 1, 51, 53, '环境污染', 0, 2);
INSERT INTO `ujcms_survey_option` VALUES (59, 1, 51, 53, '冷热不均', 0, 3);
INSERT INTO `ujcms_survey_option` VALUES (60, 1, 51, 53, '生活习惯改变引起身体不适', 0, 4);

-- ----------------------------
-- Table structure for ujcms_survey_option_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_survey_option_feedback`;
CREATE TABLE `ujcms_survey_option_feedback`  (
  `id_` bigint NOT NULL,
  `survey_option_id_` bigint NOT NULL,
  `survey_feedback_id_` bigint NOT NULL,
  `survey_id_` bigint NOT NULL,
  `survey_item_id_` bigint NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_surveyoptionfeed_feed`(`survey_feedback_id_` ASC) USING BTREE,
  INDEX `idx_surveyoptionfeed_item`(`survey_item_id_` ASC) USING BTREE,
  INDEX `idx_surveyoptionfeed_option`(`survey_option_id_` ASC) USING BTREE,
  INDEX `idx_surveyoptionfeed_survey`(`survey_id_` ASC) USING BTREE,
  CONSTRAINT `fk_surveyoptionfeed_feed` FOREIGN KEY (`survey_feedback_id_`) REFERENCES `ujcms_survey_feedback` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyoptionfeed_item` FOREIGN KEY (`survey_item_id_`) REFERENCES `ujcms_survey_item` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyoptionfeed_option` FOREIGN KEY (`survey_option_id_`) REFERENCES `ujcms_survey_option` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_surveyoptionfeed_survey` FOREIGN KEY (`survey_id_`) REFERENCES `ujcms_survey` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调查问卷选项与调查反馈关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_survey_option_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_tag
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_tag`;
CREATE TABLE `ujcms_tag`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `created_` datetime NOT NULL COMMENT '创建时间',
  `refers_` int NOT NULL DEFAULT 0 COMMENT '引用数量',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_tag_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_tag_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_tag_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tag_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Tag标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_tag
-- ----------------------------
INSERT INTO `ujcms_tag` VALUES (1, 1, 1, '智利', NULL, '2023-04-05 22:04:47', 2);
INSERT INTO `ujcms_tag` VALUES (2, 1, 1, '阿富汗', NULL, '2023-04-05 22:05:06', 1);

-- ----------------------------
-- Table structure for ujcms_task
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_task`;
CREATE TABLE `ujcms_task`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `begin_date_` datetime NOT NULL COMMENT '开始时间',
  `end_date_` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `current_` int NOT NULL DEFAULT 0 COMMENT '已完成数量',
  `total_` int NOT NULL DEFAULT 0 COMMENT '总数量',
  `type_` smallint NOT NULL COMMENT '类型(1:HTML生成,2:全文索引生成)',
  `status_` smallint NOT NULL DEFAULT 0 COMMENT '状态(0:等待,1:运行中,2:出错,3:停止,4:完成)',
  `error_info_` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_task_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_task_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_task_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_task_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_task
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_user
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_user`;
CREATE TABLE `ujcms_user`  (
  `id_` bigint NOT NULL,
  `group_id_` bigint NOT NULL,
  `org_id_` bigint NOT NULL,
  `username_` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password_` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `mobile_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `alias_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客地址',
  `avatar_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  `password_modified_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '密码修改时间',
  `rank_` smallint NOT NULL DEFAULT 999 COMMENT '等级',
  `type_` smallint NOT NULL DEFAULT 4 COMMENT '类型(1:系统管理员,2:安全管理员,3:审计管理员,4:常规管理员,5:前台会员)',
  `status_` smallint NOT NULL DEFAULT 0 COMMENT '状态(0:正常,1:未激活,2:已锁定,3:已注销)',
  `nickname_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `real_name_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `gender_` smallint NOT NULL DEFAULT 1 COMMENT '性别(0:保密,1:男,2:女)',
  PRIMARY KEY (`id_`) USING BTREE,
  UNIQUE INDEX `username_`(`username_` ASC) USING BTREE,
  INDEX `idx_user_group`(`group_id_` ASC) USING BTREE,
  INDEX `idx_user_org`(`org_id_` ASC) USING BTREE,
  CONSTRAINT `fk_user_group` FOREIGN KEY (`group_id_`) REFERENCES `ujcms_group` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_user
-- ----------------------------
INSERT INTO `ujcms_user` VALUES (0, 1, 0, 'anonymous', NULL, NULL, NULL, NULL, NULL, '2022-07-11 12:53:23', 0, 5, 2, NULL, NULL, 1);
INSERT INTO `ujcms_user` VALUES (1, 8, 1, 'admin', '{pbkdf2}7euTirRqXJY4sGnMuRs40jQvTDoDkowa6/XIj4tx/rr7gnJvI9SedA==', NULL, NULL, NULL, NULL, '2023-01-07 22:49:02', 0, 4, 0, NULL, NULL, 1);

-- ----------------------------
-- Table structure for ujcms_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_user_ext`;
CREATE TABLE `ujcms_user_ext`  (
  `id_` bigint NOT NULL,
  `birthday_` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `location_` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住地',
  `bio_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `created_` datetime NOT NULL COMMENT '创建日期',
  `history_password_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '历史密码(70*24)',
  `login_date_` datetime NOT NULL COMMENT '最后登录日期',
  `login_ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `login_count_` int NOT NULL DEFAULT 0 COMMENT '登录次数',
  `error_date_` datetime NOT NULL COMMENT '登录错误日期',
  `error_count_` int NOT NULL DEFAULT 0 COMMENT '登录错误次数',
  PRIMARY KEY (`id_`) USING BTREE,
  CONSTRAINT `fk_userext_user` FOREIGN KEY (`id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_user_ext
-- ----------------------------
INSERT INTO `ujcms_user_ext` VALUES (0, NULL, NULL, NULL, '2021-03-18 12:25:06', NULL, '2021-03-18 12:25:06', '127.0.0.1', 0, '2021-03-18 12:25:06', 0);
INSERT INTO `ujcms_user_ext` VALUES (1, NULL, NULL, NULL, '2021-03-18 12:25:06', '{pbkdf2}0Knzbc+J3Fkl5/mlJBrwLFOUwOvoBANcrfCgVvrjCSIBjnazXupYVw==,{pbkdf2}SppLnInngz0+Ac1MAPQcsPS0wn2esGxo5u0raXARq/MAzp+r94ybjA==', '2024-09-13 18:10:52', '0:0:0:0:0:0:0:1', 135, '2022-08-24 09:09:32', 0);

-- ----------------------------
-- Table structure for ujcms_user_openid
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_user_openid`;
CREATE TABLE `ujcms_user_openid`  (
  `user_id_` bigint NOT NULL,
  `provider_` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `openid_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'OPEN ID',
  `avatar_url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  `large_avatar_url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '大头像URL',
  `nickname_` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender_` smallint NOT NULL DEFAULT 1 COMMENT '性别(0:保密,1:男,2:女)',
  PRIMARY KEY (`user_id_`, `provider_`) USING BTREE,
  CONSTRAINT `fk_useropenid_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户OpenID表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_user_openid
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_user_org
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_user_org`;
CREATE TABLE `ujcms_user_org`  (
  `user_id_` bigint NOT NULL,
  `org_id_` bigint NOT NULL,
  `order_` int NOT NULL DEFAULT 999999 COMMENT '组织排序',
  PRIMARY KEY (`user_id_`, `org_id_`) USING BTREE,
  INDEX `idx_userorg_composite`(`org_id_` ASC, `user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_userorg_org` FOREIGN KEY (`org_id_`) REFERENCES `ujcms_org` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_userorg_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户扩展组织关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_user_org
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_user_role`;
CREATE TABLE `ujcms_user_role`  (
  `user_id_` bigint NOT NULL,
  `role_id_` bigint NOT NULL,
  `order_` int NOT NULL DEFAULT 999999,
  PRIMARY KEY (`user_id_`, `role_id_`) USING BTREE,
  INDEX `idx_userrole_composite`(`role_id_` ASC, `user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_userrole_role` FOREIGN KEY (`role_id_`) REFERENCES `ujcms_role` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_userrole_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_user_role
-- ----------------------------
INSERT INTO `ujcms_user_role` VALUES (1, 1, 9999);

-- ----------------------------
-- Table structure for ujcms_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_visit_log`;
CREATE TABLE `ujcms_visit_log`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `user_id_` bigint NOT NULL,
  `url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'URL地址',
  `entry_url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入口URL地址',
  `source_` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '来源',
  `country_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '国家',
  `province_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '省份',
  `device_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备',
  `os_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作系统',
  `browser_` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浏览器',
  `user_agent_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
  `count_` int NOT NULL DEFAULT 0 COMMENT '访问次数',
  `si_` bigint NOT NULL DEFAULT 0 COMMENT '会话标识',
  `uv_` bigint NOT NULL DEFAULT 0 COMMENT '访客标识',
  `ip_` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'IP地址',
  `date_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '访问日期',
  `duration_` int NOT NULL DEFAULT 0 COMMENT '访问时长',
  `new_visitor_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否新访客',
  `source_type_` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DIRECT' COMMENT '来源类型(DIRECT:直接访问,INNER:内部链接,OUTER:外部链接,SEARCH:搜索引擎)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_visit_log_site`(`site_id_` ASC) USING BTREE,
  INDEX `idx_visit_log_user`(`user_id_` ASC) USING BTREE,
  CONSTRAINT `fk_visit_log_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_visit_log_user` FOREIGN KEY (`user_id_`) REFERENCES `ujcms_user` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问_日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_visit_log
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_visit_page
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_visit_page`;
CREATE TABLE `ujcms_visit_page`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `url_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '受访URL',
  `pv_count_` bigint NOT NULL DEFAULT 0 COMMENT '访问量',
  `uv_count_` bigint NOT NULL DEFAULT 0 COMMENT '访客数',
  `ip_count_` bigint NOT NULL DEFAULT 0 COMMENT 'IP数',
  `date_string_` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '统计日期(yyyyMMdd)',
  `type_` smallint NOT NULL DEFAULT 1 COMMENT '类型(1:访问地址,2:入口地址)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_visit_page_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_visit_page_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问_受访页面表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_visit_page
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_visit_stat
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_visit_stat`;
CREATE TABLE `ujcms_visit_stat`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `name_` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `pv_count_` bigint NOT NULL DEFAULT 0 COMMENT '访问量',
  `uv_count_` bigint NOT NULL DEFAULT 0 COMMENT '访客数',
  `ip_count_` bigint NOT NULL DEFAULT 0 COMMENT 'IP数',
  `nv_count_` bigint NOT NULL DEFAULT 0 COMMENT '新访客数',
  `bounce_count_` int NOT NULL DEFAULT 0 COMMENT '跳出数',
  `duration_` int NOT NULL DEFAULT 0 COMMENT '访问时长',
  `date_string_` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '统计日期(yyyyMMdd)',
  `type_` smallint NOT NULL DEFAULT 1 COMMENT '统计类型(1:新老客户,2:来源,3:国家,4:省份,5:设备,6:操作系统,7:浏览器)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_visit_stat_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_visit_stat_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问_统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_visit_stat
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_visit_trend
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_visit_trend`;
CREATE TABLE `ujcms_visit_trend`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `pv_count_` bigint NOT NULL DEFAULT 0 COMMENT '访问量',
  `uv_count_` bigint NOT NULL DEFAULT 0 COMMENT '访客数',
  `ip_count_` bigint NOT NULL DEFAULT 0 COMMENT 'IP数',
  `nv_count_` bigint NOT NULL DEFAULT 0 COMMENT '新访客数',
  `bounce_count_` int NOT NULL DEFAULT 0 COMMENT '跳出数',
  `duration_` int NOT NULL DEFAULT 0 COMMENT '访问时长',
  `date_string_` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '统计日期(yyyyMMddHHmm)',
  `period_` smallint NOT NULL DEFAULT 1 COMMENT '统计周期(1:分,2:时,3:日,4:月)',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_visit_trend_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_visit_trend_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问_趋势表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_visit_trend
-- ----------------------------

-- ----------------------------
-- Table structure for ujcms_vote
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_vote`;
CREATE TABLE `ujcms_vote`  (
  `id_` bigint NOT NULL,
  `site_id_` bigint NOT NULL,
  `title_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `description_` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `begin_date_` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `end_date_` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `created_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `interval_` int NOT NULL DEFAULT 0 COMMENT '重复投票间隔天数(0:不可重复投票)',
  `times_` int NOT NULL DEFAULT 0 COMMENT '参与人次',
  `mode_` smallint NOT NULL DEFAULT 1 COMMENT '模式(1:独立访客,2:独立IP,3:独立用户)',
  `multiple_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否多选',
  `enabled_` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  `order_` bigint NOT NULL,
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_vote_site`(`site_id_` ASC) USING BTREE,
  CONSTRAINT `fk_vote_site` FOREIGN KEY (`site_id_`) REFERENCES `ujcms_site` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投票表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_vote
-- ----------------------------
INSERT INTO `ujcms_vote` VALUES (1, 1, '您从哪里知道本网站的', NULL, NULL, NULL, '2023-08-08 16:45:07', 0, 1, 1, '0', '1', 1);

-- ----------------------------
-- Table structure for ujcms_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `ujcms_vote_option`;
CREATE TABLE `ujcms_vote_option`  (
  `id_` bigint NOT NULL,
  `vote_id_` bigint NOT NULL,
  `title_` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `count_` int NOT NULL DEFAULT 0 COMMENT '得票数',
  `order_` int NOT NULL DEFAULT 999999 COMMENT '排序',
  PRIMARY KEY (`id_`) USING BTREE,
  INDEX `idx_voteoption_vote`(`vote_id_` ASC) USING BTREE,
  CONSTRAINT `fk_voteoption_vote` FOREIGN KEY (`vote_id_`) REFERENCES `ujcms_vote` (`id_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投票选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ujcms_vote_option
-- ----------------------------
INSERT INTO `ujcms_vote_option` VALUES (1, 1, '朋友或同事介绍的', 0, 1);
INSERT INTO `ujcms_vote_option` VALUES (2, 1, '在技术网站中看到', 1, 2);
INSERT INTO `ujcms_vote_option` VALUES (3, 1, '通过搜索引擎', 0, 3);
INSERT INTO `ujcms_vote_option` VALUES (4, 1, '其它途径', 0, 4);

SET FOREIGN_KEY_CHECKS = 1;
