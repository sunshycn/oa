package org.huamuzhen.oa.domain.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Feedback")
public class Feedback extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "org.huamuzhen.oa.domain.util.IdGenerator")
	@Column(name="id", unique = true, nullable = false, length = 36)
	private String id;
	
	@Column(name="report_form_id", length = 36)
	private String reportFormId;
	
	@Column(name="owner", length = 50, nullable = false)
	private String owner;
	
	@Column(name="response_org_unit_id", length = 36)
	private String responseOrgUnitId;
	
	@Column(name="content", length = 150)
	private String content;
	
	@Column(name="feedback_time")
	private Timestamp feedbackTime;
	
	@Column(name="signature", length = 6)
	private String signature;
	
	@Column(name="agree")
	private boolean agree;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReportFormId() {
		return reportFormId;
	}

	public void setReportFormId(String reportFormId) {
		this.reportFormId = reportFormId;
	}	

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getResponseOrgUnitId() {
		return responseOrgUnitId;
	}

	public void setResponseOrgUnitId(String responseOrgUnitId) {
		this.responseOrgUnitId = responseOrgUnitId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	

	public Timestamp getFeedbackTime() {
		return feedbackTime;
	}

	public void setFeedbackTime(Timestamp feedbackTime) {
		this.feedbackTime = feedbackTime;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public boolean isAgree() {
		return agree;
	}

	public void setAgree(boolean agree) {
		this.agree = agree;
	}
	
}
