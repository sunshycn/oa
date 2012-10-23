package org.huamuzhen.oa.biz;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.OrgUnitDAO;
import org.huamuzhen.oa.domain.dao.ReportFormTypeDAO;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.ReportFormType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReportFormTypeManager extends BaseManager<ReportFormType, String> {

	@Resource
	private ReportFormTypeDAO reportFormTypeDAO;
	
	@Resource
	private OrgUnitDAO orgUnitDAO;
	
	@Resource
	public void setDao(ReportFormTypeDAO dao) {
		super.setDao(dao);
	}

	@Transactional
	public ReportFormType saveReportFormType(String id, String name, String[] requiredOrgUnitIds) {
		if(null == id){
			return this.createNew(name,requiredOrgUnitIds);
		}else{
			return this.updateExisting(id,name,requiredOrgUnitIds);
		}
		
	}
	
	@Transactional
	private ReportFormType createNew(String name, String[] requiredOrgUnitIds){
		ReportFormType reportFormType = new ReportFormType();
		reportFormType.setName(name);
		Set<OrgUnit> requiredOrgUnits = new HashSet<OrgUnit>();
		for(String orgUnitId : requiredOrgUnitIds){
			requiredOrgUnits.add(orgUnitDAO.findOne(orgUnitId));
		}
		reportFormType.setRequiredOrgUnits(requiredOrgUnits);
		return this.save(reportFormType);
	}
	
	@Transactional
	private ReportFormType updateExisting(String id, String name, String[] requiredOrgUnitIds){
		
		ReportFormType reportFormType = this.findOne(id);
		reportFormType.setName(name);
		Set<OrgUnit> requiredOrgUnits = new HashSet<OrgUnit>();
		for(String orgUnitId : requiredOrgUnitIds){
			requiredOrgUnits.add(orgUnitDAO.findOne(orgUnitId));
		}
		reportFormType.setRequiredOrgUnits(requiredOrgUnits);
		return this.save(reportFormType);
	}
}
