package org.huamuzhen.oa.domain.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Org_Unit")
public class OrgUnit extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "org.huamuzhen.oa.domain.util.IdGenerator")
	@Column(name="id", unique = true, nullable = false, length = 36)
	private String id;
	
	@Column(name="parent_id", length = 36)
	private String parentId;
	
	@Column(name="name", unique = true, nullable = false, length = 20)
	private String name;
	
	@Column(name="description", length = 500)
	private String description;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "parent_id", insertable = false, updatable = false)
	private Set<OrgUnit> childOrgUnits = new HashSet<OrgUnit>(0);
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<OrgUnit> getChildOrgUnits() {
		return childOrgUnits;
	}
	public void setChildOrgUnits(Set<OrgUnit> childOrgUnits) {
		this.childOrgUnits = childOrgUnits;
	}
	
}
