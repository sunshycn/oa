package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.OrgUnitManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/orgUnit")
public class OrgUnitController {
	
	@Resource
	private OrgUnitManager orgUnitManager;
	
	//list all OrgUnit
	@RequestMapping(value = { "", "/" })
	public String test(){
		return "orgUnit";
	}
	
	// add a OrgUnit
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){
		
		return "redirect:/user";
	}
	
	// edit the OrgUnit
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		
		return "redirect:/user";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(HttpServletRequest request){
		
		return "redirect:/user";
	}
	
	@RequestMapping(value="/addOrgUnit")
	public String addUser(){
		return "addOrgUnit";
	}

}
