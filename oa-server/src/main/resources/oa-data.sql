--- 组织
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('2b66601e2ee1479ba3ab7c40ab8e494b', '耕保科', '这是耕保科', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('8981398f27cc48c88072ae777fd2b626', '利用科', '这是利用科', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('0884aca6bfe847bca0ea0eeff8f1ebcb', '地籍科', '这是地籍科', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('295b32756c74443d88ac972e0721a31f', '法规科', '这是法规科', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('5ae33b1949be4eaeaa08b219865f0806', '交易中心', '这是交易中心', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('6e1cc9e0df1e4eeb9ea163723484d6d9', '收储中心', '这是收储中心', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('7118f30734384741b63a78f1dfaa26dd', '监察支队', '这是监察支队', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('9a65450370734fdfba4edfdee6f2acf3', '开发区分局', '这是开发区分局', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('86b61c41b92d47aea6bb7b4a6263255a', '章贡分局', '这是章贡分局', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('4cc1f771c2e04fd798a0575c6ada6025', '信息中心', '这是信息中心', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('74286610c9cf4a25a1d52fc866a38ac5', '财务科', '这是财务科', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Org_Unit (id, name, description, created_at, modified_at) VALUES ('e8854fabc731438f9d81bbd59f305fce', '监察室', '这是监察室', '2000-01-01 12:00:00', '2000-01-01 12:00:00');


---报审表类型
INSERT INTO Report_Form_Type (id, name, created_at, modified_at) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '赣州市国土资源局章贡分局建设用地报审表', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Report_Form_Type (id, name, created_at, modified_at) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '赣州市国土资源局开发区分局建设用地报审表', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Report_Form_Type (id, name, created_at, modified_at) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '赣州市土地收储中心建设用地报审表', '2000-01-01 12:00:00', '2000-01-01 12:00:00');


---报审表 组织对应
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '2b66601e2ee1479ba3ab7c40ab8e494b');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '8981398f27cc48c88072ae777fd2b626');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '0884aca6bfe847bca0ea0eeff8f1ebcb');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '295b32756c74443d88ac972e0721a31f');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '5ae33b1949be4eaeaa08b219865f0806');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '6e1cc9e0df1e4eeb9ea163723484d6d9');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '7118f30734384741b63a78f1dfaa26dd');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', 'e8854fabc731438f9d81bbd59f305fce');

INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '2b66601e2ee1479ba3ab7c40ab8e494b');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '8981398f27cc48c88072ae777fd2b626');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '0884aca6bfe847bca0ea0eeff8f1ebcb');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '295b32756c74443d88ac972e0721a31f');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '5ae33b1949be4eaeaa08b219865f0806');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '6e1cc9e0df1e4eeb9ea163723484d6d9');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '7118f30734384741b63a78f1dfaa26dd');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', 'e8854fabc731438f9d81bbd59f305fce');

INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '2b66601e2ee1479ba3ab7c40ab8e494b');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '8981398f27cc48c88072ae777fd2b626');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '0884aca6bfe847bca0ea0eeff8f1ebcb');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '295b32756c74443d88ac972e0721a31f');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '5ae33b1949be4eaeaa08b219865f0806');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '7118f30734384741b63a78f1dfaa26dd');
INSERT INTO Report_Form_Type_Org_Unit (report_form_type_id, org_unit_id) VALUES ('a415ba3ad95d414a8370a599faa0de1b', 'e8854fabc731438f9d81bbd59f305fce');