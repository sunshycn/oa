package org.huamuzhen.oa.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

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
	//@Column(name="org_unit_id", length = 36)
	private OrgUnit orgUnit;
	
	@Column(name="hashed_password", length = 36)
	private String hashedPassword;
	
	@Column(name="hash_salt", length = 10)
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
	public OrgUnit getOrgUnit() {
		return orgUnit;
	}
	public void setOrgUnit(OrgUnit orgUnit) {
		this.orgUnit = orgUnit;
	}
	
}
