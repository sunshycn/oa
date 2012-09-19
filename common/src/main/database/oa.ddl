
--- 用户表
CREATE TABLE User
 (
     id VARCHAR (36) NOT NULL PRIMARY KEY,
     username VARCHAR (100) NOT NULL,
     description VARCHAR (500), 
     hashed_password VARCHAR (36) NOT NULL,
     hashsalt VARCHAR (10) NOT NULL,
     org_unit_id VARCHAR (36) 
);

--- 组织表
CREATE TABLE Org_Unit
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (100) NOT NULL,
	description VARCHAR (500),
	parent_id VARCHAR (36) 
);

--- 角色表
CREATE TABLE Role
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (10) NOT NULL,
	description VARCHAR (100),
);

--- 权限表
CREATE TABLE Privilege
(
	 id VARCHAR (36) NOT NULL PRIMARY KEY,
	 name VARCHAR(10) NOT NULL,
);

--- 角色权限表
CREATE TABLE Role_Privilege
(
	 id VARCHAR (36) NOT NULL PRIMARY KEY,
	 role_id VARCHAR (36) NOT NULL,
	 privilege_id VARCHAR (36) NOT NULL
);

--- 报审表类型
CREATE TABLE Report_Form_Type
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (100) NOT NULL
);

--- 报审表
CREATE TABLE Report_Form
(
	  id VARCHAR (36) NOT NULL PRIMARY KEY,
	  form_type_id VARCHAR (36) NOT NULL,
	  title VARCHAR (20),
	  form_id VARCHAR (15) NOT NULL,
	  send_date TIMESTAMP,
	  land_user VARCHAR (30),
	  original_land_user VARCHAR (30),
	  land_location VARCHAR (40),
	  land_area VARCHAR (24),
	  land_use VARCHAR (10),
	  original_land_use VARCHAR (10),
	  matter VARCHAR (20),
	  matter_detail VARCHAR (1000),
	  policy_basis VARCHAR (500),
	  comment VARCHAR (500),
	  responsible_person VARCHAR (6),
	  auditor VARCHAR (6),
	  tabulator VARCHAR (6),
	  referred_report_form_id VARCHAR (36)
);

CREATE TABLE Report_Form_Status
(	
	  id VARCHAR (36) NOT NULL PRIMARY KEY,
	  report_form_id VARCHAR (36) NOT NULL,
	  status INTEGER NOT NULL 
);
