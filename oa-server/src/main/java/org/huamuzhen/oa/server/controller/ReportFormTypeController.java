package org.huamuzhen.oa.server.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.OrgUnitManager;
import org.huamuzhen.oa.biz.ReportFormTypeManager;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.Pagination;
import org.huamuzhen.oa.domain.entity.ReportFormType;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reportFormType")
public class ReportFormTypeController {
	
	@Resource
	private ReportFormTypeManager reportFormTypeManager;
	
	@Resource
	private OrgUnitManager orgUnitManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(Pagination page) {
		ModelAndView mav = new ModelAndView("reportFormType");
		Page<ReportFormType> reportFormTypeList = reportFormTypeManager.findAll(page);
		mav.addObject("reportFormTypeList", reportFormTypeList.getContent());
		page.setTotal(Long.valueOf(reportFormTypeList.getTotalElements()).intValue());
		mav.addObject("page", page);
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){
		String name = request.getParameter("name");
		if(name.trim().equals("")){
			name = null;
		}
		String[] requiredOrgUnitIds = request.getParameterValues("requiredOrgUnitIds");
		
		reportFormTypeManager.createNew(name,requiredOrgUnitIds);
		
		return "redirect:/reportFormType";
	}
	
	@RequestMapping(value="/addReportFormType")
	public ModelAndView addReportFormType(HttpServletRequest request){
		return baseOperateReportFormTypeMAV();
	}
	
	@RequestMapping(value="/editReportFormType/{id}",method=RequestMethod.POST)
	public ModelAndView editReportFormType(@PathVariable String id, HttpServletRequest request){
		ModelAndView mav = baseOperateReportFormTypeMAV();
		ReportFormType selectedReportFormType = reportFormTypeManager.findOne(id);
		mav.addObject("selectedReportFormType", selectedReportFormType);
		return mav;
	}
	
	private ModelAndView baseOperateReportFormTypeMAV(){
		ModelAndView mav = new ModelAndView("operateReportFormType");
		List<OrgUnit> orgUnitList = orgUnitManager.findAllOrgUnit();
		mav.addObject("orgUnitList", orgUnitList);
		return mav;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		if(name.trim().equals("")){
			name = null;
		}
		String[] requiredOrgUnitIds = request.getParameterValues("requiredOrgUnitIds");
		
		reportFormTypeManager.updateExisting(id,name,requiredOrgUnitIds);
		
		return "redirect:/reportFormType";
	}
	
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		reportFormTypeManager.delete(id);
		return "redirect:/reportFormType";
	}

}
