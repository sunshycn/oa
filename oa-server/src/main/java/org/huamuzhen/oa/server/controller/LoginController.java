package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.huamuzhen.oa.biz.UserManager;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Resource
	private UserManager userManager;

	@RequestMapping(value = { "", "/" })
	public String index(HttpSession session){
		User currentUser = (User)session.getAttribute("currentUser");
		if(null == currentUser){
			return "login";
		}
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User currentUser = userManager.authenticate(username, password);
		if(null != currentUser){
			request.getSession().setAttribute("currentUser", currentUser);
			return "index";
		}
		request.setAttribute("flag", new Object());
		return "login";
	}
}
