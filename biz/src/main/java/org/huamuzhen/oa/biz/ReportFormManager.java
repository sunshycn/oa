package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.springframework.stereotype.Service;

@Service
public class ReportFormManager extends BaseManager<ReportForm, String> {

	@Resource
	public void setDao(ReportFormDAO dao) {
		super.setDao(dao);
	}
}
