package org.huamuzhen.oa.biz;

import java.util.List;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.UserDAO;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Service;

@Service
public class UserManager {
	
	@Resource
	private UserDAO userDAO;
	
	public List<User> list(){
		return userDAO.findAll();
	}
	
	public void add(User user){
		userDAO.saveAndFlush(user);
	}

}
