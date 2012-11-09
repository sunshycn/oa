package org.huamuzhen.oa.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Report_Form_Matter")
public class ReportFormMatter extends BaseEntity{
	

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "org.huamuzhen.oa.domain.util.IdGenerator")
	@Column(name="id", unique = true, nullable = false, length = 36)
	private String id;
	
	@Column(name="name", unique = true, nullable = false, length = 20)
	private String name;

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

}
