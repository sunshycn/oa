package org.huamuzhen.oa.server.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.FeedbackManager;
import org.huamuzhen.oa.biz.ReportFormManager;
import org.huamuzhen.oa.biz.ReportFormTypeManager;
import org.huamuzhen.oa.biz.UserManager;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.huamuzhen.oa.domain.entity.ReportFormType;
import org.huamuzhen.oa.domain.entity.User;
import org.huamuzhen.oa.domain.enumeration.Privilege;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reportForm")
public class ReportFormController {
	
	@Resource
	private ReportFormManager reportFormManager;
	
	@Resource
	private ReportFormTypeManager reportFormTypeManager;
	
	@Resource
	private FeedbackManager feedbackManager;
	
	@Resource
	private UserManager userManager;
	
	@RequestMapping(value = { "", "/" })
	public String index(HttpServletRequest request){
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		request.setAttribute("privilege", currentUser.getPrivilege());
		return "reportForm";
	}
	
	@RequestMapping("/addReportForm")
	public ModelAndView addReportForm(){
		ModelAndView mav = new ModelAndView("addReportForm");
		List<ReportFormType> reportFormTypeList = reportFormTypeManager.findAll();
		mav.addObject("reportFormTypeList", reportFormTypeList);
		String formId = reportFormManager.generateFormId();
		mav.addObject("formId", formId);
		return mav;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest request){
		String reportFormTypeId = request.getParameter("reportFormTypeId");
		/*ReportFormType reportFormType = reportFormTypeManager.findOne(reportFormTypeId);
		Set<OrgUnit> requiredOrgUnits = reportFormType.getRequiredOrgUnits();
		ModelAndView mav = new ModelAndView("checkRequiredOrgUnits");
		mav.addObject("requiredOrgUnits", requiredOrgUnits);*/
		
		String title = request.getParameter("title");
		String formId = request.getParameter("formId");
		String landUser = request.getParameter("landUser");
		String originalLandUser = request.getParameter("originalLandUser");
		String landLocation = request.getParameter("landLocation");
		String landArea = request.getParameter("landArea");
		String landUse = request.getParameter("landUse");
		String originalLandUse = request.getParameter("originalLandUse");
		String matter = request.getParameter("matter");
		String matterDetail = request.getParameter("matterDetail");
		String policyBasis = request.getParameter("policyBasis");
		String comment = request.getParameter("comment");
		String responsiblePerson = request.getParameter("responsiblePerson");
		String auditor = request.getParameter("auditor");
		String tabulator = request.getParameter("tabulator");
		
	    ReportForm newReportForm = reportFormManager.saveReportForm(null, reportFormTypeId, title, formId,
				landUser, originalLandUser, landLocation, landArea, landUse,
				originalLandUse, matter, matterDetail, policyBasis, comment,
				responsiblePerson,auditor,tabulator);
	    
		ModelAndView mav = new ModelAndView("newCreatedReportForm");
		mav.addObject("newReportForm", newReportForm);
		return mav;
	}
	
	@RequestMapping("/unsendReportForm")
	public ModelAndView unsendReportForm(){
		List<ReportForm> unsendReportFormList = reportFormManager.findAllUnsendReportForms();
		ModelAndView mav = new ModelAndView("unsendReportForm");
		mav.addObject("unsendReportFormList", unsendReportFormList);
		
		return mav;
	}
	
	@RequestMapping("/editUnsendReportForm/{id}")
	public ModelAndView editUnsendReportForm(@PathVariable String id){
		ReportForm selectedReportForm =reportFormManager.findOne(id);
		ModelAndView mav = new ModelAndView("editReportForm");
		mav.addObject("selectedReportForm", selectedReportForm);
		List<ReportFormType> reportFormTypeList = reportFormTypeManager.findAll();
		mav.addObject("reportFormTypeList", reportFormTypeList);
		return mav;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		String id = request.getParameter("id");
		String reportFormTypeId = request.getParameter("reportFormTypeId");
		String title = request.getParameter("title");
		String formId = request.getParameter("formId");
		String landUser = request.getParameter("landUser");
		String originalLandUser = request.getParameter("originalLandUser");
		String landLocation = request.getParameter("landLocation");
		String landArea = request.getParameter("landArea");
		String landUse = request.getParameter("landUse");
		String originalLandUse = request.getParameter("originalLandUse");
		String matter = request.getParameter("matter");
		String matterDetail = request.getParameter("matterDetail");
		String policyBasis = request.getParameter("policyBasis");
		String comment = request.getParameter("comment");
		String responsiblePerson = request.getParameter("responsiblePerson");
		String auditor = request.getParameter("auditor");
		String tabulator = request.getParameter("tabulator");
		reportFormManager.saveReportForm(id, reportFormTypeId, title, formId,
				landUser, originalLandUser, landLocation, landArea, landUse,
				originalLandUse, matter, matterDetail, policyBasis, comment,
				responsiblePerson,auditor,tabulator);
		
		
		return "redirect:/reportForm";
	}
	
	@RequestMapping(value="/sendToOrgUnits/{id}", method=RequestMethod.POST)
	public String sendToOrgUnits(@PathVariable String id){
		reportFormManager.sendToOrgUnits(id);
		return "redirect:/reportForm/unsendReportForm";
		
	}
	
	@RequestMapping(value="/list/{reportFormStatusLink}")
	public ModelAndView list(@PathVariable String reportFormStatusLink){
		ModelAndView mav = new ModelAndView("listResponseReportForm");
		List<ReportForm> reportFormList = reportFormManager.findReportFormByStatus(reportFormStatusLink);
		mav.addObject("reportFormList", reportFormList);
		mav.addObject("reportFormStatusLink", reportFormStatusLink);
		if(reportFormStatusLink.equals("gotReplyFromUnitsReportForm")){
			mav.addObject("leader1List", userManager.findUserByPrivilege(Privilege.LEADER1));
		}
		
		return mav;
	}
	
	@RequestMapping(value="responseReportForm/{id}",method=RequestMethod.POST)
	public ModelAndView responseReportForm(@PathVariable String id, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("responseReportForm");
		mav.addObject("responseType", request.getAttribute("responseType"));
		ReportForm selectedReportForm = reportFormManager.findOne(id);
		mav.addObject("selectedReportForm", selectedReportForm);
		ReportFormType reportFormType = reportFormTypeManager.findOne(selectedReportForm.getReportFormType().getId());
		Set<OrgUnit> requiredOrgUnits = reportFormType.getRequiredOrgUnits();
		User user = (User)request.getSession().getAttribute("currentUser");
		OrgUnit qualifiedOrgUnit = null;
		for(OrgUnit orgUnit : requiredOrgUnits){
			if(user.getOrgUnit().getName().equals(orgUnit.getName())){
				 if(!feedbackManager.checkIfOrgUnitFeedbackIsAlreadyExists(orgUnit)){
					 qualifiedOrgUnit = orgUnit;
				 }else{
					 ModelAndView errorMav = new ModelAndView("error");
					 errorMav.addObject("errorMessage", "该部门已经回复");
					 return errorMav;
				 }
			}
		}
		
		mav.addObject("qualifiedOrgUnit", qualifiedOrgUnit);
		
		return mav;
	}
	
/*	@RequestMapping(value="response", method=RequestMethod.POST)
	public String response(HttpServletRequest request){
		String reportFormId = request.getParameter("reportFormId");
		String content = request.getParameter("content");
		String signature = request.getParameter("signature");
		String orgUnitId = request.getParameter("orgUnitId");
		String owner = request.getParameter("owner");
		
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		
		reportFormManager.response(reportFormId,content,signature,orgUnitId,owner,currentUser);
		
		
		return "redirect:/reportForm/waitForResponseReportForm";
	}*/
	

}
