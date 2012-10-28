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

}
