package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.RoleDAO;
import org.huamuzhen.oa.domain.entity.Role;

public class RoleManager extends BaseManager<Role, String> {

	@Resource
	public void setDao(RoleDAO dao) {
		super.setDao(dao);
	}
}
