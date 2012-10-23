package org.huamuzhen.oa.server.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.ReportFormTypeManager;
import org.huamuzhen.oa.domain.entity.ReportFormType;
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
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView("reportFormType");
		List<ReportFormType> reportFormTypeList = reportFormTypeManager.findAll();
		mav.addObject("reportFormTypeList", reportFormTypeList);
		
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){
		return null;
	}
	
	@RequestMapping(value="/addReportFormType")
	public String addReportFormType(HttpServletRequest request){
		return null;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		return null;
	}
	
	@RequestMapping(value="/editReportFormType")
	public String editReportFormType(HttpServletRequest request){
		return null;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		reportFormTypeManager.delete(id);
		return "redirect:/reportFormType";
	}

}
