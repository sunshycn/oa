package org.huamuzhen.oa.biz;

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

	public ReportFormMatter saveReportFormMatter(String id, String name) {
		if(null == id){
			return createNew(name);
		}else{
			return updateExisting(id,name);
		}
		
	}

	private ReportFormMatter updateExisting(String id, String name) {
		ReportFormMatter reportFormMatter = this.findOne(id);
		reportFormMatter.setName(name);
		return this.save(reportFormMatter);
		
	}

	private ReportFormMatter createNew(String name) {
		ReportFormMatter reportFormMatter = new ReportFormMatter();
		reportFormMatter.setName(name);
		return this.save(reportFormMatter);
		
	}

}
