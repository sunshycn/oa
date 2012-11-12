package org.huamuzhen.oa.biz;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.huamuzhen.oa.biz.util.DeadlineCounter;
import org.huamuzhen.oa.domain.dao.FeedbackDAO;
import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.dao.UserDAO;
import org.huamuzhen.oa.domain.entity.Feedback;
import org.huamuzhen.oa.domain.entity.OrgUnit;
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
	private FeedbackDAO feedbackDAO;
	
	@Resource
	private UserDAO userDAO;
	
	@Resource
	private MessageManager message;
	
	@Resource
	public void setDao(FeedbackDAO dao) {
		super.setDao(dao);
	}

	@Transactional
	public Feedback add(String reportFormId, String content, String signature,
			String orgUnitId, String owner, User currentUser, String currentReceiverId, String leader2Id, Boolean agree,int deadlineDuration) {
		Feedback feedback = new Feedback();
		feedback.setContent(content);
		feedback.setSignature(signature);
		feedback.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		feedback.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		feedback.setFeedbackTime(new Timestamp(System.currentTimeMillis()));
		feedback.setReportFormId(reportFormId);
		ReportForm reportForm = reportFormDAO.findOne(reportFormId);
		
		if(currentUser.getPrivilege() == Privilege.DEPARTMENT && null != orgUnitId){
			feedback.setOwner(currentUser.getOrgUnit().getName());
			feedback.setResponseOrgUnitId(currentUser.getOrgUnit().getId());
			Feedback savedFeedback= this.save(feedback);;
			if(checkIfAllRequiredOrgUnitsSendFeedback(reportForm)){
				reportForm.setStatus(ReportFormStatus.GOT_REPLY_FROM_UNITS);
				reportForm.setDeadlineTime(DeadlineCounter.getDeadline(1000));
			}
			message.sendMsg(currentUser.getId(), "回复了报审表：" +reportForm.getFormId());
			message.sendMsg(reportForm.getCreatorId(), userDAO.findOne(currentUser.getId()).getUsername()+ " 回复了报审表：" +reportForm.getFormId());
			reportFormDAO.save(reportForm);
			return savedFeedback;
			
		}else if(currentUser.getPrivilege() == Privilege.LEADER1 && null != currentReceiverId && null != leader2Id){
			feedback.setOwner(Privilege.LEADER1.toString());
			Feedback savedFeedback = this.save(feedback);
			reportForm.setCurrentSenderId(currentUser.getId());
			reportForm.setDeadlineTime(DeadlineCounter.getDeadline(1000));
			if(agree){
				if(leader2Id.equals("")){
					leader2Id = null;
				}
				reportForm.setCurrentReceiverId(leader2Id);
				reportForm.setStatus(ReportFormStatus.SENT_TO_LEADER2);
				message.sendMsg(currentUser.getId(), "回复了报审表：" +reportForm.getFormId() + ";同意审批，将报审表发送至主要领导：" + userDAO.findOne(leader2Id).getUsername());
				message.sendMsg(reportForm.getCreatorId(), userDAO.findOne(currentUser.getId()).getUsername()+" 回复了报审表：" +reportForm.getFormId() + ";同意审批，将报审表发送至主要领导：" + userDAO.findOne(leader2Id).getUsername());
			}else{
				reportForm.setCurrentReceiverId(reportForm.getCreatorId());
				reportForm.setStatus(ReportFormStatus.REJECTED_BY_LEADER1);
				message.sendMsg(currentUser.getId(), "回复了报审表：" +reportForm.getFormId() + ";否决审批，将报审表发送回报审单位: " + userDAO.findOne(reportForm.getCreatorId()).getUsername());
				message.sendMsg(reportForm.getCreatorId(), userDAO.findOne(currentUser.getId()).getUsername()+" 否决了报审表：" +reportForm.getFormId());
			}	
			reportFormDAO.save(reportForm);
			return savedFeedback;
			
		}else if(currentUser.getPrivilege() == Privilege.LEADER2 && null != currentReceiverId){
			feedback.setOwner(Privilege.LEADER2.toString());
			Feedback savedFeedback = this.save(feedback);
			// always return to leader1
			reportForm.setCurrentReceiverId(reportForm.getCurrentSenderId());
			reportForm.setCurrentSenderId(currentUser.getId());
			reportForm.setDeadlineTime(DeadlineCounter.getDeadline(1000));
			if(agree){
				reportForm.setStatus(ReportFormStatus.SENT_TO_OFFICE);
				// reset deadline for office
				reportForm.setDeadlineTime(DeadlineCounter.getDeadline(deadlineDuration));
				message.sendMsg(currentUser.getId(), "回复了报审表：" +reportForm.getFormId() + ";同意审批,将报审表发送至办公室");
				message.sendMsg(reportForm.getCurrentReceiverId(), "主要领导：" + userDAO.findOne(currentUser.getId()) + "同意了报审表: "+ reportForm.getFormId());
			}else{
				reportForm.setStatus(ReportFormStatus.REJECTED_BY_LEADER2);
				message.sendMsg(currentUser.getId(), "回复了报审表：" +reportForm.getFormId() + ";否决审批，将报审表发送回分管领导: " + userDAO.findOne(reportForm.getCurrentReceiverId()).getUsername());
				message.sendMsg(reportForm.getCurrentReceiverId(), "主要领导：" + userDAO.findOne(currentUser.getId()) + "否决了报审表: "+ reportForm.getFormId());
			}
			reportFormDAO.save(reportForm);
			return savedFeedback;
		}else if(currentUser.getPrivilege() == Privilege.OFFICE){
			feedback.setOwner(Privilege.OFFICE.toString());
			Feedback savedFeedback = this.save(feedback);	
			reportForm.setStatus(ReportFormStatus.PASSED);
			reportForm.setDeadlineTime(DeadlineCounter.getDeadline(10000));
			reportFormDAO.save(reportForm);
			message.sendMsg(reportForm.getCreatorId(), "报审表：" + reportForm.getFormId() + "完成审批");
			return savedFeedback;
		}
		return null;
	}

	@Transactional
	private boolean checkIfAllRequiredOrgUnitsSendFeedback(ReportForm reportForm) {
		Set<OrgUnit> requiredOrgUnits = reportForm.getReportFormType().getRequiredOrgUnits();
		List<Feedback> feedbackList = feedbackDAO.findFeedbackByReportFormId(reportForm.getId());
		List<String> requiredOrgUnitIdList = new ArrayList<String>();
		for(OrgUnit requiredOrgUnit : requiredOrgUnits){
			requiredOrgUnitIdList.add(requiredOrgUnit.getId());
		}
		
		for(OrgUnit requiredOrgUnit : requiredOrgUnits){
			for(Feedback feedback : feedbackList){
				if(feedback.getResponseOrgUnitId().equals(requiredOrgUnit.getId())){
					requiredOrgUnitIdList.remove(feedback.getResponseOrgUnitId());
				}
			}
		}
		if(requiredOrgUnitIdList.size() == 0){
			return true;
		}
		return false;
	}
	
	@Transactional
	public boolean checkIfOrgUnitFeedbackIsAlreadyExists(OrgUnit orgUnit, String reportFormId){
		if(feedbackDAO.findFeedbackByResponseOrgUnitIdAndReportFormId(orgUnit.getId(), reportFormId).size() > 0){
			return true;
		}
		return false;
	}
	
	@Transactional
	public List<Feedback> findFeedbackByReportFormId(String reportFormId){
		return feedbackDAO.findFeedbackByReportFormId(reportFormId);
	}
	
	@Transactional
	public List<Feedback> findFeedbackByResponseOrgUnitIdAndReportFormId(String responseOrgUnitId, String reportFormId){
		return feedbackDAO.findFeedbackByResponseOrgUnitIdAndReportFormId(responseOrgUnitId, reportFormId);
	}

}
