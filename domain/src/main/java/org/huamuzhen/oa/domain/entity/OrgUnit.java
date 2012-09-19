package org.huamuzhen.oa.domain.entity;

import java.util.HashSet;
import java.util.Set;

public class OrgUnit extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String parentOrgUnitId;
	private String name;
	private String description;
	private Set<OrgUnit> childOrgUnits = new HashSet<OrgUnit>(0);
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getParentOrgUnitId() {
		return parentOrgUnitId;
	}
	public void setParentOrgUnitId(String parentOrgUnitId) {
		this.parentOrgUnitId = parentOrgUnitId;
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
