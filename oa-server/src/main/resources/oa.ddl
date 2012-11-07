--- 组织表
CREATE TABLE Org_Unit 
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (20) NOT NULL UNIQUE,
	description VARCHAR (500),
	parent_id VARCHAR (36),
	created_at TIMESTAMP,
	modified_at TIMESTAMP
);

--- 用户表
CREATE TABLE User
 (
     id VARCHAR (36) NOT NULL PRIMARY KEY,
     username VARCHAR (20) NOT NULL UNIQUE,
    description VARCHAR (500), 
    hashed_password VARCHAR (50) NOT NULL,
    hash_salt VARCHAR (10) NOT NULL,
    org_unit_id VARCHAR (36),
    privilege VARCHAR (20),
    created_at TIMESTAMP,
    modified_at TIMESTAMP,
    CONSTRAINT FK_USER_ORG_UNIT FOREIGN KEY (org_unit_id) REFERENCES Org_Unit (id)
);

--- 报审表类型
CREATE TABLE Report_Form_Type
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (30) NOT NULL UNIQUE,
	created_at TIMESTAMP,
    modified_at TIMESTAMP
);

--- 报审表
CREATE TABLE Report_Form
(
	  id VARCHAR (36) NOT NULL PRIMARY KEY,
	  form_type_id VARCHAR (36) NOT NULL,
	  title VARCHAR (20) NOT NULL,
	  form_id VARCHAR (15) NOT NULL UNIQUE,
	  send_time TIMESTAMP,
	  land_user VARCHAR (30),
	  original_land_user VARCHAR (30),
	  land_location VARCHAR (40),
	  land_area DECIMAL (15,3) ,
	  land_area_measure VARCHAR (15),
	  land_use VARCHAR (10),
	  original_land_use VARCHAR (10),
	  matter VARCHAR (20),
	  matter_detail VARCHAR (1000),
	  policy_basis VARCHAR (500),
	  comment VARCHAR (500),
	  responsible_person VARCHAR (6),
	  auditor VARCHAR (6),
	  tabulator VARCHAR (6),
	  referred_report_form_id VARCHAR (36),
	  current_receiver_id VARCHAR (36),
	  creator_id VARCHAR (36) NOT NULL,
	  status VARCHAR(30) NOT NULL,
	  created_at TIMESTAMP,
      modified_at TIMESTAMP,
	  CONSTRAINT FORM_FT FOREIGN KEY (form_type_id) REFERENCES Report_Form_Type (id)
);

--- 回复
CREATE TABLE Feedback
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	report_form_id VARCHAR (36) NOT NULL,
	owner VARCHAR (50) NOT NULL,
	response_org_unit_id VARCHAR (36),
	content VARCHAR (150),
	feedback_time TIMESTAMP,
	signature VARCHAR (6),
	agree BOOLEAN,
	created_at TIMESTAMP,
    modified_at TIMESTAMP,
	CONSTRAINT FK_FEEDBACK_FORM FOREIGN KEY (report_form_id) REFERENCES Report_Form (id)	
);

--- 报审表类型 以及 相应 回复科室
CREATE TABLE Report_Form_Type_Org_Unit
(
	report_form_type_id VARCHAR (36) NOT NULL,
	org_unit_id VARCHAR (36) NOT NULL
);

CREATE TABLE Report_Form_Matter
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (20) NOT NULL UNIQUE,
	created_at TIMESTAMP,
    modified_at TIMESTAMP,
)

---必要数据
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('ce7447d8dd5a4f8e980d7dcd870e7b06', 'admin', 'admin', '90d84b5b96d0e1f1bc1a699d055f53587b52c474', '4371', 'ADMIN', '2000-01-01 12:00:00', '2000-01-01 12:00:00');