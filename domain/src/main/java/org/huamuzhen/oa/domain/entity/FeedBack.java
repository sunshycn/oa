package org.huamuzhen.oa.domain.entity;

import java.sql.Timestamp;

public class FeedBack extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String orgUnitId;
	private String reportFormId;
	private String content;
	private Timestamp feedBackDate;
	private String signature;
	private boolean pass;
	
	
	

}
