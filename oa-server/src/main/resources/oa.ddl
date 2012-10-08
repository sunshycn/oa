--- 组织表
CREATE TABLE Org_Unit
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (100) NOT NULL,
	description VARCHAR (500),
	parent_id VARCHAR (36),
	created_at TIMESTAMP,
	modified_at TIMESTAMP
);

--- 角色表
CREATE TABLE Role
(
	id VARCHAR (36) NOT NULL PRIMARY KEY,
	name VARCHAR (10) NOT NULL,
	description VARCHAR (100),
	privilege VARCHAR (20),
	created_at TIMESTAMP,
    modified_at TIMESTAMP
);

--- 用户表
CREATE TABLE User
 (
     id VARCHAR (36) NOT NULL PRIMARY KEY,
     username VARCHAR (100) NOT NULL,
    description VARCHAR (500), 
    hashed_password VARCHAR (36) NOT NULL,
    hash_salt VARCHAR (10) NOT NULL,
    org_unit_id VARCHAR (36),
    role_id VARCHAR (36),
    created_at TIMESTAMP,
    modified_at TIMESTAMP,
    CONSTRAINT FK_USER_ORG_UNIT FOREIGN KEY (org_unit_id) REFERENCES Org_Unit (id),
    CONSTRAINT FK_USER_ROLE FOREIGN KEY (role_id) REFERENCES Role (id)
);
