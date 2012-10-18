package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.User;
import org.huamuzhen.oa.domain.enumeration.Privilege;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaDAO<User, String> {

	public User findUserByUsername(String username);
	
	public List<User> findUserByPrivilege(Privilege privilege);
}
