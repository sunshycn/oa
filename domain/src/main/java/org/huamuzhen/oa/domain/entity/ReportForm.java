package org.huamuzhen.oa.domain.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class ReportForm extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String title;
	private String matter;
	private String formId;
	private Timestamp formDate;
	private String landUser;
	private String originalLandUser;
	private String landLocation;
	private String landArea;
	private String landUse;
	private String originalLandUse;
	private String matterDetail;
	private String policyBasis;
	private String comment;
	private String responsiblePerson;
	private String auditor;
	private String tabulator;
	private String referredReportFormId;
	
	//报审单位
	private OrgUnit reportOrgUnit;
	//意见
	private Set<FeedBack> feedbacks = new HashSet<FeedBack>(0);
	
	
	

}
