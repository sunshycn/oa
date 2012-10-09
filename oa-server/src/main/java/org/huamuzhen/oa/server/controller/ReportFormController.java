package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;

import org.huamuzhen.oa.biz.ReportFormManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reportForm")
public class ReportFormController {
	
	@Resource
	private ReportFormManager reportFormManager;

}
