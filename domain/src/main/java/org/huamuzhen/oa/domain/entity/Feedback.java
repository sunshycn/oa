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
	
	@Column(name="content", length = 150)
	private String content;
	
	@Column(name="feedback_date")
	private Timestamp feedBackDate;
	
	@Column(name="signature", length = 6)
	private String signature;
	
	@Column(name="complete")
	private boolean complete;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getFeedBackDate() {
		return feedBackDate;
	}

	public void setFeedBackDate(Timestamp feedBackDate) {
		this.feedBackDate = feedBackDate;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public boolean isComplete() {
		return complete;
	}

	public void setComplete(boolean complete) {
		this.complete = complete;
	}
	
}
