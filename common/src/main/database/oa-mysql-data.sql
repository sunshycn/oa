
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


INSERT INTO Report_Form_Type (id, name, created_at, modified_at) VALUES ('de9f2dada8b241a2b28f8a0b3c4a4cea', '赣州市国土资源局章贡分局建设用地报审表', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Report_Form_Type (id, name, created_at, modified_at) VALUES ('d319eb43e0b04d85afc1232ad126a4c6', '赣州市国土资源局开发区分局建设用地报审表', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO Report_Form_Type (id, name, created_at, modified_at) VALUES ('a415ba3ad95d414a8370a599faa0de1b', '赣州市土地收储中心建设用地报审表', '2000-01-01 12:00:00', '2000-01-01 12:00:00');


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

---测试报审表
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('1','测试报审表1', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150001-00', 'faa65617bdbf4745bcacd6b546515681', 'SENT_TO_ORG_UNITS', '2012-10-15 11:00:00','2012-10-15 11:00:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('2','测试报审表2', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150999-00', 'faa65617bdbf4745bcacd6b546515681', 'NOT_SEND', '2012-10-15 11:30:00','2012-10-15 11:30:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('3','测试报审表3', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150002-00', 'faa65617bdbf4745bcacd6b546515681', 'GOT_REPLY_FROM_UNITS', '2012-10-15 11:00:00','2012-10-15 11:00:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('4','测试报审表4', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150998-00', 'faa65617bdbf4745bcacd6b546515681', 'SENT_TO_LEADER1', '2012-10-15 11:30:00','2012-10-15 11:30:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('5','测试报审表5', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150003-00', 'faa65617bdbf4745bcacd6b546515681', 'SENT_TO_LEADER2', '2012-10-15 11:00:00','2012-10-15 11:00:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('6','测试报审表6', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150997-00', 'faa65617bdbf4745bcacd6b546515681', 'SENT_TO_OFFICE', '2012-10-15 11:30:00','2012-10-15 11:30:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('7','测试报审表7', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150004-00', 'faa65617bdbf4745bcacd6b546515681', 'PASSED', '2012-10-15 11:00:00','2012-10-15 11:00:00');
INSERT INTO Report_Form (id, title, form_type_id, form_id, creator_id, status, created_at, modified_at) VALUES ('8','测试报审表8', 'de9f2dada8b241a2b28f8a0b3c4a4cea', '201210150995-00', 'faa65617bdbf4745bcacd6b546515681', 'DENIED', '2012-10-15 11:30:00','2012-10-15 11:30:00');

INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('0e1a9ba9f2d248c6acbdd7ec1bf864ee', '监察支队', '监察支队默认用户', 'b1b59a3ea43f2daae0631243fbdd05e0bf6fe4db', '3285', '7118f30734384741b63a78f1dfaa26dd', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('3c464bef18814b4084e24fda1e8af2be', '耕保科', '默认耕保科用户', '23f98ba5518bf02e14846d377df705ea524b9538', '1819', '2b66601e2ee1479ba3ab7c40ab8e494b', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('4bd5f6e4cf4c428aaf0a6dd2ac2e8d83', '法规科', '法规科默认用户', '096a7593ebd0caaa7d98981869573f9dc7632c71', '718', '295b32756c74443d88ac972e0721a31f', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('5e8a8b85c181430db4a178fa40ca3b43', '利用科', '利用科默认用户', '1d71394d5600ccc8cc7203c6b0846fc1c012822c', '8639', '8981398f27cc48c88072ae777fd2b626', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('a65e1507da33471bb112d4f2bc94bdc4', '监察室', '监察室默认用户', 'f021fad024deee08ef3aa578265341c857901bd5', '8487', 'e8854fabc731438f9d81bbd59f305fce', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('d95f13c3433d42e5a4c2855fb5fda5ca', '交易中心', '交易中心默认用户', 'a15f74bb3ac12a89e2bd003595b97dbfc50d14d2', '6956', '5ae33b1949be4eaeaa08b219865f0806', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('e64610e37171492ba474b1697e8ed9ee', '地籍科', '地籍科默认用户', 'ba101b608e6657d8534d122274600629213d6144', '5424', '0884aca6bfe847bca0ea0eeff8f1ebcb', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, org_unit_id, privilege,created_at, modified_at) VALUES ('faa65617bdbf4745bcacd6b546515682', '收储中心', '收储中心默认用户', '98539b7045d57a26e44b08dfb47e37910fde0382', '5467', '6e1cc9e0df1e4eeb9ea163723484d6d9', 'DEPARTMENT', '2000-01-01 12:00:00', '2000-01-01 12:00:00');

INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('faa65617bdbf4745bcacd6b546515681', '普通用户', '普通用户', '98539b7045d57a26e44b08dfb47e37910fde0382', '5467', 'NORMAL', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('faa65617bdbf4745bcacd6b546515680', '普通用户2', '普通用户', '98539b7045d57a26e44b08dfb47e37910fde0382', '5467', 'NORMAL', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('292035e08c474840b7c7604650216e64', '分管领导', '我是分管领导', '0089c94464327547db746504ec7baf4c1b9c1d41', '367', 'LEADER1', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('292035e08c474840b7c7604650216e63', '分管领导2', '我是分管领导2', '0089c94464327547db746504ec7baf4c1b9c1d41', '367', 'LEADER1', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('dc5647f19d7540e891927e2f7d4ad402', '主要领导', '我是主要领导', '8b31aed889af092a7788dcc0b820ed04e3bffe1f', '4734', 'LEADER2', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('dc5647f19d7540e891927e2f7d4ad401', '主要领导2', '我是主要领导2', '8b31aed889af092a7788dcc0b820ed04e3bffe1f', '4734', 'LEADER2', '2000-01-01 12:00:00', '2000-01-01 12:00:00');
INSERT INTO User (id, username, description, hashed_password, hash_salt, privilege,created_at, modified_at) VALUES ('0e79b16a28054cbf8c94b7b0a98f68ef', '办公室', '我是办公室', '7df2c434fd5f77a394ea41b3f1b44a7f57179d39', '2960', 'OFFICE', '2000-01-01 12:00:00', '2000-01-01 12:00:00');