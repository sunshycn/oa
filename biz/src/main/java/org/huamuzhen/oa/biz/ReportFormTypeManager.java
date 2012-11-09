package org.huamuzhen.oa.biz;

import java.sql.Timestamp;
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
	private OrgUnitDAO orgUnitDAO;
	
	@Resource
	public void setDao(ReportFormTypeDAO dao) {
		super.setDao(dao);
	}
	
	@Transactional
	public ReportFormType createNew(String name, String[] requiredOrgUnitIds){
		ReportFormType reportFormType = new ReportFormType();
		reportFormType.setName(name);
		Set<OrgUnit> requiredOrgUnits = new HashSet<OrgUnit>();
		for(String orgUnitId : requiredOrgUnitIds){
			requiredOrgUnits.add(orgUnitDAO.findOne(orgUnitId));
		}
		reportFormType.setRequiredOrgUnits(requiredOrgUnits);
		reportFormType.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		reportFormType.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return this.save(reportFormType);
	}
	
	@Transactional
	public ReportFormType updateExisting(String id, String name, String[] requiredOrgUnitIds){
		
		ReportFormType reportFormType = this.findOne(id);
		reportFormType.setName(name);
		reportFormType.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		Set<OrgUnit> requiredOrgUnits = new HashSet<OrgUnit>();
		for(String orgUnitId : requiredOrgUnitIds){
			requiredOrgUnits.add(orgUnitDAO.findOne(orgUnitId));
		}
		reportFormType.setRequiredOrgUnits(requiredOrgUnits);
		return this.save(reportFormType);
	}
}
