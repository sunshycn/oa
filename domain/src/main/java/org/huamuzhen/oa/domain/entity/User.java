package org.huamuzhen.oa.domain.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.huamuzhen.oa.domain.enumeration.Privilege;

@Entity
@Table(name="User")
public class User extends BaseEntity{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "org.huamuzhen.oa.domain.util.IdGenerator")
	@Column(name="id", unique = true, nullable = false, length = 36)
	private String id;
	
	@Column(name="username", unique = true, nullable = false, length = 100)
	private String username;
	
	@Column(name="description", length = 500)
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "org_unit_id")
	private OrgUnit orgUnit;
	
	@Column(name="privilege", length=20)
	@Enumerated(EnumType.STRING)
	private Privilege privilege = Privilege.NORMAL;
	
	@Column(name="hashed_password", length = 36)
	private String hashedPassword;
	
	@Column(name="hash_salt", length = 10)
	private String hashSalt;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="User_Report_Form_Type",
	joinColumns={@JoinColumn(name="user_id",referencedColumnName="id")},
	inverseJoinColumns={@JoinColumn(name="report_form_type_id",referencedColumnName="id")})
	private Set<ReportFormType> supportedReportFormTypes = new HashSet<ReportFormType>(0);
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHashedPassword() {
		return hashedPassword;
	}
	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword = hashedPassword;
	}
	public String getHashSalt() {
		return hashSalt;
	}
	public void setHashSalt(String hashSalt) {
		this.hashSalt = hashSalt;
	}
	public OrgUnit getOrgUnit() {
		return orgUnit;
	}
	public void setOrgUnit(OrgUnit orgUnit) {
		this.orgUnit = orgUnit;
	}
	public Privilege getPrivilege() {
		return privilege;
	}
	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}
	public Set<ReportFormType> getSupportedReportFormTypes() {
		return supportedReportFormTypes;
	}
	public void setSupportedReportFormTypes(
			Set<ReportFormType> supportedReportFormTypes) {
		this.supportedReportFormTypes = supportedReportFormTypes;
	}
}
