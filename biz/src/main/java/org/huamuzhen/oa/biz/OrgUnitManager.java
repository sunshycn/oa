package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.OrgUnitDAO;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.springframework.stereotype.Service;

@Service
public class OrgUnitManager extends BaseManager<OrgUnit, String> {
	
	@Resource
	public void setDao(OrgUnitDAO dao) {
		super.setDao(dao);
	}

}
