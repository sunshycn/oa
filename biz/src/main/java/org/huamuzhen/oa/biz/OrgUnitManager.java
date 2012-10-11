package org.huamuzhen.oa.biz;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.OrgUnitDAO;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrgUnitManager extends BaseManager<OrgUnit, String> {
	
	@Resource
	public void setDao(OrgUnitDAO dao) {
		super.setDao(dao);
	}
	
	@Transactional
	public OrgUnit saveOrgUnit(String id, String name, String description, String parentId){
		if( null == id){
			return createNew(name,description,parentId);
		}else{
			return updateExisting(id,name,description,parentId);
		}
	}
	
	@Transactional
	public void deleteOrgUnit(String id){
		this.delete(id);
	}
	
	@Transactional
	public List<OrgUnit> findAllOrgUnit(){
		return this.findAll();
	}

	@Transactional
	private OrgUnit updateExisting(String id, String name, String description,
			String parentId) {
		OrgUnit orgUnit = this.findOne(id);
		orgUnit.setName(name);
		orgUnit.setDescription(description);
		orgUnit.setParentId(parentId);
		orgUnit.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return this.save(orgUnit);
		
	}

	@Transactional
	private OrgUnit createNew(String name, String description, String parentId) {
		OrgUnit newOrgUnit = new OrgUnit();
		newOrgUnit.setName(name);
		newOrgUnit.setDescription(description);
		newOrgUnit.setParentId(parentId);
		newOrgUnit.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		newOrgUnit.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return this.save(newOrgUnit);
	}
}
