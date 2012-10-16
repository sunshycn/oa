package org.huamuzhen.oa.biz;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.dao.ReportFormTypeDAO;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.huamuzhen.oa.domain.enumeration.ReportFormStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReportFormManager extends BaseManager<ReportForm, String> {
	
	@Resource
	private ReportFormDAO reportFormDAO;
	
	@Resource
	private ReportFormTypeDAO reportFormTypeDAO;

	@Resource
	public void setDao(ReportFormDAO dao) {
		super.setDao(dao);
	}
	
	@Transactional
	public ReportForm saveReportForm(String id, String reportFormTypeId, String title,
			String formId, String landUser, String originalLandUser,
			String landLocation, String landArea, String landUse,
			String originalLandUse, String matter, String matterDetail,
			String policyBasis, String comment, String responsiblePerson,
			String auditor, String tabulator) {
		if (null == id) {
			return createNew(title, reportFormTypeId, formId, landUser,
					originalLandUser, landLocation, landArea, landUse,
					originalLandUse, matter, matterDetail, policyBasis,
					comment, responsiblePerson, auditor, tabulator);
		} else {
			return updateExisting(id, reportFormTypeId, title, formId,
					landUser, originalLandUser, landLocation, landArea,
					landUse, originalLandUse, matter, matterDetail,
					policyBasis, comment, responsiblePerson, auditor, tabulator);
		}
	}

	@Transactional
	private ReportForm updateExisting(String id, String reportFormTypeId, String title,
			String formId, String landUser, String originalLandUser,
			String landLocation, String landArea, String landUse,
			String originalLandUse, String matter, String matterDetail,
			String policyBasis, String comment, String responsiblePerson,
			String auditor, String tabulator) {
		
		ReportForm reportForm = reportFormDAO.findOne(id);
		reportForm.setTitle(title);
		reportForm.setReportFormType(reportFormTypeDAO.findOne(reportFormTypeId));
		reportForm.setFormId(formId);
		reportForm.setLandUser(landUser);
		reportForm.setOriginalLandUser(originalLandUser);
		reportForm.setLandLocation(landLocation);
		reportForm.setLandArea(landArea);
		reportForm.setLandUse(landUse);
		reportForm.setOriginalLandUse(originalLandUse);
		reportForm.setMatter(matter);
		reportForm.setMatterDetail(matterDetail);
		reportForm.setPolicyBasis(policyBasis);
		reportForm.setComment(comment);
		reportForm.setResponsiblePerson(responsiblePerson);
		reportForm.setAuditor(auditor);
		reportForm.setTabulator(tabulator);
		
		return reportFormDAO.save(reportForm);
	}

	@Transactional
	private ReportForm createNew(String title, String reportFormTypeId,String formId,
			String landUser, String originalLandUser, String landLocation,
			String landArea, String landUse, String originalLandUse,
			String matter, String matterDetail, String policyBasis,
			String comment, String responsiblePerson, String auditor, String tabulator) {
		
		ReportForm newReportForm = new ReportForm();
		newReportForm.setTitle(title);
		newReportForm.setReportFormType(reportFormTypeDAO.findOne(reportFormTypeId));
		newReportForm.setFormId(formId);
		newReportForm.setLandUser(landUser);
		newReportForm.setOriginalLandUser(originalLandUser);
		newReportForm.setLandLocation(landLocation);
		newReportForm.setLandArea(landArea);
		newReportForm.setLandUse(landUse);
		newReportForm.setOriginalLandUse(originalLandUse);
		newReportForm.setMatter(matter);
		newReportForm.setMatterDetail(matterDetail);
		newReportForm.setPolicyBasis(policyBasis);
		newReportForm.setComment(comment);
		newReportForm.setResponsiblePerson(responsiblePerson);
		newReportForm.setAuditor(auditor);
		newReportForm.setTabulator(tabulator);
		
		newReportForm.setReferredReportFormId(null);
		newReportForm.setStatus(ReportFormStatus.NOT_SEND);
		return reportFormDAO.save(newReportForm);
	}
	
    public String generateFormId(String previousFormId){
		
		String currentSuffix= previousFormId.substring(13);
		Integer nextSuffix = Integer.parseInt(currentSuffix) + 1;
		if(nextSuffix < 10){
			return "0" + nextSuffix;
		}else{
			return nextSuffix.toString();
		}
	}
	
    @Transactional
	public String generateFormId(){
		
		String dateOfToday = new SimpleDateFormat("yyyyMMdd")
				.format(new Date());
		String fuzzyQueryCondition = dateOfToday + "%-00";
		List<String> newCreatedFormIdListOfToday = this.reportFormDAO
				.findNewCreatedFormIdListOfToday(fuzzyQueryCondition);
		if (newCreatedFormIdListOfToday.size() == 0) {
			return new StringBuilder().append(dateOfToday).append("0000-00").toString();
		}
		String latestFormIdOfToday = newCreatedFormIdListOfToday.get(0);

		Integer count = Integer.parseInt(latestFormIdOfToday.substring(8, 12)) + 1;
		if (count < 10) {
			return new StringBuilder().append(dateOfToday).append("000").append(count).append("-00").toString();
		} else if (count < 100) {
			return new StringBuilder().append(dateOfToday).append("00").append(count).append("-00").toString();
		} else if (count < 1000) {
			return new StringBuilder().append(dateOfToday).append("0").append(count).append("-00").toString();
		} else {
			return new StringBuilder().append(dateOfToday).append(count).append("-00").toString();
		}

	}

	public List<ReportForm> findAllUnsendReportForms() {
		
		return reportFormDAO.findAllUnsendReportForms();
	}
	
	public ReportForm sendToOrgUnits(String id){
		ReportForm reportForm = reportFormDAO.findOne(id);
		reportForm.setStatus(ReportFormStatus.SEND_TO_ORG_UNITS);
		reportForm.setSendTime(new Timestamp(System.currentTimeMillis()));
		return reportFormDAO.save(reportForm);
	}

	public List<ReportForm> findAllWaitForResponseReportForms() {
		
		return reportFormDAO.findAllWaitForResponseReportForms();
	}
	
}
