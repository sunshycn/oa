package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReportFormManager extends BaseManager<ReportForm, String> {

	@Resource
	public void setDao(ReportFormDAO dao) {
		super.setDao(dao);
	}
	
	@Transactional
	public ReportForm saveReportForm(String id, String title,
			String formId, String landUser, String originalLandUser,
			String landLocation, String landArea, String landUse,
			String originalLandUse, String matter, String matterDetail,
			String policyBasis, String comment) {
		if (null == id) {
			return createNew(title, formId, landUser, originalLandUser,landLocation, landArea, landUse, originalLandUse, matter, matterDetail, policyBasis, comment);
		} else {
			return updateExisting(id, title, formId, landUser, originalLandUser,landLocation, landArea, landUse, originalLandUse, matter, matterDetail, policyBasis, comment);
		}
	}

	private ReportForm updateExisting(String id, String title,
			String formId, String landUser, String originalLandUser,
			String landLocation, String landArea, String landUse,
			String originalLandUse, String matter, String matterDetail,
			String policyBasis, String comment) {
		// TODO Auto-generated method stub
		return null;
	}

	private ReportForm createNew(String title, String formId,
			String landUser, String originalLandUser, String landLocation,
			String landArea, String landUse, String originalLandUse,
			String matter, String matterDetail, String policyBasis,
			String comment) {
		// TODO Auto-generated method stub
		return null;
	}
}
