package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormTitleDAO;
import org.huamuzhen.oa.domain.entity.ReportFormTitle;
import org.springframework.stereotype.Service;

@Service
public class ReportFormTitleManager extends BaseManager<ReportFormTitle, String>{
	
	@Resource
	public void setDao(ReportFormTitleDAO dao) {
		super.setDao(dao);
	}

	public ReportFormTitle saveReportFormTitle(String id, String name) {
		if(null == id){
			return createNew(name);
		}else{
			return updateExisting(id,name);
		}
		
	}

	private ReportFormTitle updateExisting(String id, String name) {
		ReportFormTitle reportFormTitle = this.findOne(id);
		reportFormTitle.setName(name);
		return this.save(reportFormTitle);
		
	}

	private ReportFormTitle createNew(String name) {
		ReportFormTitle reportFormTitle = new ReportFormTitle();
		reportFormTitle.setName(name);
		return this.save(reportFormTitle);
		
	}

}
