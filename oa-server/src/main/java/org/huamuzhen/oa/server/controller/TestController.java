package org.huamuzhen.oa.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping(value = { "", "/" })
	public String test(){
		return "index";
	}
	
	@RequestMapping("/user")
	public String testUser(){
		return "user";
	}
	
	@RequestMapping("/orgunit")
	public String testOrgUnit(){
		return null;
	}

}
