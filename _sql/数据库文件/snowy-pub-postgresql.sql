/*
 Navicat Premium Data Transfer

 Source Server         : pgsql本地数据库
 Source Server Type    : PostgreSQL
 Source Server Version : 130002
 Source Host           : localhost:5432
 Source Catalog        : snowy-pub-postgresql
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130002
 File Encoding         : 65001

 Date: 15/04/2021 16:58:26
*/


-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_app";
CREATE TABLE "public"."sys_app" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "active" varchar(1) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_app"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_app"."name" IS '应用名称';
COMMENT ON COLUMN "public"."sys_app"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_app"."active" IS '是否默认激活（Y-是，N-否）';
COMMENT ON COLUMN "public"."sys_app"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_app"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_app"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_app"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_app"."update_user" IS '修改人';
COMMENT ON TABLE "public"."sys_app" IS '系统应用表';

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO "public"."sys_app" VALUES (1265476890672672821, '系统应用', 'system', 'Y', 0, '2020-03-25 19:07:00', 1265476890672672808, '2020-08-15 15:23:05', 1280709549107552257);
INSERT INTO "public"."sys_app" VALUES (1265476890672672822, '业务应用', 'business', 'N', 2, '2020-03-26 08:40:33', 1265476890672672808, '2020-09-23 22:00:01', 1265476890672672808);
INSERT INTO "public"."sys_app" VALUES (1342445032647098369, '系统工具', 'system_tool', 'N', 0, '2020-12-25 20:20:12', 1265476890672672808, NULL, NULL);

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_area";
CREATE TABLE "public"."sys_area" (
  "id" int8 NOT NULL,
  "level_code" int2,
  "parent_code" varchar(20) COLLATE "pg_catalog"."default",
  "area_code" varchar(20) COLLATE "pg_catalog"."default",
  "zip_code" varchar(6) COLLATE "pg_catalog"."default",
  "city_code" varchar(6) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "short_name" varchar(50) COLLATE "pg_catalog"."default",
  "merger_name" varchar(50) COLLATE "pg_catalog"."default",
  "pinyin" varchar(30) COLLATE "pg_catalog"."default",
  "lng" numeric(10,6),
  "lat" numeric(10,6)
)
;
COMMENT ON COLUMN "public"."sys_area"."level_code" IS '层级';
COMMENT ON COLUMN "public"."sys_area"."parent_code" IS '父级行政代码';
COMMENT ON COLUMN "public"."sys_area"."area_code" IS '行政代码';
COMMENT ON COLUMN "public"."sys_area"."zip_code" IS '邮政编码';
COMMENT ON COLUMN "public"."sys_area"."city_code" IS '区号';
COMMENT ON COLUMN "public"."sys_area"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_area"."short_name" IS '简称';
COMMENT ON COLUMN "public"."sys_area"."merger_name" IS '组合名';
COMMENT ON COLUMN "public"."sys_area"."pinyin" IS '拼音';
COMMENT ON COLUMN "public"."sys_area"."lng" IS '经度';
COMMENT ON COLUMN "public"."sys_area"."lat" IS '纬度';
COMMENT ON TABLE "public"."sys_area" IS '中国行政地区表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------

-- ----------------------------
-- Table structure for sys_code_generate
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_code_generate";
CREATE TABLE "public"."sys_code_generate" (
  "id" int8 NOT NULL,
  "author_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "class_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "table_prefix" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "generate_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "table_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "package_name" varchar(255) COLLATE "pg_catalog"."default",
  "bus_name" varchar(255) COLLATE "pg_catalog"."default",
  "table_comment" varchar(255) COLLATE "pg_catalog"."default",
  "create_user" int8,
  "create_time" timestamp(6),
  "update_user" int8,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_code_generate"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_code_generate"."author_name" IS '作者姓名';
COMMENT ON COLUMN "public"."sys_code_generate"."class_name" IS '类名';
COMMENT ON COLUMN "public"."sys_code_generate"."table_prefix" IS '是否移除表前缀';
COMMENT ON COLUMN "public"."sys_code_generate"."generate_type" IS '生成位置类型';
COMMENT ON COLUMN "public"."sys_code_generate"."table_name" IS '数据库表名';
COMMENT ON COLUMN "public"."sys_code_generate"."package_name" IS '包名称';
COMMENT ON COLUMN "public"."sys_code_generate"."bus_name" IS '业务名';
COMMENT ON COLUMN "public"."sys_code_generate"."table_comment" IS '功能名';
COMMENT ON COLUMN "public"."sys_code_generate"."app_code" IS '所属应用';
COMMENT ON COLUMN "public"."sys_code_generate"."menu_pid" IS '菜单上级';
COMMENT ON COLUMN "public"."sys_code_generate"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_code_generate"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_code_generate"."update_user" IS '更新人';
COMMENT ON COLUMN "public"."sys_code_generate"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."sys_code_generate" IS '代码生成基础配置';

-- ----------------------------
-- Records of sys_code_generate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_code_generate_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_code_generate_config";
CREATE TABLE "public"."sys_code_generate_config" (
  "id" int8 NOT NULL,
  "code_gen_id" int8,
  "column_name" varchar(255) COLLATE "pg_catalog"."default",
  "java_name" varchar(255) COLLATE "pg_catalog"."default",
  "data_type" varchar(255) COLLATE "pg_catalog"."default",
  "column_comment" varchar(255) COLLATE "pg_catalog"."default",
  "java_type" varchar(255) COLLATE "pg_catalog"."default",
  "effect_type" varchar(255) COLLATE "pg_catalog"."default",
  "dict_type_code" varchar(255) COLLATE "pg_catalog"."default",
  "whether_table" varchar(255) COLLATE "pg_catalog"."default",
  "whether_add_update" varchar(255) COLLATE "pg_catalog"."default",
  "whether_retract" varchar(255) COLLATE "pg_catalog"."default",
  "whether_required" varchar(255) COLLATE "pg_catalog"."default",
  "query_whether" varchar(255) COLLATE "pg_catalog"."default",
  "query_type" varchar(255) COLLATE "pg_catalog"."default",
  "column_key" varchar(255) COLLATE "pg_catalog"."default",
  "column_key_name" varchar(255) COLLATE "pg_catalog"."default",
  "whether_common" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_code_generate_config"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_code_generate_config"."code_gen_id" IS '代码生成主表ID';
COMMENT ON COLUMN "public"."sys_code_generate_config"."column_name" IS '数据库字段名';
COMMENT ON COLUMN "public"."sys_code_generate_config"."java_name" IS 'java类字段名';
COMMENT ON COLUMN "public"."sys_code_generate_config"."data_type" IS '物理类型';
COMMENT ON COLUMN "public"."sys_code_generate_config"."column_comment" IS '字段描述';
COMMENT ON COLUMN "public"."sys_code_generate_config"."java_type" IS 'java类型';
COMMENT ON COLUMN "public"."sys_code_generate_config"."effect_type" IS '作用类型（字典）';
COMMENT ON COLUMN "public"."sys_code_generate_config"."dict_type_code" IS '字典code';
COMMENT ON COLUMN "public"."sys_code_generate_config"."whether_table" IS '列表展示';
COMMENT ON COLUMN "public"."sys_code_generate_config"."whether_add_update" IS '增改';
COMMENT ON COLUMN "public"."sys_code_generate_config"."whether_retract" IS '列表是否缩进（字典）';
COMMENT ON COLUMN "public"."sys_code_generate_config"."whether_required" IS '是否必填（字典）';
COMMENT ON COLUMN "public"."sys_code_generate_config"."query_whether" IS '是否是查询条件';
COMMENT ON COLUMN "public"."sys_code_generate_config"."query_type" IS '查询方式';
COMMENT ON COLUMN "public"."sys_code_generate_config"."column_key" IS '主键';
COMMENT ON COLUMN "public"."sys_code_generate_config"."column_key_name" IS '主外键名称';
COMMENT ON COLUMN "public"."sys_code_generate_config"."whether_common" IS '是否是通用字段';
COMMENT ON COLUMN "public"."sys_code_generate_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_code_generate_config"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_code_generate_config"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_code_generate_config"."update_user" IS '修改人';
COMMENT ON TABLE "public"."sys_code_generate_config" IS '代码生成详细配置';

-- ----------------------------
-- Records of sys_code_generate_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sys_flag" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "group_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_config"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_config"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_config"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_config"."value" IS '值';
COMMENT ON COLUMN "public"."sys_config"."sys_flag" IS '是否是系统参数（Y-是，N-否）';
COMMENT ON COLUMN "public"."sys_config"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_config"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_config"."group_code" IS '常量所属分类的编码，来自于“常量的分类”字典';
COMMENT ON COLUMN "public"."sys_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_config"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_config"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_config" IS '系统参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO "public"."sys_config" VALUES (1265117443880853506, 'jwt密钥', 'SNOWY_JWT_SECRET', 'snowy', 'Y', '（重要）jwt密钥，默认为空，自行设置', 0, 'DEFAULT', '2020-05-26 06:35:19', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1265117443880853507, '默认密码', 'SNOWY_DEFAULT_PASSWORD', '123456', 'Y', '默认密码', 0, 'DEFAULT', '2020-05-26 06:37:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1265117443880853508, 'token过期时间', 'SNOWY_TOKEN_EXPIRE', '86400', 'Y', 'token过期时间（单位：秒）', 0, 'DEFAULT', '2020-05-27 11:54:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1265117443880853509, 'session会话过期时间', 'SNOWY_SESSION_EXPIRE', '7200', 'Y', 'session会话过期时间（单位：秒）', 0, 'DEFAULT', '2020-05-27 11:54:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1265117443880853519, '阿里云短信keyId', 'SNOWY_ALIYUN_SMS_ACCESSKEY_ID', '你的keyId', 'Y', '阿里云短信keyId', 0, 'ALIYUN_SMS', '2020-06-07 16:27:11', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269547042242371585, '阿里云短信secret', 'SNOWY_ALIYUN_SMS_ACCESSKEY_SECRET', '你的secret', 'Y', '阿里云短信secret', 0, 'ALIYUN_SMS', '2020-06-07 16:29:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269547130041737217, '阿里云短信签名', 'SNOWY_ALIYUN_SMS_SIGN_NAME', 'Snowy快速开发平台', 'Y', '阿里云短信签名', 0, 'ALIYUN_SMS', '2020-06-07 16:29:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269547279530926081, '阿里云短信-登录模板号', 'SNOWY_ALIYUN_SMS_LOGIN_TEMPLATE_CODE', 'SMS_1877123456', 'Y', '阿里云短信-登录模板号', 0, 'ALIYUN_SMS', '2020-06-07 16:30:33', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269547410879750145, '阿里云短信默认失效时间', 'SNOWY_ALIYUN_SMS_INVALIDATE_MINUTES', '5', 'Y', '阿里云短信默认失效时间（单位：分钟）', 0, 'ALIYUN_SMS', '2020-06-07 16:31:04', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269575927357071361, '腾讯云短信secretId', 'SNOWY_TENCENT_SMS_SECRET_ID', '你的secretId', 'Y', '腾讯云短信secretId', 0, 'TENCENT_SMS', '2020-06-07 18:24:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269575991693500418, '腾讯云短信secretKey', 'SNOWY_TENCENT_SMS_SECRET_KEY', '你的secretkey', 'Y', '腾讯云短信secretKey', 0, 'TENCENT_SMS', '2020-06-07 18:24:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269576044084551682, '腾讯云短信sdkAppId', 'SNOWY_TENCENT_SMS_SDK_APP_ID', '1400375123', 'Y', '腾讯云短信sdkAppId', 0, 'TENCENT_SMS', '2020-06-07 18:24:51', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1269576089294954497, '腾讯云短信签名', 'SNOWY_TENCENT_SMS_SIGN', 'Snowy快速开发平台', 'Y', '腾讯云短信签名', 0, 'TENCENT_SMS', '2020-06-07 18:25:02', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270378172860403713, '邮箱host', 'SNOWY_EMAIL_HOST', 'smtp.126.com', 'Y', '邮箱host', 0, 'EMAIL', '2020-06-09 23:32:14', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270378295543795714, '邮箱用户名', 'SNOWY_EMAIL_USERNAME', 'test@126.com', 'Y', '邮箱用户名', 0, 'EMAIL', '2020-06-09 23:32:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270378340510928897, '邮箱密码', 'SNOWY_EMAIL_PASSWORD', '你的邮箱密码', 'Y', '邮箱密码', 0, 'EMAIL', '2020-06-09 23:32:54', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270378527358783489, '邮箱端口', 'SNOWY_EMAIL_PORT', '465', 'Y', '邮箱端口', 0, 'EMAIL', '2020-06-09 23:33:38', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270378790035460097, '邮箱是否开启ssl', 'SNOWY_EMAIL_SSL', 'true', 'Y', '邮箱是否开启ssl', 0, 'EMAIL', '2020-06-09 23:34:41', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270380786649972737, '邮箱发件人', 'SNOWY_EMAIL_FROM', 'test@126.com', 'Y', '邮箱发件人', 0, 'EMAIL', '2020-06-09 23:42:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270380786649972738, 'win本地上传文件路径', 'SNOWY_FILE_UPLOAD_PATH_FOR_WINDOWS', 'd:/tmp', 'Y', 'win本地上传文件路径', 0, 'FILE_PATH', '2020-06-09 23:42:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270380786649972739, 'linux/mac本地上传文件路径', 'SNOWY_FILE_UPLOAD_PATH_FOR_LINUX', '/tmp', 'Y', 'linux/mac本地上传文件路径', 0, 'FILE_PATH', '2020-06-09 23:42:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270380786649982740, 'Snowy演示环境', 'SNOWY_DEMO_ENV_FLAG', 'false', 'Y', 'Snowy演示环境的开关，true-打开，false-关闭，如果演示环境开启，则只能读数据不能写数据', 0, 'DEFAULT', '2020-06-09 23:42:37', 1265476890672672808, '2020-09-03 14:38:17', 1265476890672672808);
INSERT INTO "public"."sys_config" VALUES (1270380786649982741, 'Snowy放开XSS过滤的接口', 'SNOWY_UN_XSS_FILTER_URL', '/demo/xssfilter,/demo/unxss', 'Y', '多个url可以用英文逗号隔开', 0, 'DEFAULT', '2020-06-09 23:42:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270380786649982742, '单用户登陆的开关', 'SNOWY_ENABLE_SINGLE_LOGIN', 'false', 'Y', '单用户登陆的开关，true-打开，false-关闭，如果一个人登录两次，就会将上一次登陆挤下去', 0, 'DEFAULT', '2020-06-09 23:42:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1270380786649982743, '登录验证码的开关', 'SNOWY_CAPTCHA_OPEN', 'true', 'Y', '登录验证码的开关，true-打开，false-关闭', 0, 'DEFAULT', '2020-06-09 23:42:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1280694281648070659, '阿里云定位api接口地址', 'SNOWY_IP_GEO_API', 'http://api01.aliyun.venuscn.com/ip?ip=%s', 'Y', '阿里云定位api接口地址', 0, 'DEFAULT', '2020-07-20 10:44:46', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1280694281648070660, '阿里云定位appCode', 'SNOWY_IP_GEO_APP_CODE', '461535aabeae4f34861884d392f5d452', 'Y', '阿里云定位appCode', 0, 'DEFAULT', '2020-07-20 10:44:46', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1288309751255412737, 'Oauth用户登录的开关', 'SNOWY_ENABLE_OAUTH_LOGIN', 'true', 'Y', 'Oauth用户登录的开关', 0, 'OAUTH', '2020-07-29 11:05:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1288310043346743297, 'Oauth码云登录ClientId', 'SNOWY_OAUTH_GITEE_CLIENT_ID', '你的clientId', 'Y', 'Oauth码云登录ClientId', 0, 'OAUTH', '2020-07-29 11:07:05', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1288310157876408321, 'Oauth码云登录ClientSecret', 'SNOWY_OAUTH_GITEE_CLIENT_SECRET', '你的clientSecret', 'Y', 'Oauth码云登录ClientSecret', 0, 'OAUTH', '2020-07-29 11:07:32', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_config" VALUES (1288310280056483841, 'Oauth码云登录回调地址', 'SNOWY_OAUTH_GITEE_REDIRECT_URI', 'http://localhost:83/oauth/callback/gitee', 'Y', 'Oauth码云登录回调地址', 0, 'OAUTH', '2020-07-29 11:08:01', 1265476890672672808, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_data";
CREATE TABLE "public"."sys_dict_data" (
  "id" int8 NOT NULL,
  "type_id" int8 NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_dict_data"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dict_data"."type_id" IS '字典类型id';
COMMENT ON COLUMN "public"."sys_dict_data"."value" IS '值';
COMMENT ON COLUMN "public"."sys_dict_data"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_dict_data"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_dict_data"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_data"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_dict_data"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_data"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict_data"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_data"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_dict_data" IS '系统字典值表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087357, 1265216211667636234, '男', '1', 100, '男性', 0, '2020-04-01 10:23:29', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087358, 1265216211667636234, '女', '2', 100, '女性', 0, '2020-04-01 10:23:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087359, 1265216211667636234, '未知', '3', 100, '未知性别', 0, '2020-04-01 10:24:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087361, 1265216211667636235, '默认常量', 'DEFAULT', 100, '默认常量，都以SNOWY_开头的', 0, '2020-04-14 23:25:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087363, 1265216211667636235, '阿里云短信', 'ALIYUN_SMS', 100, '阿里云短信配置', 0, '2020-04-14 23:25:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087364, 1265216211667636235, '腾讯云短信', 'TENCENT_SMS', 100, '腾讯云短信', 0, '2020-04-14 23:25:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087365, 1265216211667636235, '邮件配置', 'EMAIL', 100, '邮箱配置', 0, '2020-04-14 23:25:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087366, 1265216211667636235, '文件上传路径', 'FILE_PATH', 100, '文件上传路径', 0, '2020-04-14 23:25:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216536659087367, 1265216211667636235, 'Oauth配置', 'OAUTH', 100, 'Oauth配置', 0, '2020-04-14 23:25:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216617500102656, 1265216211667636226, '正常', '0', 100, '正常', 0, '2020-05-26 17:41:44', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216617500102657, 1265216211667636226, '停用', '1', 100, '停用', 0, '2020-05-26 17:42:03', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265216938389524482, 1265216211667636226, '删除', '2', 100, '删除', 0, '2020-05-26 17:43:19', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265217669028892673, 1265217074079453185, '否', 'N', 100, '否', 0, '2020-05-26 17:46:14', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265217706584690689, 1265217074079453185, '是', 'Y', 100, '是', 0, '2020-05-26 17:46:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265220776437731330, 1265217846770913282, '登录', '1', 100, '登录', 0, '2020-05-26 17:58:34', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265220806070489090, 1265217846770913282, '登出', '2', 100, '登出', 0, '2020-05-26 17:58:41', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265221129564573697, 1265221049302372354, '目录', '0', 100, '目录', 0, '2020-05-26 17:59:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265221163119005697, 1265221049302372354, '菜单', '1', 100, '菜单', 0, '2020-05-26 18:00:07', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265221188091891713, 1265221049302372354, '按钮', '2', 100, '按钮', 0, '2020-05-26 18:00:13', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466389204967426, 1265466149622128641, '未发送', '0', 100, '未发送', 0, '2020-05-27 10:14:33', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466432670539778, 1265466149622128641, '发送成功', '1', 100, '发送成功', 0, '2020-05-27 10:14:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466486097584130, 1265466149622128641, '发送失败', '2', 100, '发送失败', 0, '2020-05-27 10:14:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466530477514754, 1265466149622128641, '失效', '3', 100, '失效', 0, '2020-05-27 10:15:07', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466835009150978, 1265466752209395713, '无', '0', 100, '无', 0, '2020-05-27 10:16:19', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466874758569986, 1265466752209395713, '组件', '1', 100, '组件', 0, '2020-05-27 10:16:29', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466925476093953, 1265466752209395713, '内链', '2', 100, '内链', 0, '2020-05-27 10:16:41', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265466962209808385, 1265466752209395713, '外链', '3', 100, '外链', 0, '2020-05-27 10:16:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265467428423475202, 1265467337566461954, '系统权重', '1', 100, '系统权重', 0, '2020-05-27 10:18:41', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265467503090475009, 1265467337566461954, '业务权重', '2', 100, '业务权重', 0, '2020-05-27 10:18:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468138431062018, 1265468028632571905, '全部数据', '1', 100, '全部数据', 0, '2020-05-27 10:21:30', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468194928336897, 1265468028632571905, '本部门及以下数据', '2', 100, '本部门及以下数据', 0, '2020-05-27 10:21:44', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468241992622082, 1265468028632571905, '本部门数据', '3', 100, '本部门数据', 0, '2020-05-27 10:21:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468273634451457, 1265468028632571905, '仅本人数据', '4', 100, '仅本人数据', 0, '2020-05-27 10:22:02', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468302046666753, 1265468028632571905, '自定义数据', '5', 100, '自定义数据', 0, '2020-05-27 10:22:09', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468508100239362, 1265468437904367618, 'app', '1', 100, 'app', 0, '2020-05-27 10:22:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468543433056258, 1265468437904367618, 'pc', '2', 100, 'pc', 0, '2020-05-27 10:23:07', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1265468576874242050, 1265468437904367618, '其他', '3', 100, '其他', 0, '2020-05-27 10:23:15', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617233011335170, 1275617093517172738, '其它', '0', 100, '其它', 0, '2020-06-24 10:30:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617295355469826, 1275617093517172738, '增加', '1', 100, '增加', 0, '2020-06-24 10:30:38', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617348610547714, 1275617093517172738, '删除', '2', 100, '删除', 0, '2020-06-24 10:30:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617395515449346, 1275617093517172738, '编辑', '3', 100, '编辑', 0, '2020-06-24 10:31:02', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617433612312577, 1275617093517172738, '更新', '4', 100, '更新', 0, '2020-06-24 10:31:11', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617472707420161, 1275617093517172738, '查询', '5', 100, '查询', 0, '2020-06-24 10:31:20', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617502973517826, 1275617093517172738, '详情', '6', 100, '详情', 0, '2020-06-24 10:31:27', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617536959963137, 1275617093517172738, '树', '7', 100, '树', 0, '2020-06-24 10:31:35', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617619524837377, 1275617093517172738, '导入', '8', 100, '导入', 0, '2020-06-24 10:31:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617651816783873, 1275617093517172738, '导出', '9', 100, '导出', 0, '2020-06-24 10:32:03', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617683475390465, 1275617093517172738, '授权', '10', 100, '授权', 0, '2020-06-24 10:32:10', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617709928865793, 1275617093517172738, '强退', '11', 100, '强退', 0, '2020-06-24 10:32:17', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617739091861505, 1275617093517172738, '清空', '12', 100, '清空', 0, '2020-06-24 10:32:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1275617788601425921, 1275617093517172738, '修改状态', '13', 100, '修改状态', 0, '2020-06-24 10:32:35', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1277774590944317441, 1277774529430654977, '阿里云', '1', 100, '阿里云', 0, '2020-06-30 09:22:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1277774666055913474, 1277774529430654977, '腾讯云', '2', 100, '腾讯云', 0, '2020-06-30 09:23:15', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1277774695168577538, 1277774529430654977, 'minio', '3', 100, 'minio', 0, '2020-06-30 09:23:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1277774726835572737, 1277774529430654977, '本地', '4', 100, '本地', 0, '2020-06-30 09:23:29', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278607123583868929, 1278606951432855553, '运行', '1', 100, '运行', 0, '2020-07-02 16:31:08', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278607162943217666, 1278606951432855553, '停止', '2', 100, '停止', 0, '2020-07-02 16:31:18', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278939265862004738, 1278911800547147777, '通知', '1', 100, '通知', 0, '2020-07-03 14:30:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278939319922388994, 1278911800547147777, '公告', '2', 100, '公告', 0, '2020-07-03 14:31:10', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278939399001796609, 1278911952657776642, '草稿', '0', 100, '草稿', 0, '2020-07-03 14:31:29', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278939432686252034, 1278911952657776642, '发布', '1', 100, '发布', 0, '2020-07-03 14:31:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278939458804183041, 1278911952657776642, '撤回', '2', 100, '撤回', 0, '2020-07-03 14:31:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1278939485878415362, 1278911952657776642, '删除', '3', 100, '删除', 0, '2020-07-03 14:31:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1291390260160299009, 1291390159941599233, '是', 'true', 100, '是', 2, '2020-08-06 23:06:46', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1291390315437031426, 1291390159941599233, '否', 'false', 100, '否', 2, '2020-08-06 23:06:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1342446007168466945, 1342445962104864770, '下载压缩包', '1', 100, '下载压缩包', 0, '2020-12-25 20:24:04', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1342446035433881601, 1342445962104864770, '生成到本项目', '2', 100, '生成到本项目', 0, '2020-12-25 20:24:11', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358094655567454210, 1358094419419750401, '输入框', 'input', 100, '输入框', 0, '2021-02-07 00:46:13', 1265476890672672808, '2021-02-08 01:01:28', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358094740510498817, 1358094419419750401, '时间选择', 'datepicker', 100, '时间选择', 0, '2021-02-07 00:46:33', 1265476890672672808, '2021-02-08 01:04:07', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358094793149014017, 1358094419419750401, '下拉框', 'select', 100, '下拉框', 0, '2021-02-07 00:46:46', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358095496009506817, 1358094419419750401, '单选框', 'radio', 100, '单选框', 0, '2021-02-07 00:49:33', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358095673084633090, 1358094419419750401, '开关', 'switch', 100, '开关', 2, '2021-02-07 00:50:15', 1265476890672672808, '2021-02-11 19:07:18', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358458689433190402, 1358457818733428737, '等于', 'eq', 1, '等于', 0, '2021-02-08 00:52:45', 1265476890672672808, '2021-02-13 23:35:36', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358458785168179202, 1358457818733428737, '模糊', 'like', 2, '模糊', 0, '2021-02-08 00:53:08', 1265476890672672808, '2021-02-13 23:35:46', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358460475682406401, 1358094419419750401, '多选框', 'checkbox', 100, '多选框', 0, '2021-02-08 00:59:51', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358460819019743233, 1358094419419750401, '数字输入框', 'inputnumber', 100, '数字输入框', 0, '2021-02-08 01:01:13', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358470210267725826, 1358470065111252994, 'Long', 'Long', 100, 'Long', 0, '2021-02-08 01:38:32', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358470239351029762, 1358470065111252994, 'String', 'String', 100, 'String', 0, '2021-02-08 01:38:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358470265640927233, 1358470065111252994, 'Date', 'Date', 100, 'Date', 0, '2021-02-08 01:38:45', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358470300168437761, 1358470065111252994, 'Integer', 'Integer', 100, 'Integer', 0, '2021-02-08 01:38:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358470697377415169, 1358470065111252994, 'boolean', 'boolean', 100, 'boolean', 0, '2021-02-08 01:40:28', 1265476890672672808, '2021-02-08 01:40:47', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358471133434036226, 1358470065111252994, 'int', 'int', 100, 'int', 0, '2021-02-08 01:42:12', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358471188291338241, 1358470065111252994, 'double', 'double', 100, 'double', 0, '2021-02-08 01:42:25', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1358756511688761346, 1358457818733428737, '大于', 'gt', 3, '大于', 0, '2021-02-08 20:36:12', 1265476890672672808, '2021-02-13 23:45:24', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358756547159990274, 1358457818733428737, '小于', 'lt', 4, '大于', 0, '2021-02-08 20:36:20', 1265476890672672808, '2021-02-13 23:45:29', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358756609990664193, 1358457818733428737, '不等于', 'ne', 7, '不等于', 0, '2021-02-08 20:36:35', 1265476890672672808, '2021-02-13 23:45:46', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358756685030957057, 1358457818733428737, '大于等于', 'ge', 5, '大于等于', 0, '2021-02-08 20:36:53', 1265476890672672808, '2021-02-13 23:45:35', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1358756800525312001, 1358457818733428737, '小于等于', 'le', 6, '小于等于', 0, '2021-02-08 20:37:20', 1265476890672672808, '2021-02-13 23:45:40', 1265476890672672808);
INSERT INTO "public"."sys_dict_data" VALUES (1360529773814083586, 1358094419419750401, '文本域', 'textarea', 100, '文本域', 0, '2021-02-13 18:02:30', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1360606105914732545, 1358457818733428737, '不为空', 'isNotNull', 8, '不为空', 0, '2021-02-13 23:05:49', 1265476890672672808, '2021-02-13 23:45:50', 1265476890672672808);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_dict_type"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_dict_type"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_dict_type"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_dict_type"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_dict_type"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_type"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_type"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict_type"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_type"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_dict_type" IS '系统字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO "public"."sys_dict_type" VALUES (1265216211667636226, '通用状态', 'common_status', 100, '通用状态', 0, '2020-05-26 17:40:26', 1265476890672672808, '2020-06-08 11:31:47', 1265476890672672808);
INSERT INTO "public"."sys_dict_type" VALUES (1265216211667636234, '性别', 'sex', 100, '性别字典', 0, '2020-04-01 10:12:30', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265216211667636235, '常量的分类', 'consts_type', 100, '常量的分类，用于区别一组配置', 0, '2020-04-14 23:24:13', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265217074079453185, '是否', 'yes_or_no', 100, '是否', 0, '2020-05-26 17:43:52', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265217846770913282, '访问类型', 'vis_type', 100, '访问类型', 0, '2020-05-26 17:46:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265221049302372354, '菜单类型', 'menu_type', 100, '菜单类型', 0, '2020-05-26 17:59:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265466149622128641, '发送类型', 'send_type', 100, '发送类型', 0, '2020-05-27 10:13:36', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265466752209395713, '打开方式', 'open_type', 100, '打开方式', 0, '2020-05-27 10:16:00', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265467337566461954, '菜单权重', 'menu_weight', 100, '菜单权重', 0, '2020-05-27 10:18:19', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265468028632571905, '数据范围类型', 'data_scope_type', 100, '数据范围类型', 0, '2020-05-27 10:21:04', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1265468437904367618, '短信发送来源', 'sms_send_source', 100, '短信发送来源', 0, '2020-05-27 10:22:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1275617093517172738, '操作类型', 'op_type', 100, '操作类型', 0, '2020-06-24 10:29:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1277774529430654977, '文件存储位置', 'file_storage_location', 100, '文件存储位置', 0, '2020-06-30 09:22:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1278606951432855553, '运行状态', 'run_status', 100, '定时任务运行状态', 0, '2020-07-02 16:30:27', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1278911800547147777, '通知公告类型', 'notice_type', 100, '通知公告类型', 0, '2020-07-03 12:41:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1278911952657776642, '通知公告状态', 'notice_status', 100, '通知公告状态', 0, '2020-07-03 12:42:25', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1291390159941599233, '是否boolean', 'yes_true_false', 100, '是否boolean', 2, '2020-08-06 23:06:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1342445962104864770, '代码生成方式', 'code_gen_create_type', 100, '代码生成方式', 0, '2020-12-25 20:23:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1358094419419750401, '代码生成作用类型', 'code_gen_effect_type', 100, '代码生成作用类型', 0, '2021-02-07 00:45:16', 1265476890672672808, '2021-02-08 00:47:48', 1265476890672672808);
INSERT INTO "public"."sys_dict_type" VALUES (1358457818733428737, '代码生成查询类型', 'code_gen_query_type', 100, '代码生成查询类型', 0, '2021-02-08 00:49:18', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_dict_type" VALUES (1358470065111252994, '代码生成java类型', 'code_gen_java_type', 100, '代码生成java类型', 0, '2021-02-08 01:37:57', 1265476890672672808, NULL, NULL);

-- ----------------------------
-- Table structure for sys_emp
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_emp";
CREATE TABLE "public"."sys_emp" (
  "id" int8 NOT NULL,
  "job_num" varchar(100) COLLATE "pg_catalog"."default",
  "org_id" int8 NOT NULL,
  "org_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_emp"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_emp"."job_num" IS '工号';
COMMENT ON COLUMN "public"."sys_emp"."org_id" IS '所属机构id';
COMMENT ON COLUMN "public"."sys_emp"."org_name" IS '所属机构名称';
COMMENT ON TABLE "public"."sys_emp" IS '员工表';

-- ----------------------------
-- Records of sys_emp
-- ----------------------------
INSERT INTO "public"."sys_emp" VALUES (1275735541155614721, '102', 1265476890672672769, '华夏集团北京分公司');
INSERT INTO "public"."sys_emp" VALUES (1280700700074041345, '110', 1265476890672672771, '研发部');
INSERT INTO "public"."sys_emp" VALUES (1280709549107552257, '100', 1265476890672672770, '华夏集团成都分公司');

-- ----------------------------
-- Table structure for sys_emp_ext_org_pos
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_emp_ext_org_pos";
CREATE TABLE "public"."sys_emp_ext_org_pos" (
  "id" int8 NOT NULL,
  "emp_id" int8 NOT NULL,
  "org_id" int8 NOT NULL,
  "pos_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_emp_ext_org_pos"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_emp_ext_org_pos"."emp_id" IS '员工id';
COMMENT ON COLUMN "public"."sys_emp_ext_org_pos"."org_id" IS '机构id';
COMMENT ON COLUMN "public"."sys_emp_ext_org_pos"."pos_id" IS '岗位id';
COMMENT ON TABLE "public"."sys_emp_ext_org_pos" IS '员工附属机构岗位表';

-- ----------------------------
-- Records of sys_emp_ext_org_pos
-- ----------------------------

-- ----------------------------
-- Table structure for sys_emp_pos
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_emp_pos";
CREATE TABLE "public"."sys_emp_pos" (
  "id" int8 NOT NULL,
  "emp_id" int8 NOT NULL,
  "pos_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_emp_pos"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_emp_pos"."emp_id" IS '员工id';
COMMENT ON COLUMN "public"."sys_emp_pos"."pos_id" IS '职位id';
COMMENT ON TABLE "public"."sys_emp_pos" IS '员工职位关联表';

-- ----------------------------
-- Records of sys_emp_pos
-- ----------------------------
INSERT INTO "public"."sys_emp_pos" VALUES (1280710811995709441, 1275735541155614721, 1265476890672672787);
INSERT INTO "public"."sys_emp_pos" VALUES (1280710828479324161, 1280700700074041345, 1265476890672672790);
INSERT INTO "public"."sys_emp_pos" VALUES (1281042262003867649, 1280709549107552257, 1265476890672672787);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_file_info";
CREATE TABLE "public"."sys_file_info" (
  "id" int8 NOT NULL,
  "file_location" int2 NOT NULL,
  "file_bucket" varchar(1000) COLLATE "pg_catalog"."default",
  "file_origin_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "file_suffix" varchar(50) COLLATE "pg_catalog"."default",
  "file_size_kb" int8,
  "file_size_info" varchar(100) COLLATE "pg_catalog"."default",
  "file_object_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "file_path" varchar(1000) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_file_info"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_file_info"."file_location" IS '文件存储位置（1:阿里云，2:腾讯云，3:minio，4:本地）';
COMMENT ON COLUMN "public"."sys_file_info"."file_bucket" IS '文件仓库';
COMMENT ON COLUMN "public"."sys_file_info"."file_origin_name" IS '文件名称（上传时候的文件名）';
COMMENT ON COLUMN "public"."sys_file_info"."file_suffix" IS '文件后缀';
COMMENT ON COLUMN "public"."sys_file_info"."file_size_kb" IS '文件大小kb';
COMMENT ON COLUMN "public"."sys_file_info"."file_size_info" IS '文件大小信息，计算后的';
COMMENT ON COLUMN "public"."sys_file_info"."file_object_name" IS '存储到bucket的名称（文件唯一标识id）';
COMMENT ON COLUMN "public"."sys_file_info"."file_path" IS '存储路径';
COMMENT ON COLUMN "public"."sys_file_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_file_info"."create_user" IS '创建用户';
COMMENT ON COLUMN "public"."sys_file_info"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_file_info"."update_user" IS '修改用户';
COMMENT ON TABLE "public"."sys_file_info" IS '文件信息表';

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" int8 NOT NULL,
  "pid" int8 NOT NULL,
  "pids" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "type" int2 NOT NULL DEFAULT 1,
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "router" varchar(255) COLLATE "pg_catalog"."default",
  "component" varchar(255) COLLATE "pg_catalog"."default",
  "permission" varchar(255) COLLATE "pg_catalog"."default",
  "application" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "open_type" int2 NOT NULL,
  "visible" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "link" varchar(255) COLLATE "pg_catalog"."default",
  "redirect" varchar(255) COLLATE "pg_catalog"."default",
  "weight" int2,
  "sort" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL DEFAULT 0,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_menu"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_menu"."pid" IS '父id';
COMMENT ON COLUMN "public"."sys_menu"."pids" IS '父ids';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_menu"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '菜单类型（字典 0目录 1菜单 2按钮）';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '图标';
COMMENT ON COLUMN "public"."sys_menu"."router" IS '路由地址';
COMMENT ON COLUMN "public"."sys_menu"."component" IS '组件地址';
COMMENT ON COLUMN "public"."sys_menu"."permission" IS '权限标识';
COMMENT ON COLUMN "public"."sys_menu"."application" IS '应用分类（应用编码）';
COMMENT ON COLUMN "public"."sys_menu"."open_type" IS '打开方式（字典 0无 1组件 2内链 3外链）';
COMMENT ON COLUMN "public"."sys_menu"."visible" IS '是否可见（Y-是，N-否）';
COMMENT ON COLUMN "public"."sys_menu"."link" IS '链接地址';
COMMENT ON COLUMN "public"."sys_menu"."redirect" IS '重定向地址';
COMMENT ON COLUMN "public"."sys_menu"."weight" IS '权重（字典 1系统权重 2业务权重）';
COMMENT ON COLUMN "public"."sys_menu"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_menu"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_menu"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_menu"."update_user" IS '修改人';
COMMENT ON TABLE "public"."sys_menu" IS '系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1264622039642255311, 0, '[0],', '主控面板', 'system_index', 0, 'home', '/', 'RouteView', NULL, 'system', 0, 'Y', NULL, '/analysis', 1, 1, NULL, 0, '2020-05-25 02:19:24', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255321, 1264622039642255311, '[0],[1264622039642255311],', '分析页', 'system_index_dashboard', 1, NULL, 'analysis', 'system/dashboard/Analysis', NULL, 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-25 02:21:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255331, 1264622039642255311, '[0],[1264622039642255311],', '工作台', 'system_index_workplace', 1, NULL, 'workplace', 'system/dashboard/Workplace', NULL, 'system', 0, 'Y', NULL, NULL, 1, 2, NULL, 0, '2020-05-25 02:23:48', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255341, 0, '[0],', '组织架构', 'sys_mgr', 0, 'team', '/sys', 'PageView', NULL, 'system', 0, 'Y', NULL, NULL, 1, 2, NULL, 0, '2020-03-27 15:58:16', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255351, 1264622039642255341, '[0],[1264622039642255341],', '用户管理', 'sys_user_mgr', 1, NULL, '/mgr_user', 'system/user/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 3, NULL, 0, '2020-03-27 16:10:21', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255361, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户查询', 'sys_user_mgr_page', 2, NULL, NULL, NULL, 'sysUser:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 16:36:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255371, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户编辑', 'sys_user_mgr_edit', 2, NULL, NULL, NULL, 'sysUser:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 12:20:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255381, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户增加', 'sys_user_mgr_add', 2, NULL, NULL, NULL, 'sysUser:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 16:37:35', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255391, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户删除', 'sys_user_mgr_delete', 2, NULL, NULL, NULL, 'sysUser:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 16:37:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255401, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户详情', 'sys_user_mgr_detail', 2, NULL, NULL, NULL, 'sysUser:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 16:38:25', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255411, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户导出', 'sys_user_mgr_export', 2, NULL, NULL, NULL, 'sysUser:export', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 12:21:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255421, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户选择器', 'sys_user_mgr_selector', 2, NULL, NULL, NULL, 'sysUser:selector', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-03 13:30:14', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255431, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户授权角色', 'sys_user_mgr_grant_role', 2, NULL, NULL, NULL, 'sysUser:grantRole', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 09:22:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255441, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户拥有角色', 'sys_user_mgr_own_role', 2, NULL, NULL, NULL, 'sysUser:ownRole', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 14:27:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255451, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户授权数据', 'sys_user_mgr_grant_data', 2, NULL, NULL, NULL, 'sysUser:grantData', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 09:22:13', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255461, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户拥有数据', 'sys_user_mgr_own_data', 2, NULL, NULL, NULL, 'sysUser:ownData', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 14:27:41', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255471, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户更新信息', 'sys_user_mgr_update_info', 2, NULL, NULL, NULL, 'sysUser:updateInfo', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 16:19:32', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255481, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户修改密码', 'sys_user_mgr_update_pwd', 2, NULL, NULL, NULL, 'sysUser:updatePwd', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 16:20:25', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255491, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户修改状态', 'sys_user_mgr_change_status', 2, NULL, NULL, NULL, 'sysUser:changeStatus', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-23 11:13:14', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255501, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户修改头像', 'sys_user_mgr_update_avatar', 2, NULL, NULL, NULL, 'sysUser:updateAvatar', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 12:21:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255511, 1264622039642255351, '[0],[1264622039642255341],[1264622039642255351],', '用户重置密码', 'sys_user_mgr_reset_pwd', 2, NULL, NULL, NULL, 'sysUser:resetPwd', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 15:01:51', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255521, 1264622039642255341, '[0],[1264622039642255341],', '机构管理', 'sys_org_mgr', 1, NULL, '/org', 'system/org/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 4, NULL, 0, '2020-03-27 17:15:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255531, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构查询', 'sys_org_mgr_page', 2, NULL, NULL, NULL, 'sysOrg:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:17:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255541, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构列表', 'sys_org_mgr_list', 2, NULL, NULL, NULL, 'sysOrg:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:54:26', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255551, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构增加', 'sys_org_mgr_add', 2, NULL, NULL, NULL, 'sysOrg:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:19:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255561, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构编辑', 'sys_org_mgr_edit', 2, NULL, NULL, NULL, 'sysOrg:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:54:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255571, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构删除', 'sys_org_mgr_delete', 2, NULL, NULL, NULL, 'sysOrg:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:20:48', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255581, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构详情', 'sys_org_mgr_detail', 2, NULL, NULL, NULL, 'sysOrg:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:21:15', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255591, 1264622039642255521, '[0],[1264622039642255341],[1264622039642255521]', '机构树', 'sys_org_mgr_tree', 2, NULL, NULL, NULL, 'sysOrg:tree', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:21:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255601, 1264622039642255341, '[0],[1264622039642255341],', '职位管理', 'sys_pos_mgr', 1, NULL, '/pos', 'system/pos/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 5, NULL, 0, '2020-03-27 18:38:31', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255611, 1264622039642255601, '[0],[1264622039642255341],[1264622039642255601],', '职位查询', 'sys_pos_mgr_page', 2, NULL, NULL, NULL, 'sysPos:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:41:48', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255621, 1264622039642255601, '[0],[1264622039642255341],[1264622039642255601],', '职位列表', 'sys_pos_mgr_list', 2, NULL, NULL, NULL, 'sysPos:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:55:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255631, 1264622039642255601, '[0],[1264622039642255341],[1264622039642255601],', '职位增加', 'sys_pos_mgr_add', 2, NULL, NULL, NULL, 'sysPos:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:42:20', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255641, 1264622039642255601, '[0],[1264622039642255341],[1264622039642255601],', '职位编辑', 'sys_pos_mgr_edit', 2, NULL, NULL, NULL, 'sysPos:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:56:08', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255651, 1264622039642255601, '[0],[1264622039642255341],[1264622039642255601],', '职位删除', 'sys_pos_mgr_delete', 2, NULL, NULL, NULL, 'sysPos:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:42:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255661, 1264622039642255601, '[0],[1264622039642255341],[1264622039642255601],', '职位详情', 'sys_pos_mgr_detail', 2, NULL, NULL, NULL, 'sysPos:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:43:00', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255671, 0, '[0],', '权限管理', 'auth_manager', 0, 'safety-certificate', '/auth', 'PageView', NULL, 'system', 0, 'Y', NULL, NULL, 1, 3, NULL, 0, '2020-07-15 15:51:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255681, 1264622039642255671, '[0],[1264622039642255671],', '应用管理', 'sys_app_mgr', 1, NULL, '/app', 'system/app/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 6, NULL, 0, '2020-03-27 16:40:21', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255691, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '应用查询', 'sys_app_mgr_page', 2, NULL, NULL, NULL, 'sysApp:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 16:41:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255701, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '应用列表', 'sys_app_mgr_list', 2, NULL, NULL, NULL, 'sysApp:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 10:04:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255711, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '应用增加', 'sys_app_mgr_add', 2, NULL, NULL, NULL, 'sysApp:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 16:44:10', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255721, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '应用编辑', 'sys_app_mgr_edit', 2, NULL, NULL, NULL, 'sysApp:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 10:04:34', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255731, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '应用删除', 'sys_app_mgr_delete', 2, NULL, NULL, NULL, 'sysApp:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:14:29', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255741, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '应用详情', 'sys_app_mgr_detail', 2, NULL, NULL, NULL, 'sysApp:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:14:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255751, 1264622039642255681, '[0],[1264622039642255671],[1264622039642255681],', '设为默认应用', 'sys_app_mgr_set_as_default', 2, NULL, NULL, NULL, 'sysApp:setAsDefault', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 17:14:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255761, 1264622039642255671, '[0],[1264622039642255671],', '菜单管理', 'sys_menu_mgr', 1, NULL, '/menu', 'system/menu/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 7, NULL, 0, '2020-03-27 18:44:35', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255771, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单列表', 'sys_menu_mgr_list', 2, NULL, NULL, NULL, 'sysMenu:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:45:20', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255781, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单增加', 'sys_menu_mgr_add', 2, NULL, NULL, NULL, 'sysMenu:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:45:37', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255791, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单编辑', 'sys_menu_mgr_edit', 2, NULL, NULL, NULL, 'sysMenu:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:52:00', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255801, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单删除', 'sys_menu_mgr_delete', 2, NULL, NULL, NULL, 'sysMenu:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:46:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255811, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单详情', 'sys_menu_mgr_detail', 2, NULL, NULL, NULL, 'sysMenu:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:46:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255821, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单授权树', 'sys_menu_mgr_grant_tree', 2, NULL, NULL, NULL, 'sysMenu:treeForGrant', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-03 09:50:31', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255831, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单树', 'sys_menu_mgr_tree', 2, NULL, NULL, NULL, 'sysMenu:tree', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-27 18:47:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255841, 1264622039642255761, '[0],[1264622039642255671],[1264622039642255761],', '菜单切换', 'sys_menu_mgr_change', 2, NULL, NULL, NULL, 'sysMenu:change', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-03 09:51:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255851, 1264622039642255671, '[0],[1264622039642255671],', '角色管理', 'sys_role_mgr', 1, NULL, '/role', 'system/role/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 8, NULL, 0, '2020-03-28 16:01:09', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255861, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色查询', 'sys_role_mgr_page', 2, NULL, NULL, NULL, 'sysRole:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-28 16:02:09', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255871, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色增加', 'sys_role_mgr_add', 2, NULL, NULL, NULL, 'sysRole:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-28 16:02:27', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255881, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色编辑', 'sys_role_mgr_edit', 2, NULL, NULL, NULL, 'sysRole:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:57:27', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255891, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色删除', 'sys_role_mgr_delete', 2, NULL, NULL, NULL, 'sysRole:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-28 16:02:46', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255901, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色详情', 'sys_role_mgr_detail', 2, NULL, NULL, NULL, 'sysRole:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-03-28 16:03:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255911, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色下拉', 'sys_role_mgr_drop_down', 2, NULL, NULL, NULL, 'sysRole:dropDown', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 15:45:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255921, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色授权菜单', 'sys_role_mgr_grant_menu', 2, NULL, NULL, NULL, 'sysRole:grantMenu', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 09:16:27', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255931, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色拥有菜单', 'sys_role_mgr_own_menu', 2, NULL, NULL, NULL, 'sysRole:ownMenu', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 14:21:54', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255941, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色授权数据', 'sys_role_mgr_grant_data', 2, NULL, NULL, NULL, 'sysRole:grantData', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 09:16:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255951, 1264622039642255851, '[0],[1264622039642255671],[1264622039642255851],', '角色拥有数据', 'sys_role_mgr_own_data', 2, NULL, NULL, NULL, 'sysRole:ownData', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 14:23:08', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255961, 0, '[0],', '开发管理', 'system_tools', 0, 'euro', '/tools', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 4, NULL, 0, '2020-05-25 02:10:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255971, 1264622039642255961, '[0],[1264622039642255961],', '系统配置', 'system_tools_config', 1, NULL, '/config', 'system/config/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 9, NULL, 0, '2020-05-25 02:12:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255981, 1264622039642255971, '[0],[1264622039642255961],[1264622039642255971],', '配置查询', 'system_tools_config_page', 2, NULL, NULL, NULL, 'sysConfig:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-27 17:02:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642255991, 1264622039642255971, '[0],[1264622039642255961],[1264622039642255971],', '配置列表', 'system_tools_config_list', 2, NULL, NULL, NULL, 'sysConfig:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-27 17:02:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256001, 1264622039642255971, '[0],[1264622039642255961],[1264622039642255971],', '配置增加', 'system_tools_config_add', 2, NULL, NULL, NULL, 'sysConfig:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-27 17:03:31', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256011, 1264622039642255971, '[0],[1264622039642255961],[1264622039642255971],', '配置编辑', 'system_tools_config_edit', 2, NULL, NULL, NULL, 'sysConfig:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-27 17:03:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256021, 1264622039642255971, '[0],[1264622039642255961],[1264622039642255971],', '配置删除', 'system_tools_config_delete', 2, NULL, NULL, NULL, 'sysConfig:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-27 17:03:44', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256031, 1264622039642255971, '[0],[1264622039642255961],[1264622039642255971],', '配置详情', 'system_tools_config_detail', 2, NULL, NULL, NULL, 'sysConfig:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-27 17:02:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256041, 1264622039642255961, '[0],[1264622039642255961],', '邮件发送', 'sys_email_mgr', 1, NULL, '/email', 'system/email/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 10, NULL, 0, '2020-07-02 11:44:21', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256051, 1264622039642256041, '[0],[1264622039642255961],[1264622039642256041],', '发送文本邮件', 'sys_email_mgr_send_email', 2, NULL, NULL, NULL, 'email:sendEmail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:45:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256061, 1264622039642256041, '[0],[1264622039642255961],[1264622039642256041],', '发送html邮件', 'sys_email_mgr_send_email_html', 2, NULL, NULL, NULL, 'email:sendEmailHtml', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 11:45:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256071, 1264622039642255961, '[0],[1264622039642255961],', '短信管理', 'sys_sms_mgr', 1, NULL, '/sms', 'system/sms/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 11, NULL, 0, '2020-07-02 12:00:12', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256081, 1264622039642256071, '[0],[1264622039642255961],[1264622039642256071],', '短信发送查询', 'sys_sms_mgr_page', 2, NULL, NULL, NULL, 'sms:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 12:16:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256091, 1264622039642256071, '[0],[1264622039642255961],[1264622039642256071],', '发送验证码短信', 'sys_sms_mgr_send_login_message', 2, NULL, NULL, NULL, 'sms:sendLoginMessage', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 12:02:31', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256101, 1264622039642256071, '[0],[1264622039642255961],[1264622039642256071],', '验证短信验证码', 'sys_sms_mgr_validate_message', 2, NULL, NULL, NULL, 'sms:validateMessage', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 12:02:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256111, 1264622039642255961, '[0],[1264622039642255961],', '字典管理', 'sys_dict_mgr', 1, NULL, '/dict', 'system/dict/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 12, NULL, 0, '2020-04-01 11:17:26', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256121, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型查询', 'sys_dict_mgr_dict_type_page', 2, NULL, NULL, NULL, 'sysDictType:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:20:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256131, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型列表', 'sys_dict_mgr_dict_type_list', 2, NULL, NULL, NULL, 'sysDictType:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-05-29 15:12:35', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256141, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型增加', 'sys_dict_mgr_dict_type_add', 2, NULL, NULL, NULL, 'sysDictType:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:19:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256151, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型删除', 'sys_dict_mgr_dict_type_delete', 2, NULL, NULL, NULL, 'sysDictType:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:21:30', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256161, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型编辑', 'sys_dict_mgr_dict_type_edit', 2, NULL, NULL, NULL, 'sysDictType:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:21:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256171, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型详情', 'sys_dict_mgr_dict_type_detail', 2, NULL, NULL, NULL, 'sysDictType:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:22:06', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256181, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型下拉', 'sys_dict_mgr_dict_type_drop_down', 2, NULL, NULL, NULL, 'sysDictType:dropDown', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:22:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256191, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典类型修改状态', 'sys_dict_mgr_dict_type_change_status', 2, NULL, NULL, NULL, 'sysDictType:changeStatus', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-23 11:15:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256201, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值查询', 'sys_dict_mgr_dict_page', 2, NULL, NULL, NULL, 'sysDictData:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:23:11', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256211, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值列表', 'sys_dict_mgr_dict_list', 2, NULL, NULL, NULL, 'sysDictData:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:24:58', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256221, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值增加', 'sys_dict_mgr_dict_add', 2, NULL, NULL, NULL, 'sysDictData:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:22:51', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256231, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值删除', 'sys_dict_mgr_dict_delete', 2, NULL, NULL, NULL, 'sysDictData:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:23:26', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256241, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值编辑', 'sys_dict_mgr_dict_edit', 2, NULL, NULL, NULL, 'sysDictData:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:24:21', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256251, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值详情', 'sys_dict_mgr_dict_detail', 2, NULL, NULL, NULL, 'sysDictData:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-04-01 11:24:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256261, 1264622039642256111, '[0],[1264622039642255961],[1264622039642256111],', '字典值修改状态', 'sys_dict_mgr_dict_change_status', 2, NULL, NULL, NULL, 'sysDictData:changeStatus', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-23 11:17:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256271, 1264622039642255961, '[0],[1264622039642255961],', '接口文档', 'sys_swagger_mgr', 1, NULL, '/swagger', 'Iframe', NULL, 'system', 2, 'Y', 'http://localhost:82/doc.html', NULL, 1, 13, NULL, 0, '2020-07-02 12:16:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256281, 0, '[0],', '日志管理', 'sys_log_mgr', 0, 'read', '/log', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 5, NULL, 0, '2020-04-01 09:25:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256291, 1264622039642256281, '[0],[1264622039642256281],', '访问日志', 'sys_log_mgr_vis_log', 1, NULL, '/vislog', 'system/log/vislog/index', NULL, 'system', 0, 'Y', NULL, NULL, 1, 14, NULL, 0, '2020-04-01 09:26:40', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256301, 1264622039642256291, '[0],[1264622039642256281],[1264622039642256291],', '访问日志查询', 'sys_log_mgr_vis_log_page', 2, NULL, NULL, NULL, 'sysVisLog:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 09:55:51', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256311, 1264622039642256291, '[0],[1264622039642256281],[1264622039642256291],', '访问日志清空', 'sys_log_mgr_vis_log_delete', 2, NULL, NULL, NULL, 'sysVisLog:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 09:56:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256321, 1264622039642256281, '[0],[1264622039642256281],', '操作日志', 'sys_log_mgr_op_log', 1, NULL, '/oplog', 'system/log/oplog/index', NULL, 'system', 0, 'Y', NULL, NULL, 1, 15, NULL, 0, '2020-04-01 09:26:59', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256331, 1264622039642256321, '[0],[1264622039642256281],[1264622039642256321],', '操作日志查询', 'sys_log_mgr_op_log_page', 2, NULL, NULL, NULL, 'sysOpLog:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 09:57:39', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256341, 1264622039642256321, '[0],[1264622039642256281],[1264622039642256321],', '操作日志清空', 'sys_log_mgr_op_log_delete', 2, NULL, NULL, NULL, 'sysOpLog:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-02 09:58:13', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256351, 0, '[0],', '系统监控', 'sys_monitor_mgr', 0, 'deployment-unit', '/monitor', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 6, NULL, 0, '2020-06-05 16:00:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256361, 1264622039642256351, '[0],[1264622039642256351],', '服务监控', 'sys_monitor_mgr_machine_monitor', 1, NULL, '/machine', 'system/machine/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 16, NULL, 0, '2020-06-05 16:02:38', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256371, 1264622039642256361, '[0],[1264622039642256351],[1264622039642256361],', '服务监控查询', 'sys_monitor_mgr_machine_monitor_query', 2, NULL, NULL, NULL, 'sysMachine:query', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-05 16:05:33', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256381, 1264622039642256351, '[0],[1264622039642256351],', '在线用户', 'sys_monitor_mgr_online_user', 1, NULL, '/onlineUser', 'system/onlineUser/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 17, NULL, 0, '2020-06-05 16:01:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256391, 1264622039642256381, '[0],[1264622039642256351],[1264622039642256381],', '在线用户列表', 'sys_monitor_mgr_online_user_list', 2, NULL, NULL, NULL, 'sysOnlineUser:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-05 16:03:46', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256401, 1264622039642256381, '[0],[1264622039642256351],[1264622039642256381],', '在线用户强退', 'sys_monitor_mgr_online_user_force_exist', 2, NULL, NULL, NULL, 'sysOnlineUser:forceExist', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-05 16:04:16', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256411, 1264622039642256351, '[0],[1264622039642256351],', '数据监控', 'sys_monitor_mgr_druid', 1, NULL, '/druid', 'Iframe', NULL, 'system', 2, 'Y', 'http://localhost:82/druid', NULL, 1, 18, NULL, 0, '2020-06-28 16:15:07', 1265476890672672808, '2020-09-13 09:39:10', 1265476890672672808);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256421, 0, '[0],', '通知公告', 'sys_notice', 0, 'sound', '/notice', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 7, NULL, 0, '2020-06-29 15:41:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256431, 1264622039642256421, '[0],[1264622039642256421],', '公告管理', 'sys_notice_mgr', 1, NULL, '/notice', 'system/notice/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 19, NULL, 0, '2020-06-29 15:44:24', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256441, 1264622039642256431, '[0],[1264622039642256421],[1264622039642256431],', '公告查询', 'sys_notice_mgr_page', 2, NULL, NULL, NULL, 'sysNotice:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 15:45:30', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256451, 1264622039642256431, '[0],[1264622039642256421],[1264622039642256431],', '公告增加', 'sys_notice_mgr_add', 2, NULL, NULL, NULL, 'sysNotice:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 15:45:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256461, 1264622039642256431, '[0],[1264622039642256421],[1264622039642256431],', '公告编辑', 'sys_notice_mgr_edit', 2, NULL, NULL, NULL, 'sysNotice:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 15:46:22', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256471, 1264622039642256431, '[0],[1264622039642256421],[1264622039642256431],', '公告删除', 'sys_notice_mgr_delete', 2, NULL, NULL, NULL, 'sysNotice:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 15:46:11', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256481, 1264622039642256431, '[0],[1264622039642256421],[1264622039642256431],', '公告查看', 'sys_notice_mgr_detail', 2, NULL, NULL, NULL, 'sysNotice:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 15:46:33', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256491, 1264622039642256431, '[0],[1264622039642256421],[1264622039642256431],', '公告修改状态', 'sys_notice_mgr_changeStatus', 2, NULL, NULL, NULL, 'sysNotice:changeStatus', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 15:46:50', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256501, 1264622039642256421, '[0],[1264622039642256421],', '已收公告', 'sys_notice_mgr_received', 1, NULL, '/noticeReceived', 'system/noticeReceived/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 20, NULL, 0, '2020-06-29 16:32:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256511, 1264622039642256501, '[0],[1264622039642256421],[1264622039642256501],', '已收公告查询', 'sys_notice_mgr_received_page', 2, NULL, NULL, NULL, 'sysNotice:received', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-29 16:33:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256521, 0, '[0],', '文件管理', 'sys_file_mgr', 0, 'file', '/file', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 8, NULL, 0, '2020-06-24 17:31:10', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256531, 1264622039642256521, '[0],[1264622039642256521],', '系统文件', 'sys_file_mgr_sys_file', 1, NULL, '/file', 'system/file/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 21, NULL, 0, '2020-06-24 17:32:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256541, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '文件查询', 'sys_file_mgr_sys_file_page', 2, NULL, NULL, NULL, 'sysFileInfo:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:35:38', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256551, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '文件列表', 'sys_file_mgr_sys_file_list', 2, NULL, NULL, NULL, 'sysFileInfo:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:35:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256561, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '文件删除', 'sys_file_mgr_sys_file_delete', 2, NULL, NULL, NULL, 'sysFileInfo:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:36:11', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256571, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '文件详情', 'sys_file_mgr_sys_file_detail', 2, NULL, NULL, NULL, 'sysFileInfo:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:36:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256581, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '文件上传', 'sys_file_mgr_sys_file_upload', 2, NULL, NULL, NULL, 'sysFileInfo:upload', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:34:29', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256591, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '文件下载', 'sys_file_mgr_sys_file_download', 2, NULL, NULL, NULL, 'sysFileInfo:download', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:34:55', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256601, 1264622039642256531, '[0],[1264622039642256521],[1264622039642256531],', '图片预览', 'sys_file_mgr_sys_file_preview', 2, NULL, NULL, NULL, 'sysFileInfo:preview', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-06-24 17:35:19', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256611, 0, '[0],', '定时任务', 'sys_timers', 0, 'dashboard', '/timers', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:17:20', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256621, 1264622039642256611, '[0],[1264622039642256611],', '任务管理', 'sys_timers_mgr', 1, NULL, '/timers', 'system/timers/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 22, NULL, 0, '2020-07-01 17:18:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256631, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务查询', 'sys_timers_mgr_page', 2, NULL, NULL, NULL, 'sysTimers:page', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:19:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256641, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务列表', 'sys_timers_mgr_list', 2, NULL, NULL, NULL, 'sysTimers:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:19:56', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256651, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务详情', 'sys_timers_mgr_detail', 2, NULL, NULL, NULL, 'sysTimers:detail', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:20:10', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256661, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务增加', 'sys_timers_mgr_add', 2, NULL, NULL, NULL, 'sysTimers:add', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:20:23', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256671, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务删除', 'sys_timers_mgr_delete', 2, NULL, NULL, NULL, 'sysTimers:delete', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:20:33', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256681, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务编辑', 'sys_timers_mgr_edit', 2, NULL, NULL, NULL, 'sysTimers:edit', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:20:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256691, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务可执行列表', 'sys_timers_mgr_get_action_classes', 2, NULL, NULL, NULL, 'sysTimers:getActionClasses', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:22:16', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256701, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务启动', 'sys_timers_mgr_start', 2, NULL, NULL, NULL, 'sysTimers:start', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:22:32', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256711, 1264622039642256621, '[0],[1264622039642256611],[1264622039642256621],', '定时任务关闭', 'sys_timers_mgr_stop', 2, NULL, NULL, NULL, 'sysTimers:stop', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:22:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256721, 0, '[0],', '区域管理', 'sys_area', 0, 'environment', '/area', 'PageView', NULL, 'system', 1, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:17:20', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256731, 1264622039642256721, '[0],[1264622039642256721],', '系统区域', 'sys_area_mgr', 1, NULL, '/area', 'system/area/index', NULL, 'system', 1, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:18:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1264622039642256741, 1264622039642256731, '[0],[1264622039642256721],[1264622039642256731],', '系统区域列表', 'sys_area_mgr_list', 2, NULL, NULL, NULL, 'sysArea:list', 'system', 0, 'Y', NULL, NULL, 1, 100, NULL, 0, '2020-07-01 17:19:43', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_menu" VALUES (1342445437296771074, 0, '[0],', '代码生成', 'code_gen', 1, 'thunderbolt', '/codeGenerate/index', 'gen/codeGenerate/index', '', 'system_tool', 1, 'Y', NULL, '', 1, 100, '代码生成', 0, '2020-12-25 20:21:48', 1265476890672672808, NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "id" int8 NOT NULL,
  "title" varchar(1000) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default",
  "type" int2 NOT NULL,
  "public_user_id" int8 NOT NULL,
  "public_user_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "public_org_id" int8,
  "public_org_name" varchar(50) COLLATE "pg_catalog"."default",
  "public_time" timestamp(6),
  "cancel_time" timestamp(6),
  "status" int2 NOT NULL,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_notice"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_notice"."title" IS '标题';
COMMENT ON COLUMN "public"."sys_notice"."content" IS '内容';
COMMENT ON COLUMN "public"."sys_notice"."type" IS '类型（字典 1通知 2公告）';
COMMENT ON COLUMN "public"."sys_notice"."public_user_id" IS '发布人id';
COMMENT ON COLUMN "public"."sys_notice"."public_user_name" IS '发布人姓名';
COMMENT ON COLUMN "public"."sys_notice"."public_org_id" IS '发布机构id';
COMMENT ON COLUMN "public"."sys_notice"."public_org_name" IS '发布机构名称';
COMMENT ON COLUMN "public"."sys_notice"."public_time" IS '发布时间';
COMMENT ON COLUMN "public"."sys_notice"."cancel_time" IS '撤回时间';
COMMENT ON COLUMN "public"."sys_notice"."status" IS '状态（字典 0草稿 1发布 2撤回 3删除）';
COMMENT ON COLUMN "public"."sys_notice"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_notice"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_notice"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_notice"."update_user" IS '修改人';
COMMENT ON TABLE "public"."sys_notice" IS '通知表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_notice_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice_user";
CREATE TABLE "public"."sys_notice_user" (
  "id" int8 NOT NULL,
  "notice_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "status" int2 NOT NULL,
  "read_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_notice_user"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_notice_user"."notice_id" IS '通知公告id';
COMMENT ON COLUMN "public"."sys_notice_user"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."sys_notice_user"."status" IS '状态（字典 0未读 1已读）';
COMMENT ON COLUMN "public"."sys_notice_user"."read_time" IS '阅读时间';
COMMENT ON TABLE "public"."sys_notice_user" IS '系统用户数据范围表';

-- ----------------------------
-- Records of sys_notice_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oauth_user";
CREATE TABLE "public"."sys_oauth_user" (
  "id" int8 NOT NULL,
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "access_token" varchar(255) COLLATE "pg_catalog"."default",
  "nick_name" varchar(255) COLLATE "pg_catalog"."default",
  "avatar" varchar(500) COLLATE "pg_catalog"."default",
  "blog" varchar(255) COLLATE "pg_catalog"."default",
  "company" varchar(255) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "gender" varchar(50) COLLATE "pg_catalog"."default",
  "source" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_oauth_user"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_oauth_user"."uuid" IS '第三方平台的用户唯一id';
COMMENT ON COLUMN "public"."sys_oauth_user"."access_token" IS '用户授权的token';
COMMENT ON COLUMN "public"."sys_oauth_user"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."sys_oauth_user"."avatar" IS '头像';
COMMENT ON COLUMN "public"."sys_oauth_user"."blog" IS '用户网址';
COMMENT ON COLUMN "public"."sys_oauth_user"."company" IS '所在公司';
COMMENT ON COLUMN "public"."sys_oauth_user"."location" IS '位置';
COMMENT ON COLUMN "public"."sys_oauth_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_oauth_user"."gender" IS '性别';
COMMENT ON COLUMN "public"."sys_oauth_user"."source" IS '用户来源';
COMMENT ON COLUMN "public"."sys_oauth_user"."remark" IS '用户备注（各平台中的用户个人介绍）';
COMMENT ON COLUMN "public"."sys_oauth_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_oauth_user"."create_user" IS '创建用户';
COMMENT ON COLUMN "public"."sys_oauth_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_oauth_user"."update_user" IS '更新用户';
COMMENT ON TABLE "public"."sys_oauth_user" IS '第三方认证用户信息表';

-- ----------------------------
-- Records of sys_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_op_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_op_log";
CREATE TABLE "public"."sys_op_log" (
  "id" int8 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "op_type" int2,
  "success" char(1) COLLATE "pg_catalog"."default",
  "message" text COLLATE "pg_catalog"."default",
  "ip" varchar(255) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "browser" varchar(255) COLLATE "pg_catalog"."default",
  "os" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(500) COLLATE "pg_catalog"."default",
  "class_name" varchar(500) COLLATE "pg_catalog"."default",
  "method_name" varchar(500) COLLATE "pg_catalog"."default",
  "req_method" varchar(255) COLLATE "pg_catalog"."default",
  "param" text COLLATE "pg_catalog"."default",
  "result" text COLLATE "pg_catalog"."default",
  "op_time" timestamp(6),
  "account" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_op_log"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_op_log"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_op_log"."op_type" IS '操作类型';
COMMENT ON COLUMN "public"."sys_op_log"."success" IS '是否执行成功（Y-是，N-否）';
COMMENT ON COLUMN "public"."sys_op_log"."message" IS '具体消息';
COMMENT ON COLUMN "public"."sys_op_log"."ip" IS 'ip';
COMMENT ON COLUMN "public"."sys_op_log"."location" IS '地址';
COMMENT ON COLUMN "public"."sys_op_log"."browser" IS '浏览器';
COMMENT ON COLUMN "public"."sys_op_log"."os" IS '操作系统';
COMMENT ON COLUMN "public"."sys_op_log"."url" IS '请求地址';
COMMENT ON COLUMN "public"."sys_op_log"."class_name" IS '类名称';
COMMENT ON COLUMN "public"."sys_op_log"."method_name" IS '方法名称';
COMMENT ON COLUMN "public"."sys_op_log"."req_method" IS '请求方式（GET POST PUT DELETE)';
COMMENT ON COLUMN "public"."sys_op_log"."param" IS '请求参数';
COMMENT ON COLUMN "public"."sys_op_log"."result" IS '返回结果';
COMMENT ON COLUMN "public"."sys_op_log"."op_time" IS '操作时间';
COMMENT ON COLUMN "public"."sys_op_log"."account" IS '操作账号';
COMMENT ON TABLE "public"."sys_op_log" IS '系统操作日志表';

-- ----------------------------
-- Records of sys_op_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_org";
CREATE TABLE "public"."sys_org" (
  "id" int8 NOT NULL,
  "pid" int8 NOT NULL,
  "pids" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL DEFAULT 0,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_org"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_org"."pid" IS '父id';
COMMENT ON COLUMN "public"."sys_org"."pids" IS '父ids';
COMMENT ON COLUMN "public"."sys_org"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_org"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_org"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_org"."remark" IS '描述';
COMMENT ON COLUMN "public"."sys_org"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_org"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_org"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_org"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_org"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_org" IS '系统组织机构表';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO "public"."sys_org" VALUES (1265476890651701250, 0, '[0],', '华夏集团', 'hxjt', 100, '华夏集团总公司', 0, '2020-03-26 16:50:53', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672769, 1265476890651701250, '[0],[1265476890651701250],', '华夏集团北京分公司', 'hxjt_bj', 100, '华夏集团北京分公司', 0, '2020-03-26 16:55:42', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672770, 1265476890651701250, '[0],[1265476890651701250],', '华夏集团成都分公司', 'hxjt_cd', 100, '华夏集团成都分公司', 0, '2020-03-26 16:56:02', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672771, 1265476890672672769, '[0],[1265476890651701250],[1265476890672672769],', '研发部', 'hxjt_bj_yfb', 100, '华夏集团北京分公司研发部', 0, '2020-03-26 16:56:36', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672772, 1265476890672672769, '[0],[1265476890651701250],[1265476890672672769],', '企划部', 'hxjt_bj_qhb', 100, '华夏集团北京分公司企划部', 0, '2020-03-26 16:57:06', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672773, 1265476890672672770, '[0],[1265476890651701250],[1265476890672672770],', '市场部', 'hxjt_cd_scb', 100, '华夏集团成都分公司市场部', 0, '2020-03-26 16:57:35', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672774, 1265476890672672770, '[0],[1265476890651701250],[1265476890672672770],', '财务部', 'hxjt_cd_cwb', 100, '华夏集团成都分公司财务部', 0, '2020-03-26 16:58:01', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_org" VALUES (1265476890672672775, 1265476890672672773, '[0],[1265476890651701250],[1265476890672672770],[1265476890672672773],', '市场部二部', 'hxjt_cd_scb_2b', 100, '华夏集团成都分公司市场部二部', 0, '2020-04-06 15:36:50', 1265476890672672808, NULL, NULL);

-- ----------------------------
-- Table structure for sys_pos
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_pos";
CREATE TABLE "public"."sys_pos" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL DEFAULT 0,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_pos"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_pos"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_pos"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_pos"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_pos"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_pos"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_pos"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_pos"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_pos"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_pos"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_pos" IS '系统职位表';

-- ----------------------------
-- Records of sys_pos
-- ----------------------------
INSERT INTO "public"."sys_pos" VALUES (1265476890672672787, '总经理', 'zjl', 100, '总经理职位', 0, '2020-03-26 19:28:54', 1265476890672672808, '2020-06-02 21:01:04', 1265476890672672808);
INSERT INTO "public"."sys_pos" VALUES (1265476890672672788, '副总经理', 'fzjl', 100, '副总经理职位', 0, '2020-03-26 19:29:57', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_pos" VALUES (1265476890672672789, '部门经理', 'bmjl', 100, '部门经理职位', 0, '2020-03-26 19:31:49', 1265476890672672808, NULL, NULL);
INSERT INTO "public"."sys_pos" VALUES (1265476890672672790, '工作人员', 'gzry', 100, '工作人员职位', 0, '2020-05-27 11:32:00', 1265476890672672808, '2020-06-01 10:51:35', 1265476890672672808);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "data_scope_type" int2 NOT NULL DEFAULT 1,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL DEFAULT 0,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键id';
COMMENT ON COLUMN "public"."sys_role"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_role"."code" IS '编码';
COMMENT ON COLUMN "public"."sys_role"."sort" IS '序号';
COMMENT ON COLUMN "public"."sys_role"."data_scope_type" IS '数据范围类型（字典 1全部数据 2本部门及以下数据 3本部门数据 4仅本人数据 5自定义数据）';
COMMENT ON COLUMN "public"."sys_role"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."status" IS '状态（字典 0正常 1停用 2删除）';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_role" IS '系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1265476890672672817, '组织架构管理员', 'ent_manager_role', 100, 1, '组织架构管理员', 0, '2020-04-02 19:27:26', 1265476890672672808, '2020-09-12 15:54:07', 1265476890672672808);
INSERT INTO "public"."sys_role" VALUES (1265476890672672818, '权限管理员', 'auth_role', 101, 5, '权限管理员', 0, '2020-04-02 19:28:40', 1265476890672672808, '2020-07-16 10:52:21', 1265476890672672808);

-- ----------------------------
-- Table structure for sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_data_scope";
CREATE TABLE "public"."sys_role_data_scope" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "org_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_data_scope"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role_data_scope"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_data_scope"."org_id" IS '机构id';
COMMENT ON TABLE "public"."sys_role_data_scope" IS '系统角色数据范围表';

-- ----------------------------
-- Records of sys_role_data_scope
-- ----------------------------
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435908822102018, 1265476890672672818, 1265476890651701250);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435909635796993, 1265476890672672818, 1265476890672672769);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435910432714754, 1265476890672672818, 1265476890672672771);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435911233826818, 1265476890672672818, 1265476890672672772);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435912018161666, 1265476890672672818, 1265476890672672770);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435912810885122, 1265476890672672818, 1265476890672672773);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435913595219970, 1265476890672672818, 1265476890672672775);
INSERT INTO "public"."sys_role_data_scope" VALUES (1277435914392137730, 1265476890672672818, 1265476890672672774);
INSERT INTO "public"."sys_role_data_scope" VALUES (1292060127645429762, 1265476890672672819, 1265476890672672774);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单id';
COMMENT ON TABLE "public"."sys_role_menu" IS '系统角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "public"."sys_role_menu" VALUES (1304366872187256834, 1265476890672672818, 1264622039642255671);
INSERT INTO "public"."sys_role_menu" VALUES (1304366872602492929, 1265476890672672818, 1264622039642255681);
INSERT INTO "public"."sys_role_menu" VALUES (1304366873026117634, 1265476890672672818, 1264622039642255761);
INSERT INTO "public"."sys_role_menu" VALUES (1304366873449742337, 1265476890672672818, 1264622039642255851);
INSERT INTO "public"."sys_role_menu" VALUES (1304366873864978433, 1265476890672672818, 1264622039642255691);
INSERT INTO "public"."sys_role_menu" VALUES (1304366874284408834, 1265476890672672818, 1264622039642255701);
INSERT INTO "public"."sys_role_menu" VALUES (1304366874703839233, 1265476890672672818, 1264622039642255711);
INSERT INTO "public"."sys_role_menu" VALUES (1304366875119075330, 1265476890672672818, 1264622039642255721);
INSERT INTO "public"."sys_role_menu" VALUES (1304366875538505730, 1265476890672672818, 1264622039642255731);
INSERT INTO "public"."sys_role_menu" VALUES (1304366875962130433, 1265476890672672818, 1264622039642255741);
INSERT INTO "public"."sys_role_menu" VALUES (1304366876377366529, 1265476890672672818, 1264622039642255751);
INSERT INTO "public"."sys_role_menu" VALUES (1304366876800991233, 1265476890672672818, 1264622039642255771);
INSERT INTO "public"."sys_role_menu" VALUES (1304366877216227330, 1265476890672672818, 1264622039642255781);
INSERT INTO "public"."sys_role_menu" VALUES (1304366877639852033, 1265476890672672818, 1264622039642255791);
INSERT INTO "public"."sys_role_menu" VALUES (1304366878067671041, 1265476890672672818, 1264622039642255801);
INSERT INTO "public"."sys_role_menu" VALUES (1304366878487101441, 1265476890672672818, 1264622039642255811);
INSERT INTO "public"."sys_role_menu" VALUES (1304366878898143233, 1265476890672672818, 1264622039642255821);
INSERT INTO "public"."sys_role_menu" VALUES (1304366879325962242, 1265476890672672818, 1264622039642255831);
INSERT INTO "public"."sys_role_menu" VALUES (1304366879745392641, 1265476890672672818, 1264622039642255841);
INSERT INTO "public"."sys_role_menu" VALUES (1304366880160628738, 1265476890672672818, 1264622039642255881);
INSERT INTO "public"."sys_role_menu" VALUES (1304366880580059138, 1265476890672672818, 1264622039642255891);
INSERT INTO "public"."sys_role_menu" VALUES (1304366880999489537, 1265476890672672818, 1264622039642255901);
INSERT INTO "public"."sys_role_menu" VALUES (1304366881423114242, 1265476890672672818, 1264622039642255911);
INSERT INTO "public"."sys_role_menu" VALUES (1304366881838350338, 1265476890672672818, 1264622039642255921);
INSERT INTO "public"."sys_role_menu" VALUES (1304366882261975042, 1265476890672672818, 1264622039642255931);
INSERT INTO "public"."sys_role_menu" VALUES (1304366882685599745, 1265476890672672818, 1264622039642255941);
INSERT INTO "public"."sys_role_menu" VALUES (1304366883100835842, 1265476890672672818, 1264622039642255951);
INSERT INTO "public"."sys_role_menu" VALUES (1304366883520266242, 1265476890672672818, 1264622039642255861);
INSERT INTO "public"."sys_role_menu" VALUES (1304366883939696642, 1265476890672672818, 1264622039642255871);
INSERT INTO "public"."sys_role_menu" VALUES (1304366884363321346, 1265476890672672818, 1264622039642257021);
INSERT INTO "public"."sys_role_menu" VALUES (1304366884782751746, 1265476890672672818, 1264622039642257031);
INSERT INTO "public"."sys_role_menu" VALUES (1304366885197987842, 1265476890672672818, 1264622039642256831);
INSERT INTO "public"."sys_role_menu" VALUES (1304366885617418242, 1265476890672672818, 1264622039642257261);
INSERT INTO "public"."sys_role_menu" VALUES (1304366886045237250, 1265476890672672818, 1264622039642257271);
INSERT INTO "public"."sys_role_menu" VALUES (1304366886473056258, 1265476890672672818, 1264622039642257301);
INSERT INTO "public"."sys_role_menu" VALUES (1304366886884098050, 1265476890672672818, 1264622039642257321);
INSERT INTO "public"."sys_role_menu" VALUES (1304366887307722754, 1265476890672672818, 1264622039642257331);
INSERT INTO "public"."sys_role_menu" VALUES (1304366887722958850, 1265476890672672818, 1264622039642257471);
INSERT INTO "public"."sys_role_menu" VALUES (1304366888142389250, 1265476890672672818, 1264622039642257481);
INSERT INTO "public"."sys_role_menu" VALUES (1304366888566013954, 1265476890672672818, 1264622039642257341);
INSERT INTO "public"."sys_role_menu" VALUES (1304366888981250049, 1265476890672672818, 1264622039642257411);
INSERT INTO "public"."sys_role_menu" VALUES (1304366889404874754, 1265476890672672818, 1264622039642257421);
INSERT INTO "public"."sys_role_menu" VALUES (1304366889820110850, 1265476890672672818, 1264622039642257431);
INSERT INTO "public"."sys_role_menu" VALUES (1304366890235346946, 1265476890672672818, 1264622039642257441);
INSERT INTO "public"."sys_role_menu" VALUES (1304366890663165954, 1265476890672672818, 1264622039642257451);
INSERT INTO "public"."sys_role_menu" VALUES (1304366891082596354, 1265476890672672818, 1264622039642257461);
INSERT INTO "public"."sys_role_menu" VALUES (1304366891506221057, 1265476890672672818, 1264622039642257351);
INSERT INTO "public"."sys_role_menu" VALUES (1304366891925651458, 1265476890672672818, 1264622039642257361);
INSERT INTO "public"."sys_role_menu" VALUES (1304366892345081858, 1265476890672672818, 1264622039642257371);
INSERT INTO "public"."sys_role_menu" VALUES (1304366892764512258, 1265476890672672818, 1264622039642257381);
INSERT INTO "public"."sys_role_menu" VALUES (1304366893183942658, 1265476890672672818, 1264622039642257391);
INSERT INTO "public"."sys_role_menu" VALUES (1304366893607567361, 1265476890672672818, 1264622039642257401);
INSERT INTO "public"."sys_role_menu" VALUES (1304366894031192065, 1265476890672672818, 1264622039642257491);
INSERT INTO "public"."sys_role_menu" VALUES (1304366894446428162, 1265476890672672818, 1264622039642257501);
INSERT INTO "public"."sys_role_menu" VALUES (1304366894865858562, 1265476890672672818, 1264622039642257511);
INSERT INTO "public"."sys_role_menu" VALUES (1304366895285288961, 1265476890672672818, 1264622039642255591);
INSERT INTO "public"."sys_role_menu" VALUES (1304366895708913665, 1265476890672672818, 1264622039642257061);
INSERT INTO "public"."sys_role_menu" VALUES (1304366896132538369, 1265476890672672818, 1264622039642257462);
INSERT INTO "public"."sys_role_menu" VALUES (1304366896556163074, 1265476890672672818, 1264622039642256912);
INSERT INTO "public"."sys_role_menu" VALUES (1304366896979787777, 1265476890672672818, 1264622039642255421);
INSERT INTO "public"."sys_role_menu" VALUES (1304366897399218178, 1265476890672672818, 1264622039642257022);
INSERT INTO "public"."sys_role_menu" VALUES (1304366897827037185, 1265476890672672818, 1264622039642256821);
INSERT INTO "public"."sys_role_menu" VALUES (1304366898242273282, 1265476890672672818, 1264622039642257311);
INSERT INTO "public"."sys_role_menu" VALUES (1304366898670092290, 1265476890672672818, 1264622039642257312);
INSERT INTO "public"."sys_role_menu" VALUES (1304366899089522690, 1265476890672672818, 1264622039642257313);
INSERT INTO "public"."sys_role_menu" VALUES (1304366899508953089, 1265476890672672818, 1264622039642257314);
INSERT INTO "public"."sys_role_menu" VALUES (1304366899932577793, 1265476890672672818, 1264622039642257522);
INSERT INTO "public"."sys_role_menu" VALUES (1304366900352008193, 1265476890672672818, 1264622039642257523);
INSERT INTO "public"."sys_role_menu" VALUES (1304366900771438594, 1265476890672672818, 1264622039642257524);
INSERT INTO "public"."sys_role_menu" VALUES (1304366901190868994, 1265476890672672818, 1264622039642257525);
INSERT INTO "public"."sys_role_menu" VALUES (1304366901610299394, 1265476890672672818, 1264622039642257531);
INSERT INTO "public"."sys_role_menu" VALUES (1304366902033924097, 1265476890672672818, 1264622039642257532);
INSERT INTO "public"."sys_role_menu" VALUES (1307864929906434049, 1265476890672672817, 1264622039642255311);
INSERT INTO "public"."sys_role_menu" VALUES (1307864930338447362, 1265476890672672817, 1264622039642255331);
INSERT INTO "public"."sys_role_menu" VALUES (1307864930753683457, 1265476890672672817, 1264622039642255321);
INSERT INTO "public"."sys_role_menu" VALUES (1307864931181502465, 1265476890672672817, 1264622039642255341);
INSERT INTO "public"."sys_role_menu" VALUES (1307864931596738561, 1265476890672672817, 1264622039642255351);
INSERT INTO "public"."sys_role_menu" VALUES (1307864932020363266, 1265476890672672817, 1264622039642255361);
INSERT INTO "public"."sys_role_menu" VALUES (1307864932439793666, 1265476890672672817, 1264622039642255371);
INSERT INTO "public"."sys_role_menu" VALUES (1307864932863418369, 1265476890672672817, 1264622039642255381);
INSERT INTO "public"."sys_role_menu" VALUES (1307864933287043073, 1265476890672672817, 1264622039642255391);
INSERT INTO "public"."sys_role_menu" VALUES (1307864933706473474, 1265476890672672817, 1264622039642255401);
INSERT INTO "public"."sys_role_menu" VALUES (1307864934130098177, 1265476890672672817, 1264622039642255411);
INSERT INTO "public"."sys_role_menu" VALUES (1307864934553722881, 1265476890672672817, 1264622039642255421);
INSERT INTO "public"."sys_role_menu" VALUES (1307864934973153281, 1265476890672672817, 1264622039642255431);
INSERT INTO "public"."sys_role_menu" VALUES (1307864935392583681, 1265476890672672817, 1264622039642255441);
INSERT INTO "public"."sys_role_menu" VALUES (1307864935820402689, 1265476890672672817, 1264622039642255451);
INSERT INTO "public"."sys_role_menu" VALUES (1307864936239833090, 1265476890672672817, 1264622039642255461);
INSERT INTO "public"."sys_role_menu" VALUES (1307864936663457793, 1265476890672672817, 1264622039642255471);
INSERT INTO "public"."sys_role_menu" VALUES (1307864937087082498, 1265476890672672817, 1264622039642255481);
INSERT INTO "public"."sys_role_menu" VALUES (1307864937506512898, 1265476890672672817, 1264622039642255491);
INSERT INTO "public"."sys_role_menu" VALUES (1307864937938526210, 1265476890672672817, 1264622039642255501);
INSERT INTO "public"."sys_role_menu" VALUES (1307864938357956610, 1265476890672672817, 1264622039642255511);
INSERT INTO "public"."sys_role_menu" VALUES (1307864938777387010, 1265476890672672817, 1264622039642255521);
INSERT INTO "public"."sys_role_menu" VALUES (1307864939201011713, 1265476890672672817, 1264622039642255531);
INSERT INTO "public"."sys_role_menu" VALUES (1307864939624636418, 1265476890672672817, 1264622039642255541);
INSERT INTO "public"."sys_role_menu" VALUES (1307864940044066817, 1265476890672672817, 1264622039642255551);
INSERT INTO "public"."sys_role_menu" VALUES (1307864940467691522, 1265476890672672817, 1264622039642255561);
INSERT INTO "public"."sys_role_menu" VALUES (1307864940933259265, 1265476890672672817, 1264622039642255571);
INSERT INTO "public"."sys_role_menu" VALUES (1307864941356883970, 1265476890672672817, 1264622039642255581);
INSERT INTO "public"."sys_role_menu" VALUES (1307864941776314369, 1265476890672672817, 1264622039642255591);
INSERT INTO "public"."sys_role_menu" VALUES (1307864942195744769, 1265476890672672817, 1264622039642255601);
INSERT INTO "public"."sys_role_menu" VALUES (1307864942619369473, 1265476890672672817, 1264622039642255621);
INSERT INTO "public"."sys_role_menu" VALUES (1307864943042994178, 1265476890672672817, 1264622039642255631);
INSERT INTO "public"."sys_role_menu" VALUES (1307864943462424577, 1265476890672672817, 1264622039642255641);
INSERT INTO "public"."sys_role_menu" VALUES (1307864943886049282, 1265476890672672817, 1264622039642255651);
INSERT INTO "public"."sys_role_menu" VALUES (1307864944309673986, 1265476890672672817, 1264622039642255661);
INSERT INTO "public"."sys_role_menu" VALUES (1307864944733298690, 1265476890672672817, 1264622039642255611);
INSERT INTO "public"."sys_role_menu" VALUES (1307864945156923393, 1265476890672672817, 1264622039642257321);
INSERT INTO "public"."sys_role_menu" VALUES (1307864945576353793, 1265476890672672817, 1264622039642257331);
INSERT INTO "public"."sys_role_menu" VALUES (1307864945999978497, 1265476890672672817, 1264622039642257471);
INSERT INTO "public"."sys_role_menu" VALUES (1307864946423603201, 1265476890672672817, 1264622039642257481);
INSERT INTO "public"."sys_role_menu" VALUES (1307864946847227905, 1265476890672672817, 1264622039642257341);
INSERT INTO "public"."sys_role_menu" VALUES (1307864947266658305, 1265476890672672817, 1264622039642257411);
INSERT INTO "public"."sys_role_menu" VALUES (1307864947681894402, 1265476890672672817, 1264622039642257421);
INSERT INTO "public"."sys_role_menu" VALUES (1307864948109713409, 1265476890672672817, 1264622039642257431);
INSERT INTO "public"."sys_role_menu" VALUES (1307864948529143810, 1265476890672672817, 1264622039642257441);
INSERT INTO "public"."sys_role_menu" VALUES (1307864948952768513, 1265476890672672817, 1264622039642257451);
INSERT INTO "public"."sys_role_menu" VALUES (1307864949380587522, 1265476890672672817, 1264622039642257461);
INSERT INTO "public"."sys_role_menu" VALUES (1307864949804212225, 1265476890672672817, 1264622039642257351);
INSERT INTO "public"."sys_role_menu" VALUES (1307864950223642626, 1265476890672672817, 1264622039642257361);
INSERT INTO "public"."sys_role_menu" VALUES (1307864950638878721, 1265476890672672817, 1264622039642257371);
INSERT INTO "public"."sys_role_menu" VALUES (1307864951066697729, 1265476890672672817, 1264622039642257381);
INSERT INTO "public"."sys_role_menu" VALUES (1307864951490322433, 1265476890672672817, 1264622039642257391);
INSERT INTO "public"."sys_role_menu" VALUES (1307864951913947137, 1265476890672672817, 1264622039642257401);
INSERT INTO "public"."sys_role_menu" VALUES (1307864952329183233, 1265476890672672817, 1264622039642257491);
INSERT INTO "public"."sys_role_menu" VALUES (1307864952757002241, 1265476890672672817, 1264622039642257501);
INSERT INTO "public"."sys_role_menu" VALUES (1307864953176432642, 1265476890672672817, 1264622039642257511);
INSERT INTO "public"."sys_role_menu" VALUES (1307864953600057346, 1265476890672672817, 1264622039642256831);
INSERT INTO "public"."sys_role_menu" VALUES (1307864954019487746, 1265476890672672817, 1264622039642257031);
INSERT INTO "public"."sys_role_menu" VALUES (1307864954447306754, 1265476890672672817, 1264622039642257021);
INSERT INTO "public"."sys_role_menu" VALUES (1307864954870931458, 1265476890672672817, 1264622039642257061);
INSERT INTO "public"."sys_role_menu" VALUES (1307864955290361857, 1265476890672672817, 1264622039642257261);
INSERT INTO "public"."sys_role_menu" VALUES (1307864955709792258, 1265476890672672817, 1264622039642257301);
INSERT INTO "public"."sys_role_menu" VALUES (1307864956133416962, 1265476890672672817, 1264622039642257271);
INSERT INTO "public"."sys_role_menu" VALUES (1307864956557041665, 1265476890672672817, 1264622039642257462);
INSERT INTO "public"."sys_role_menu" VALUES (1307864956976472066, 1265476890672672817, 1264622039642256912);
INSERT INTO "public"."sys_role_menu" VALUES (1307864957400096770, 1265476890672672817, 1264622039642255911);
INSERT INTO "public"."sys_role_menu" VALUES (1307864957861470210, 1265476890672672817, 1264622039642257522);
INSERT INTO "public"."sys_role_menu" VALUES (1307864958280900610, 1265476890672672817, 1264622039642257523);
INSERT INTO "public"."sys_role_menu" VALUES (1307864958704525314, 1265476890672672817, 1264622039642257524);
INSERT INTO "public"."sys_role_menu" VALUES (1307864959132344321, 1265476890672672817, 1264622039642257525);
INSERT INTO "public"."sys_role_menu" VALUES (1307864959555969026, 1265476890672672817, 1264622039642257532);
INSERT INTO "public"."sys_role_menu" VALUES (1307864959975399425, 1265476890672672817, 1264622039642257531);
INSERT INTO "public"."sys_role_menu" VALUES (1307864960399024129, 1265476890672672817, 1264622039642257311);
INSERT INTO "public"."sys_role_menu" VALUES (1307864960822648833, 1265476890672672817, 1264622039642257312);
INSERT INTO "public"."sys_role_menu" VALUES (1307864961242079233, 1265476890672672817, 1264622039642257313);
INSERT INTO "public"."sys_role_menu" VALUES (1307864961657315330, 1265476890672672817, 1264622039642257314);
INSERT INTO "public"."sys_role_menu" VALUES (1307864962085134337, 1265476890672672817, 1264622039642256821);
INSERT INTO "public"."sys_role_menu" VALUES (1307864962504564737, 1265476890672672817, 1264622039642257022);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_sms";
CREATE TABLE "public"."sys_sms" (
  "id" int8 NOT NULL,
  "phone_numbers" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "validate_code" varchar(255) COLLATE "pg_catalog"."default",
  "template_code" varchar(255) COLLATE "pg_catalog"."default",
  "biz_id" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "source" int2 NOT NULL,
  "invalid_time" timestamp(6),
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_sms"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_sms"."phone_numbers" IS '手机号';
COMMENT ON COLUMN "public"."sys_sms"."validate_code" IS '短信验证码';
COMMENT ON COLUMN "public"."sys_sms"."template_code" IS '短信模板ID';
COMMENT ON COLUMN "public"."sys_sms"."biz_id" IS '回执id，可根据该id查询具体的发送状态';
COMMENT ON COLUMN "public"."sys_sms"."status" IS '发送状态（字典 0 未发送，1 发送成功，2 发送失败，3 失效）';
COMMENT ON COLUMN "public"."sys_sms"."source" IS '来源（字典 1 app， 2 pc， 3 其他）';
COMMENT ON COLUMN "public"."sys_sms"."invalid_time" IS '失效时间';
COMMENT ON COLUMN "public"."sys_sms"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_sms"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_sms"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_sms"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_sms" IS '短信信息发送表';

-- ----------------------------
-- Records of sys_sms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_timers
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_timers";
CREATE TABLE "public"."sys_timers" (
  "id" int8 NOT NULL,
  "timer_name" varchar(255) COLLATE "pg_catalog"."default",
  "action_class" varchar(255) COLLATE "pg_catalog"."default",
  "cron" varchar(255) COLLATE "pg_catalog"."default",
  "job_status" int2,
  "remark" varchar(1000) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_timers"."id" IS '定时器id';
COMMENT ON COLUMN "public"."sys_timers"."timer_name" IS '任务名称';
COMMENT ON COLUMN "public"."sys_timers"."action_class" IS '执行任务的class的类名（实现了TimerTaskRunner接口的类的全称）';
COMMENT ON COLUMN "public"."sys_timers"."cron" IS '定时任务表达式';
COMMENT ON COLUMN "public"."sys_timers"."job_status" IS '状态（字典 1运行  2停止）';
COMMENT ON COLUMN "public"."sys_timers"."remark" IS '备注信息';
COMMENT ON COLUMN "public"."sys_timers"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_timers"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_timers"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_timers"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_timers" IS '定时任务';

-- ----------------------------
-- Records of sys_timers
-- ----------------------------
INSERT INTO "public"."sys_timers" VALUES (1288760324837851137, '定时同步缓存常量', 'com.mch.sys.modular.timer.tasks.RefreshConstantsTaskRunner', '0 0/1 * * * ?', 1, '定时同步sys_config表的数据到缓存常量中', '2020-07-30 16:56:20', 1265476890672672808, '2020-07-30 16:58:52', 1265476890672672808);
INSERT INTO "public"."sys_timers" VALUES (1304971718170832898, '定时打印一句话', 'com.mch.sys.modular.timer.tasks.SystemOutTaskRunner', '0 0 * * * ? *', 2, '定时打印一句话', '2020-09-13 10:34:37', 1265476890672672808, '2020-09-23 20:37:48', 1265476890672672808);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" int8 NOT NULL,
  "account" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "nick_name" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "avatar" int8,
  "birthday" date,
  "sex" int2 NOT NULL,
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "tel" varchar(50) COLLATE "pg_catalog"."default",
  "last_login_ip" varchar(100) COLLATE "pg_catalog"."default",
  "last_login_time" timestamp(6),
  "admin_type" int2 NOT NULL DEFAULT 0,
  "status" int2 NOT NULL DEFAULT 0,
  "create_time" timestamp(6),
  "create_user" int8,
  "update_time" timestamp(6),
  "update_user" int8
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user"."account" IS '账号';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."name" IS '姓名';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像';
COMMENT ON COLUMN "public"."sys_user"."birthday" IS '生日';
COMMENT ON COLUMN "public"."sys_user"."sex" IS '性别(字典 1男 2女 3未知)';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."phone" IS '手机';
COMMENT ON COLUMN "public"."sys_user"."tel" IS '电话';
COMMENT ON COLUMN "public"."sys_user"."last_login_ip" IS '最后登陆IP';
COMMENT ON COLUMN "public"."sys_user"."last_login_time" IS '最后登陆时间';
COMMENT ON COLUMN "public"."sys_user"."admin_type" IS '管理员类型（0超级管理员 1非管理员）';
COMMENT ON COLUMN "public"."sys_user"."status" IS '状态（字典 0正常 1冻结 2删除）';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."create_user" IS '创建人';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user"."update_user" IS '更新人';
COMMENT ON TABLE "public"."sys_user" IS '系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (1265476890672672808, 'superAdmin', '$2a$09$PiCiFNspSlTBE9CakVs8ZOqx0xa03X9wOm01gMasHch4929TpEWCC', '超级管理员', '超级管理员', NULL, '2020-03-18', 1, 'superAdmin@qq.com', '15228937093', '1234567890', '127.0.0.1', '2020-12-25 20:24:27', 1, 0, '2020-05-29 16:39:28', -1, '2020-12-25 20:24:27', -1);
INSERT INTO "public"."sys_user" VALUES (1275735541155614721, 'yubaoshan', '$2a$09$PiCiFNspSlTBE9CakVs8ZOqx0xa03X9wOm01gMasHch4929TpEWCC', '俞宝山', '俞宝山', NULL, '1992-10-03', 1, 'await183@qq.com', '18200001102', '', '127.0.0.1', '2020-09-23 10:15:10', 2, 0, '2020-06-24 18:20:30', 1265476890672672808, '2020-09-23 10:15:10', -1);
INSERT INTO "public"."sys_user" VALUES (1280709549107552257, 'xuyuxiang', '$2a$09$PiCiFNspSlTBE9CakVs8ZOqx0xa03X9wOm01gMasHch4929TpEWCC', '就是那个锅', '徐玉祥', NULL, '2020-07-01', 1, NULL, '18200001100', NULL, '127.0.0.1', '2020-09-23 10:16:54', 2, 0, '2020-07-08 11:45:26', 1265476890672672808, '2020-09-23 10:16:54', -1);

-- ----------------------------
-- Table structure for sys_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_data_scope";
CREATE TABLE "public"."sys_user_data_scope" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "org_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_data_scope"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user_data_scope"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."sys_user_data_scope"."org_id" IS '机构id';
COMMENT ON TABLE "public"."sys_user_data_scope" IS '系统用户数据范围表';

-- ----------------------------
-- Records of sys_user_data_scope
-- ----------------------------
INSERT INTO "public"."sys_user_data_scope" VALUES (1277459951742840834, 1266277099455635457, 1265476890672672770);
INSERT INTO "public"."sys_user_data_scope" VALUES (1277459952577507330, 1266277099455635457, 1265476890672672773);
INSERT INTO "public"."sys_user_data_scope" VALUES (1277459953424756737, 1266277099455635457, 1265476890672672775);
INSERT INTO "public"."sys_user_data_scope" VALUES (1277459954267811841, 1266277099455635457, 1265476890672672774);
INSERT INTO "public"."sys_user_data_scope" VALUES (1280712071570366466, 1275735541155614721, 1265476890672672769);
INSERT INTO "public"."sys_user_data_scope" VALUES (1280712071570366467, 1275735541155614721, 1265476890672672771);
INSERT INTO "public"."sys_user_data_scope" VALUES (1280712071578755074, 1275735541155614721, 1265476890672672772);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色id';
COMMENT ON TABLE "public"."sys_user_role" IS '系统用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "public"."sys_user_role" VALUES (1283596900713574402, 1275735541155614721, 1265476890672672817);
INSERT INTO "public"."sys_user_role" VALUES (1283596949627547649, 1280709549107552257, 1265476890672672818);

-- ----------------------------
-- Table structure for sys_vis_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_vis_log";
CREATE TABLE "public"."sys_vis_log" (
  "id" int8 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "success" char(1) COLLATE "pg_catalog"."default",
  "message" text COLLATE "pg_catalog"."default",
  "ip" varchar(255) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "browser" varchar(255) COLLATE "pg_catalog"."default",
  "os" varchar(255) COLLATE "pg_catalog"."default",
  "vis_type" int2 NOT NULL,
  "vis_time" timestamp(6),
  "account" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_vis_log"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_vis_log"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_vis_log"."success" IS '是否执行成功（Y-是，N-否）';
COMMENT ON COLUMN "public"."sys_vis_log"."message" IS '具体消息';
COMMENT ON COLUMN "public"."sys_vis_log"."ip" IS 'ip';
COMMENT ON COLUMN "public"."sys_vis_log"."location" IS '地址';
COMMENT ON COLUMN "public"."sys_vis_log"."browser" IS '浏览器';
COMMENT ON COLUMN "public"."sys_vis_log"."os" IS '操作系统';
COMMENT ON COLUMN "public"."sys_vis_log"."vis_type" IS '操作类型（字典 1登入 2登出）';
COMMENT ON COLUMN "public"."sys_vis_log"."vis_time" IS '访问时间';
COMMENT ON COLUMN "public"."sys_vis_log"."account" IS '访问账号';
COMMENT ON TABLE "public"."sys_vis_log" IS '系统访问日志表';

-- ----------------------------
-- Records of sys_vis_log
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_app
-- ----------------------------
ALTER TABLE "public"."sys_app" ADD CONSTRAINT "sys_app_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_area
-- ----------------------------
CREATE INDEX "idx_parent_code" ON "public"."sys_area" USING btree (
  "parent_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "uk_code" ON "public"."sys_area" USING btree (
  "area_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_area
-- ----------------------------
ALTER TABLE "public"."sys_area" ADD CONSTRAINT "sys_area_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_code_generate
-- ----------------------------
ALTER TABLE "public"."sys_code_generate" ADD CONSTRAINT "sys_code_generate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_code_generate_config
-- ----------------------------
ALTER TABLE "public"."sys_code_generate_config" ADD CONSTRAINT "sys_code_generate_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "sys_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE "public"."sys_dict_data" ADD CONSTRAINT "sys_dict_data_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_emp
-- ----------------------------
ALTER TABLE "public"."sys_emp" ADD CONSTRAINT "sys_emp_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_emp_ext_org_pos
-- ----------------------------
ALTER TABLE "public"."sys_emp_ext_org_pos" ADD CONSTRAINT "sys_emp_ext_org_pos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_emp_pos
-- ----------------------------
ALTER TABLE "public"."sys_emp_pos" ADD CONSTRAINT "sys_emp_pos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_file_info
-- ----------------------------
ALTER TABLE "public"."sys_file_info" ADD CONSTRAINT "sys_file_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_notice_user
-- ----------------------------
ALTER TABLE "public"."sys_notice_user" ADD CONSTRAINT "sys_notice_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_oauth_user
-- ----------------------------
ALTER TABLE "public"."sys_oauth_user" ADD CONSTRAINT "sys_oauth_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_op_log
-- ----------------------------
ALTER TABLE "public"."sys_op_log" ADD CONSTRAINT "sys_op_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_org
-- ----------------------------
ALTER TABLE "public"."sys_org" ADD CONSTRAINT "sys_org_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_pos
-- ----------------------------
CREATE INDEX "CODE_UNI" ON "public"."sys_pos" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_pos
-- ----------------------------
ALTER TABLE "public"."sys_pos" ADD CONSTRAINT "sys_pos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_data_scope
-- ----------------------------
ALTER TABLE "public"."sys_role_data_scope" ADD CONSTRAINT "sys_role_data_scope_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_sms
-- ----------------------------
ALTER TABLE "public"."sys_sms" ADD CONSTRAINT "sys_sms_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_timers
-- ----------------------------
ALTER TABLE "public"."sys_timers" ADD CONSTRAINT "sys_timers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_data_scope
-- ----------------------------
ALTER TABLE "public"."sys_user_data_scope" ADD CONSTRAINT "sys_user_data_scope_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_vis_log
-- ----------------------------
ALTER TABLE "public"."sys_vis_log" ADD CONSTRAINT "sys_vis_log_pkey" PRIMARY KEY ("id");
