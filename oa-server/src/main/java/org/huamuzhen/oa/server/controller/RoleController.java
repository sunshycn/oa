package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;

import org.huamuzhen.oa.biz.RoleManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	private RoleManager roleManager;

}
