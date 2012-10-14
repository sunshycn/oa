package org.huamuzhen.oa.domain.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Report_Form_Type")
public class ReportFormType extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "org.huamuzhen.oa.domain.util.IdGenerator")
	@Column(name="id", unique = true, nullable = false, length = 36)
	private String id;
	
	@Column(name="name", unique = true, nullable = false, length = 100)
	private String name;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="Report_Form_Type_Org_Unit",
	joinColumns={@JoinColumn(name="report_form_type_id",referencedColumnName="id")},
	inverseJoinColumns={@JoinColumn(name="org_unit_id",referencedColumnName="id")})
	private Set<OrgUnit> requiredOrgUnits = new HashSet<OrgUnit>(0);

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<OrgUnit> getRequiredOrgUnits() {
		return requiredOrgUnits;
	}

	public void setRequiredOrgUnits(Set<OrgUnit> requiredOrgUnits) {
		this.requiredOrgUnits = requiredOrgUnits;
	}
	
}
