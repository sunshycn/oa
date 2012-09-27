package org.huamuzhen.oa.server.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

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
	public void testUser(HttpServletResponse response) throws IOException{
	//	return "user";
		response.getWriter().write("aaa");
		response.getWriter().write("/n");
		response.getWriter().write("ccc");
	}
	
	@RequestMapping("/orgunit")
	public String testOrgUnit(){
		return null;
	}

}
