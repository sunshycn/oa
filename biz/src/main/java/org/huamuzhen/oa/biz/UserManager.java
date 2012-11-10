package org.huamuzhen.oa.biz;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.OrgUnitDAO;
import org.huamuzhen.oa.domain.dao.ReportFormTypeDAO;
import org.huamuzhen.oa.domain.dao.UserDAO;
import org.huamuzhen.oa.domain.entity.ReportFormType;
import org.huamuzhen.oa.domain.entity.User;
import org.huamuzhen.oa.domain.enumeration.Privilege;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserManager extends BaseManager<User, String>{
	
	@Resource
	private UserDAO userDAO;
	
	@Resource
	public void setDao(UserDAO dao) {
		super.setDao(dao);
	}
	
	@Resource
	private OrgUnitDAO orgUnitDAO;
	
	@Resource
	private ReportFormTypeDAO reportFormTypeDAO;
	
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
	public User authenticate(String username, String password){
		User user = userDAO.findUserByUsername(username);
		if(null != user){
			if(encoder.isPasswordValid(user.getHashedPassword(), password, user.getHashSalt())){
				return user;
			}
		}
		return null;
	}

	@Transactional
	public User updateExisting(String id, String username, String rawPassword,
			String description, String orgUnitId, String privilege, String[] supportedReportFormTypeIds) {
		User user = this.findOne(id);
		if(!rawPassword.equals("")){
			String hashSalt = new Integer(random.nextInt(10000)).toString();
			user.setHashSalt(hashSalt);
			user.setHashedPassword(encoder.encodePassword(rawPassword, hashSalt));
		}
		user = setBasicDataForUser(user, username, description, orgUnitId, privilege,supportedReportFormTypeIds);
		return this.save(user);
	}

	@Transactional
	public User createNew(String username, String rawPassword,
			String description, String orgUnitId, String privilege, String[] supportedReportFormTypeIds) {
		User newUser = new User();
		String hashSalt = new Integer(random.nextInt(10000)).toString();
		newUser.setHashSalt(hashSalt);
		newUser.setHashedPassword(encoder.encodePassword(rawPassword, hashSalt));
		newUser.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		newUser = setBasicDataForUser(newUser, username, description, orgUnitId, privilege,supportedReportFormTypeIds);
		return this.save(newUser);
	}
	
	@Transactional
	public List<User> findUserByPrivilege(Privilege privilege){

		return userDAO.findUserByPrivilege(privilege);
	}
	
	@Transactional
	public User changePassword(String id, String newPassword){
		User user = this.findOne(id);
		String hashSalt = new Integer(random.nextInt(10000)).toString();
		user.setHashSalt(hashSalt);
		user.setHashedPassword(encoder.encodePassword(newPassword, hashSalt));
		user.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return this.save(user);
		
	}
	
	private User setBasicDataForUser(final User user,String username,
			String description, String orgUnitId, String privilege, String[] supportedReportFormTypeIds){
		user.setUsername(username);
		user.setDescription(description);
		if(null == orgUnitId){
			user.setOrgUnit(null);
		}else{
			user.setOrgUnit(orgUnitDAO.findOne(orgUnitId));
		}
		user.setPrivilege(Privilege.valueOf(privilege));
		Set<ReportFormType> supportedReportFormTypes = new HashSet<ReportFormType>();
		
		for(int i=0;supportedReportFormTypeIds!=null&&i<supportedReportFormTypeIds.length;i++){
			supportedReportFormTypes.add(reportFormTypeDAO.findOne(supportedReportFormTypeIds[i]));
		}
		user.setSupportedReportFormTypes(supportedReportFormTypes);
		user.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		return user;
	}
	
}
