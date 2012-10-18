package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.FeedbackManager;
import org.huamuzhen.oa.biz.ReportFormManager;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/feedback")
public class FeedbackController { 
	
	@Resource
	private FeedbackManager feedbackManager;
	
	@Resource
	private ReportFormManager reportFormManager;
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(HttpServletRequest request){
		String reportFormId = request.getParameter("reportFormId");
		String content = request.getParameter("content");
		String signature = request.getParameter("signature");
		String orgUnitId = request.getParameter("orgUnitId");
		String owner = request.getParameter("owner");
		boolean agree = Boolean.parseBoolean(request.getParameter("agree"));
		
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		
		feedbackManager.add(reportFormId,content,signature,orgUnitId,owner,currentUser,agree);
		
		return "redirect:/reportForm/waitForResponseReportForm";
	}
	

}
