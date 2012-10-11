package org.huamuzhen.oa.biz;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.OrgUnitDAO;
import org.huamuzhen.oa.domain.dao.UserDAO;
import org.huamuzhen.oa.domain.entity.User;
import org.huamuzhen.oa.domain.enumeration.Privilege;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserManager extends BaseManager<User, String>{
	
	@Resource
	public void setDao(UserDAO dao) {
		super.setDao(dao);
	}
	
	@Resource
	private OrgUnitDAO orgUnitDAO;
	
	private Random random = new Random();
	private ShaPasswordEncoder encoder = new ShaPasswordEncoder();
	
	@Transactional
	public List<User> findAllUser(){
		return this.findAll();
	}
	
	@Transactional
	public void deleteUser(String id){
		this.delete(id);
	}
	
	@Transactional
	public User saveUser(String id, String username, String rawPassword, String description, String orgUnitId, String privilege){
		if( null == id){
			return createNew(username,rawPassword,description,orgUnitId,privilege);
		}else{
			return updateExisting(id,username,rawPassword,description,orgUnitId,privilege);
		}		
	}

	@Transactional
	private User updateExisting(String id, String username, String rawPassword,
			String description, String orgUnitId, String privilege) {
		User user = this.findOne(id);
		user.setUsername(username);
		user.setDescription(description);
		user.setOrgUnit(orgUnitDAO.findOne(orgUnitId));
		user.setPrivilege(Privilege.valueOf(privilege));
		if(!rawPassword.equals("")){
			String hashSalt = new Integer(random.nextInt(10000)).toString();
			user.setHashSalt(hashSalt);
			user.setHashedPassword(encoder.encodePassword(rawPassword, hashSalt));
		}
		user.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		
		return this.save(user);
	}

	@Transactional
	private User createNew(String username, String rawPassword,
			String description, String orgUnitId, String privilege) {
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setDescription(description);
		newUser.setOrgUnit(orgUnitDAO.findOne(orgUnitId));
		newUser.setPrivilege(Privilege.valueOf(privilege));
		String hashSalt = new Integer(random.nextInt(10000)).toString();
		newUser.setHashSalt(hashSalt);
		newUser.setHashedPassword(encoder.encodePassword(rawPassword, hashSalt));
		newUser.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		newUser.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		
		return this.save(newUser);
	}
	
}
