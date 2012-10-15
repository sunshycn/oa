package org.huamuzhen.oa.server.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.QueryManager;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.StringUtils;

import java.util.List;

@Controller
@RequestMapping("/query")
public class QueryController {

	@Resource
	private QueryManager queryManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView queryReportForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("query");
		
		String formId = request.getParameter("formId");
		String landUser = request.getParameter("landUser");
		String landLocation = request.getParameter("landLocation");
		if(StringUtils.isNullOrEmpty(formId)){
			formId = "";
		}
		if(StringUtils.isNullOrEmpty(landUser)){
			landUser = "";
		}
		if(StringUtils.isNullOrEmpty(landLocation)){
			landLocation = "";
		}
		List<ReportForm> reportFormList = new ArrayList<ReportForm>();
		reportFormList = queryManager.queryForm(formId,landUser,landLocation);
		
		mav.addObject("reportFormList", reportFormList);
		return mav;	
		
	}
}
