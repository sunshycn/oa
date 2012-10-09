package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;

import org.huamuzhen.oa.biz.OrgUnitManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orgUnit")
public class OrgUnitController {
	
	@Resource
	private OrgUnitManager orgUnitManager;

}
