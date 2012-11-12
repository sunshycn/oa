DROP TABLE IF EXISTS Report_Form_Type_Org_Unit CASCADE;
DROP TABLE IF EXISTS User_Report_Form_Type CASCADE;
DROP TABLE IF EXISTS Feedback CASCADE;
DROP TABLE IF EXISTS Report_Form CASCADE;
DROP TABLE IF EXISTS Report_Form_Type CASCADE;
DROP TABLE IF EXISTS User CASCADE;
DROP TABLE IF EXISTS Org_Unit CASCADE;
DROP TABLE IF EXISTS Report_Form_Matter CASCADE;
DROP TABLE IF EXISTS Key_Value_Pair CASCADE;
DROP TABLE IF EXISTS Message CASCADE;

CREATE TABLE Org_Unit 
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (20) NOT NULL UNIQUE,
	description VARCHAR (500),
	parent_id VARCHAR (36),
	created_at TIMESTAMP,
	modified_at TIMESTAMP
)default charset=utf8;


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
)default charset=utf8;


CREATE TABLE Report_Form_Type
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (30) NOT NULL UNIQUE,
	created_at TIMESTAMP,
    modified_at TIMESTAMP
)default charset=utf8;


CREATE TABLE Report_Form
(
	  id VARCHAR (36) NOT NULL PRIMARY KEY,
	  form_type_id VARCHAR (36) NOT NULL,
	  title VARCHAR (30) NOT NULL,
	  form_id VARCHAR (15) NOT NULL UNIQUE,
	  send_time TIMESTAMP,
	  deadline_time TIMESTAMP,
	  land_user VARCHAR (30),
	  original_land_user VARCHAR (30),
	  land_location VARCHAR (50),
	  land_area DECIMAL (15,5),
	  land_area_measure VARCHAR (15),
	  land_use VARCHAR (30),
	  original_land_use VARCHAR (30),
	  matter VARCHAR (30),
	  matter_detail VARCHAR (1000),
	  policy_basis VARCHAR (500),
	  comment VARCHAR (500),
	  responsible_person VARCHAR (10),
	  auditor VARCHAR (10),
	  tabulator VARCHAR (10),
	  referred_report_form_id VARCHAR (36),
	  current_sender_id VARCHAR (36),
	  current_receiver_id VARCHAR (36),
	  creator_id VARCHAR (36) NOT NULL,
	  status VARCHAR(30) NOT NULL,
	  created_at TIMESTAMP,
      modified_at TIMESTAMP,
	  CONSTRAINT FORM_FT FOREIGN KEY (form_type_id) REFERENCES Report_Form_Type (id)
)default charset=utf8;


CREATE TABLE Feedback
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	report_form_id VARCHAR (36) NOT NULL,
	owner VARCHAR (50) NOT NULL,
	response_org_unit_id VARCHAR (36),
	content VARCHAR (150),
	feedback_time TIMESTAMP,
	signature VARCHAR (10),
	agree BOOLEAN,
	created_at TIMESTAMP,
    modified_at TIMESTAMP,
	CONSTRAINT FK_FEEDBACK_FORM FOREIGN KEY (report_form_id) REFERENCES Report_Form (id)	
)default charset=utf8;

CREATE TABLE Report_Form_Type_Org_Unit
(
	report_form_type_id VARCHAR (36) NOT NULL,
	org_unit_id VARCHAR (36) NOT NULL
)default charset=utf8;

CREATE TABLE User_Report_Form_Type
(
	user_id VARCHAR (36) NOT NULL,
	report_form_type_id VARCHAR (36) NOT NULL
)default charset=utf8;

CREATE TABLE Report_Form_Matter
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (20) NOT NULL UNIQUE,
	created_at TIMESTAMP,
    modified_at TIMESTAMP
)default charset=utf8;

CREATE TABLE Key_Value_Pair
(
	key VARCHAR(30) NOT NULL PRIMARY KEY,
	value VARCHAR(30) NOT NULL
)default charset=utf8;

CREATE TABLE Message
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	receiver_id VARCHAR(36) NOT NULL,
	messsage VARCHAR(100),
	created_at TIMESTAMP,
    modified_at TIMESTAMP
)default charset=utf8;

INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('ce7447d8dd5a4f8e980d7dcd870e7b06', 'admin', 'admin', '90d84b5b96d0e1f1bc1a699d055f53587b52c474', '4371', 'ADMIN', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Key_Value_Pair (key,value) VALUES ('deadlineDuration','3');