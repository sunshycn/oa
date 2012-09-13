package org.huamuzhen.oa.domain.entity;

public class User extends BaseEntity{
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String username;
	private String description;
	private String orgUnitId;
	private String hashedPassword;
	private String hashSalt;
	
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
	public String getOrgUnitId() {
		return orgUnitId;
	}
	public void setOrgUnitId(String orgUnitId) {
		this.orgUnitId = orgUnitId;
	}
	
}
