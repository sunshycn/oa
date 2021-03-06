package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.User;
import org.huamuzhen.oa.domain.enumeration.Privilege;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserDAO extends JpaDAO<User, String> {

	@Transactional
	public User findUserByUsername(String username);
	
	@Transactional
	public List<User> findUserByPrivilege(Privilege privilege);
	
	@Transactional
	public User findUserById(String id);
}
