package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.UserDAO;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Service;

@Service
public class UserManager extends BaseManager<User, String>{
	
/*	@Resource
	private UserDAO dao;*/
	
	@Resource
	public void setDao(UserDAO dao) {
		super.setDao(dao);
	}
	

}
