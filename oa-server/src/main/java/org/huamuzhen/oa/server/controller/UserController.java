package org.huamuzhen.oa.server.controller;


import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.huamuzhen.oa.biz.OrgUnitManager;
import org.huamuzhen.oa.biz.UserManager;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserManager userManager;
	
	@Resource
	private OrgUnitManager orgUnitManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index() {
		List<User> userList = userManager.findAllUser();
		ModelAndView mav = new ModelAndView("user");
		mav.addObject("userList", userList);
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String description = request.getParameter("description");
		String orgUnitId = request.getParameter("orgUnitId");
		if(username.trim().equals("")){
			username = null;
		}
		if(orgUnitId.trim().equals("")){
			orgUnitId = null;
		}
		String privilege = request.getParameter("privilege");
		userManager.saveUser(null, username, password, description, orgUnitId, privilege);
		return "redirect:/user";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String description = request.getParameter("description");
		String orgUnitId = request.getParameter("orgUnitId");
		if(username.trim().equals("")){
			username = null;
		}
		if(orgUnitId.trim().equals("")){
			orgUnitId = null;
		}
		String privilege = request.getParameter("privilege");
		userManager.saveUser(id, username, password, description, orgUnitId, privilege);
		return "redirect:/user";
	}
	
	@RequestMapping(value="/addUser")
	public ModelAndView addUser(){
		ModelAndView mav = new ModelAndView("addUser");
		List<OrgUnit> orgUnitList = orgUnitManager.findAllOrgUnit();
		mav.addObject("orgUnitList", orgUnitList);
		return mav;
	}
	
	@RequestMapping(value="/editUser/{id}",method=RequestMethod.POST)
	public ModelAndView editUser(@PathVariable String id){
		ModelAndView mav = new ModelAndView("editUser");
		List<OrgUnit> orgUnitList = orgUnitManager.findAllOrgUnit();
		mav.addObject("orgUnitList", orgUnitList);
		User selectedUser = userManager.findOne(id);
		mav.addObject("selectedUser", selectedUser);
		return mav;
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		userManager.deleteUser(id);
		return "redirect:/user";
	}
	
	@RequestMapping(value="/changePasswordPage")
	public String changePasswordPage(){
		return "changePassword";
	}
	
	@RequestMapping(value="/changePassword",method=RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String oldPassword = request.getParameter("oldPassword");
		String newPassword =request.getParameter("newPassword");
		String repeatPassword = request.getParameter("repeatPassword");
		if(oldPassword.equals("") || newPassword.equals("") || repeatPassword.equals("")){
			mav.addObject("errorMessage", "密码不能为空");
			mav.setViewName("changePassword");
			return mav;
		}
		if(!newPassword.equals(repeatPassword)){
			mav.addObject("errorMessage", "重复密码不对");
			mav.setViewName("changePassword");
			return mav;
		}
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		if(userManager.authenticate(currentUser.getUsername(), oldPassword) == null){
			mav.addObject("errorMessage", "旧密码不对");
			mav.setViewName("changePassword");
			return mav;
		}
		
		User user = userManager.changePassword(currentUser.getId(), newPassword);
		request.getSession().setAttribute("currentUser", user);
		mav.setViewName("/index");
		
		return mav;
	}
	
}
