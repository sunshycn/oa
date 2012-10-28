package org.huamuzhen.oa.server.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.ReportFormTitleManager;
import org.huamuzhen.oa.domain.entity.ReportFormTitle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reportFormTitle")
public class ReportFormTitleController {
	
	@Resource
	ReportFormTitleManager reportFormTitleManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(){
		List<ReportFormTitle> reportFormTitleList = reportFormTitleManager.findAll();
		ModelAndView mav = new ModelAndView("reportFormTitle");
		mav.addObject("reportFormTitleList", reportFormTitleList);
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){	
		String name = request.getParameter("name");
		if(name.trim().equals("")){
			name = null;
		}
		reportFormTitleManager.saveReportFormTitle(null,name);
		return "redirect:/reportFormTitle";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){	
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		if(name.trim().equals("")){
			name = null;
		}
		reportFormTitleManager.saveReportFormTitle(id,name);
		return "redirect:/reportFormTitle";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		reportFormTitleManager.delete(id);
		return "redirect:/reportFormTitle";
	}
	
	@RequestMapping(value="/addReportFormTitle")
	public String addReportFormTitle(){
		return "addReportFormTitle";
	}
	
	@RequestMapping(value="/editReportFormTitle/{id}",method=RequestMethod.POST)
	public ModelAndView editReportFormTitle(@PathVariable String id){
		ModelAndView mav = new ModelAndView("editReportFormTitle");
		ReportFormTitle selectedReportFormTitle = reportFormTitleManager.findOne(id);
		mav.addObject("selectedReportFormTitle",selectedReportFormTitle);
		return mav;
	}
	

}
