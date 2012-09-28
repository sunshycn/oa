package org.huamuzhen.oa.server.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huamuzhen.oa.biz.UserManager;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserManager userManager;
	
	@RequestMapping("/list")
	public void list(HttpServletResponse response) throws IOException{
		List<User> users = userManager.findAll();
		for (User user: users){
			response.getWriter().write(user.getId());
			response.getWriter().write(user.getUsername());
			response.getWriter().write(user.getHashedPassword());
			response.getWriter().write(user.getDescription());
		}
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String description = request.getParameter("description");
		String orgUnitId = request.getParameter("orgUnit");
		User newUser = new User();
		newUser.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		newUser.setModifiedAt(new Timestamp(System.currentTimeMillis()));
		newUser.setHashedPassword(password);
		newUser.setHashSalt(password);
		newUser.setUsername(username);
		newUser.setOrgUnit(null);
		newUser.setDescription(description);
		userManager.saveAndFlush(newUser);
		
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(){
		return "addUser";
	}
	
}
