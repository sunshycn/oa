package org.huamuzhen.oa.domain.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.huamuzhen.oa.domain.enumeration.ReportFormStatus;

@Entity
@Table(name="Report_Form")
public class ReportForm extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "org.huamuzhen.oa.domain.util.IdGenerator")
	@Column(name="id", unique = true, nullable = false, length = 36)
	private String id;
	
	@ManyToOne
	@JoinColumn(name = "form_type_id")
	private ReportFormType reportFormType;
	
	@Column(name="title", length = 20)
	private String title;
	
	@Column(name="form_id", length = 15)
	private String formId;
	
	@Column(name="send_date")
	private Timestamp sendDate;
	
	@Column(name="land_user", length = 30)
	private String landUser;
	
	@Column(name="original_land_user", length = 30)
	private String originalLandUser;
	
	@Column(name="land_location", length = 40)
	private String landLocation;
	
	@Column(name="land_area", length = 24)
	private String landArea;
	
	@Column(name="land_use", length = 10)
	private String landUse;
	
	@Column(name="original_land_use", length = 10)
	private String originalLandUse;
	
	@Column(name="matter", length = 20)
	private String matter;
	
	@Column(name="matter_detail", length = 1000)
	private String matterDetail;
	
	@Column(name="policy_basis", length = 500)
	private String policyBasis;
	
	@Column(name="comment", length = 500)
	private String comment;
	
	@Column(name="responsible_person", length = 6)
	private String responsiblePerson;
	
	@Column(name="auditor", length = 6)
	private String auditor;
	
	@Column(name="tabulator", length = 6)
	private String tabulator;
	
	@Column(name="referred_report_form_id", length = 36)
	private String referredReportFormId;
	
	@Column(name="status", length=20)
	@Enumerated(EnumType.STRING)
	private ReportFormStatus status = ReportFormStatus.NOT_SEND;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ReportFormType getReportFormType() {
		return reportFormType;
	}

	public void setReportFormType(ReportFormType reportFormType) {
		this.reportFormType = reportFormType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public Timestamp getSendDate() {
		return sendDate;
	}

	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}

	public String getLandUser() {
		return landUser;
	}

	public void setLandUser(String landUser) {
		this.landUser = landUser;
	}

	public String getOriginalLandUser() {
		return originalLandUser;
	}

	public void setOriginalLandUser(String originalLandUser) {
		this.originalLandUser = originalLandUser;
	}

	public String getLandLocation() {
		return landLocation;
	}

	public void setLandLocation(String landLocation) {
		this.landLocation = landLocation;
	}

	public String getLandArea() {
		return landArea;
	}

	public void setLandArea(String landArea) {
		this.landArea = landArea;
	}

	public String getLandUse() {
		return landUse;
	}

	public void setLandUse(String landUse) {
		this.landUse = landUse;
	}

	public String getOriginalLandUse() {
		return originalLandUse;
	}

	public void setOriginalLandUse(String originalLandUse) {
		this.originalLandUse = originalLandUse;
	}

	public String getMatter() {
		return matter;
	}

	public void setMatter(String matter) {
		this.matter = matter;
	}

	public String getMatterDetail() {
		return matterDetail;
	}

	public void setMatterDetail(String matterDetail) {
		this.matterDetail = matterDetail;
	}

	public String getPolicyBasis() {
		return policyBasis;
	}

	public void setPolicyBasis(String policyBasis) {
		this.policyBasis = policyBasis;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getResponsiblePerson() {
		return responsiblePerson;
	}

	public void setResponsiblePerson(String responsiblePerson) {
		this.responsiblePerson = responsiblePerson;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	public String getTabulator() {
		return tabulator;
	}

	public void setTabulator(String tabulator) {
		this.tabulator = tabulator;
	}

	public String getReferredReportFormId() {
		return referredReportFormId;
	}

	public void setReferredReportFormId(String referredReportFormId) {
		this.referredReportFormId = referredReportFormId;
	}

	public ReportFormStatus getStatus() {
		return status;
	}

	public void setStatus(ReportFormStatus status) {
		this.status = status;
	}
	
}
