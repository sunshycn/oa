package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;

import org.huamuzhen.oa.biz.ReportFormTypeManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reportFormType")
public class ReportFormTypeController {
	
	@Resource
	private ReportFormTypeManager reportFormTypeManager;

}
