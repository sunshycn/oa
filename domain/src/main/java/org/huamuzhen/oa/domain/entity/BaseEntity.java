package org.huamuzhen.oa.domain.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@SuppressWarnings("serial")
@MappedSuperclass
public abstract class BaseEntity implements Serializable {

	/**
	 * the created_date column
	 */
	@Column(name = "CREATED_AT", updatable = false)
	protected Timestamp createdAt;

	/**
	 * the last_modified_date column
	 */
	@Column(name = "MODIFIED_AT")
	protected Timestamp modifiedAt;

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

}
