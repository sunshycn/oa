package org.huamuzhen.oa.server.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.OrgUnitManager;
import org.huamuzhen.oa.biz.ReportFormTypeManager;
import org.huamuzhen.oa.biz.UserManager;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.Pagination;
import org.huamuzhen.oa.domain.entity.ReportFormType;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.data.domain.Page;
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
	
	@Resource
	private ReportFormTypeManager reportFormTypeManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(Pagination page) {
		Page<User> userPage = userManager.findAll(page);
		ModelAndView mav = new ModelAndView("user");
		page.setTotal(Long.valueOf(userPage.getTotalElements()).intValue());
		mav.addObject("userPage", userPage);
		mav.addObject("page", page);
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
		String[] supportedReportFormTypeIds = request.getParameterValues("supportedReportFormTypeIds");
		userManager.createNew(username, password, description, orgUnitId, privilege,supportedReportFormTypeIds);
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
		String[] supportedReportFormTypeIds = request.getParameterValues("supportedReportFormTypeIds");
		userManager.updateExisting(id, username, password, description, orgUnitId, privilege,supportedReportFormTypeIds);
		return "redirect:/user";
	}
	
	@RequestMapping(value="/addUser")
	public ModelAndView addUser(){
		return baseOperateUserMAV();
	}
	
	@RequestMapping(value="/editUser/{id}",method=RequestMethod.POST)
	public ModelAndView editUser(@PathVariable String id){
		ModelAndView mav = baseOperateUserMAV();
		User selectedUser = userManager.findOne(id);
		mav.addObject("selectedUser", selectedUser);
		return mav;
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		userManager.deleteUser(id);
		return "redirect:/user";
	}
	
	private ModelAndView baseOperateUserMAV(){
		ModelAndView mav = new ModelAndView("operateUser");
		List<OrgUnit> orgUnitList = orgUnitManager.findAllOrgUnit();
		mav.addObject("orgUnitList", orgUnitList);
		List<ReportFormType> reportFormTypeList = reportFormTypeManager.findAll();
		mav.addObject("reportFormTypeList",reportFormTypeList);
		return mav;
	}
	
}
