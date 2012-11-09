package org.huamuzhen.oa.biz;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormMatterDAO;
import org.huamuzhen.oa.domain.entity.ReportFormMatter;
import org.springframework.stereotype.Service;

@Service
public class ReportFormMatterManager extends BaseManager<ReportFormMatter, String>{
	
	@Resource
	public void setDao(ReportFormMatterDAO dao) {
		super.setDao(dao);
	}

	public ReportFormMatter updateExisting(String id, String name) {
		ReportFormMatter reportFormMatter = this.findOne(id);
		reportFormMatter.setName(name);
		reportFormMatter.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return this.save(reportFormMatter);
		
	}

	public ReportFormMatter createNew(String name) {
		ReportFormMatter reportFormMatter = new ReportFormMatter();
		reportFormMatter.setName(name);
		reportFormMatter.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		reportFormMatter.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return this.save(reportFormMatter);
		
	}

}
