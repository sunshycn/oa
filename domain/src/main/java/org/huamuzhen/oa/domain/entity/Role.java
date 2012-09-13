package org.huamuzhen.oa.domain.entity;

import java.util.HashSet;
import java.util.Set;

import org.huamuzhen.oa.domain.enumeration.Privilege;

public class Role extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String name;
	private String description;
	private Set<Privilege> privileges = new HashSet<Privilege>(0);
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<Privilege> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}

}
