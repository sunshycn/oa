package org.huamuzhen.oa.biz;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.FeedbackDAO;
import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.entity.Feedback;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.huamuzhen.oa.domain.entity.User;
import org.huamuzhen.oa.domain.enumeration.Privilege;
import org.huamuzhen.oa.domain.enumeration.ReportFormStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FeedbackManager extends BaseManager<Feedback, String> {
	
	@Resource
	private ReportFormDAO reportFormDAO;
	
	@Resource
	public void setDao(FeedbackDAO dao) {
		super.setDao(dao);
	}

	@Transactional
	public Feedback add(String reportFormId, String content, String signature,
			String orgUnitId, String owner, User currentUser) {
		Feedback feedback = new Feedback();
		feedback.setContent(content);
		feedback.setSignature(signature);
		feedback.setFeedBackTime(new Timestamp(System.currentTimeMillis()));
		feedback.setReportFormId(reportFormId);
		feedback.setComplete(true);
		ReportForm reportForm = reportFormDAO.findOne(reportFormId);
		if(currentUser.getPrivilege() == Privilege.DEPARTMENT){
			feedback.setOwner(currentUser.getOrgUnit().getName());
			feedback.setResponseOrgUnitId(currentUser.getOrgUnit().getId());
			Feedback savedFeedback= this.save(feedback);
			checkIfAllRequiredOrgUnitsSendFeedback(reportForm);
			return savedFeedback;
		}else if(currentUser.getPrivilege() == Privilege.LEADER1){
			feedback.setOwner(Privilege.LEADER1.toString());
			reportForm.setStatus(ReportFormStatus.SEND_TO_LEADER2);
			reportFormDAO.save(reportForm);
			return this.save(feedback);
			
		}else if(currentUser.getPrivilege() == Privilege.LEADER2){
			feedback.setOwner(Privilege.LEADER2.toString());
			reportForm.setStatus(ReportFormStatus.SEND_TO_OFFICE);
			reportFormDAO.save(reportForm);
			return this.save(feedback);
		}else if(currentUser.getPrivilege() == Privilege.OFFICE){
			feedback.setOwner(Privilege.OFFICE.toString());
			reportForm.setStatus(ReportFormStatus.SEND_BACK_TO_REPORT_UNIT);
			reportFormDAO.save(reportForm);
			return this.save(feedback);
		}
		return null;
	}

	private void checkIfAllRequiredOrgUnitsSendFeedback(ReportForm reportForm) {
		//....
		reportForm.setStatus(ReportFormStatus.GOT_REPLY_FROM_UNITS);
		
	}

}
