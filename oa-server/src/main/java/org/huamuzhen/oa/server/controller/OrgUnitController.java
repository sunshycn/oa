package org.huamuzhen.oa.server.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.OrgUnitManager;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.Pagination;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/orgUnit")
public class OrgUnitController {
	
	@Resource
	private OrgUnitManager orgUnitManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(Pagination page){
		Page<OrgUnit> orgUnitPage = orgUnitManager.findAllOrgUnit(page);
		ModelAndView mav = new ModelAndView("orgUnit");
		page.setTotal(Long.valueOf(orgUnitPage.getTotalElements()).intValue());
		mav.addObject("orgUnitPage", orgUnitPage);
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping(value="/{pageNumber}", method=RequestMethod.GET)
	public ModelAndView page(@PathVariable int pageNumber, Pagination page){
		page.setCurrentPage(pageNumber);
		Page<OrgUnit> orgUnitPage = orgUnitManager.findAllOrgUnit(page);
		ModelAndView mav = new ModelAndView("orgUnit");
		page.setTotal(Long.valueOf(orgUnitPage.getTotalElements()).intValue());
		mav.addObject("orgUnitPage", orgUnitPage);
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){	
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String parentId = request.getParameter("parentId");
		if(name.trim().equals("")){
			name = null;
		}
		if(parentId.trim().equals("")){
			parentId = null;
		}
		orgUnitManager.createNew(name, description, parentId);
		
		return "redirect:/orgUnit";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String parentId = request.getParameter("parentId");
		if(name.trim().equals("")){
			name = null;
		}
		if(parentId.trim().equals("")){
			parentId = null;
		}
		orgUnitManager.updateExisting(id, name, description, parentId);
		
		return "redirect:/orgUnit";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		
		orgUnitManager.deleteOrgUnit(id);
		return "redirect:/orgUnit";
	}
	
	@RequestMapping(value="/addOrgUnit")
	public ModelAndView addOrgUnit(){

		return basicOperateOrgUnitMAV();
	}
	
	@RequestMapping(value="/editOrgUnit/{id}",method=RequestMethod.POST)
	public ModelAndView editOrgUnit(@PathVariable String id){
		ModelAndView mav = basicOperateOrgUnitMAV();
		OrgUnit selectedOrgUnit = orgUnitManager.findOne(id);
		mav.addObject("selectedOrgUnit", selectedOrgUnit);
		OrgUnit parentOrgUnit = null;
		if( null != selectedOrgUnit.getParentId()){
			parentOrgUnit = orgUnitManager.findOne(selectedOrgUnit.getParentId());
		}
		mav.addObject("parentOrgUnit", parentOrgUnit);
		return mav;
	}
	
	private ModelAndView basicOperateOrgUnitMAV(){
		ModelAndView mav = new ModelAndView("operateOrgUnit");
		List<OrgUnit> orgUnitList = orgUnitManager.findAllOrgUnit();
		mav.addObject("orgUnitList", orgUnitList);
		return mav;
	}

}
