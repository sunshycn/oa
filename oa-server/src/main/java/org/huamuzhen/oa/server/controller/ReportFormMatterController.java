package org.huamuzhen.oa.server.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.ReportFormMatterManager;
import org.huamuzhen.oa.domain.entity.ReportFormMatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reportFormMatter")
public class ReportFormMatterController {
	
	@Resource
	ReportFormMatterManager reportFormMatterManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(){
		List<ReportFormMatter> reportFormMatterList = reportFormMatterManager.findAll();
		ModelAndView mav = new ModelAndView("reportFormMatter");
		mav.addObject("reportFormMatterList", reportFormMatterList);
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(HttpServletRequest request){	
		String name = request.getParameter("name");
		if(name.trim().equals("")){
			name = null;
		}
		reportFormMatterManager.createNew(name);
		return "redirect:/reportFormMatter";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){	
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		if(name.trim().equals("")){
			name = null;
		}
		reportFormMatterManager.updateExisting(id,name);
		return "redirect:/reportFormMatter";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		reportFormMatterManager.delete(id);
		return "redirect:/reportFormMatter";
	}
	
	@RequestMapping(value="/addReportFormMatter")
	public String addReportFormMatter(){
		return "operateReportFormMatter";
	}
	
	@RequestMapping(value="/editReportFormMatter/{id}",method=RequestMethod.POST)
	public ModelAndView editReportFormMatter(@PathVariable String id){
		ModelAndView mav = new ModelAndView("operateReportFormMatter");
		ReportFormMatter selectedReportFormMatter = reportFormMatterManager.findOne(id);
		mav.addObject("selectedReportFormMatter",selectedReportFormMatter);
		return mav;
	}
	

}
