package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormTypeDAO;
import org.huamuzhen.oa.domain.entity.ReportFormType;

public class ReportFormTypeManager extends BaseManager<ReportFormType, String> {

	@Resource
	public void setDao(ReportFormTypeDAO dao) {
		super.setDao(dao);
	}
}
