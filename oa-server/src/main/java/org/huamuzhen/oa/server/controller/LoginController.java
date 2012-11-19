package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.huamuzhen.oa.biz.UserManager;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/account/login",method=RequestMethod.POST)
	public String login(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User currentUser = userManager.authenticate(username, password);
		if(null != currentUser){
			request.getSession().setAttribute("currentUser", currentUser);
			return "index";
		}
		request.setAttribute("flag", new Object());
		return "redirect:/";
	}
	
	@RequestMapping(value="/account/logoff",method=RequestMethod.GET)
	public String logoff(HttpSession session){
		session.removeAttribute("currentUser");
		return "redirect:/";
	}
	
	@RequestMapping(value="/account/changePasswordPage")
	public String changePasswordPage(){
		return "changePassword";
	}
	
	@RequestMapping(value="/account/changePassword",method=RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String oldPassword = request.getParameter("oldPassword");
		String newPassword =request.getParameter("newPassword");
		String repeatPassword = request.getParameter("repeatPassword");
		if(oldPassword.equals("") || newPassword.equals("") || repeatPassword.equals("")){
			mav.addObject("errorMessage", "密码不能为空");
			mav.setViewName("changePassword");
			return mav;
		}
		if(!newPassword.equals(repeatPassword)){
			mav.addObject("errorMessage", "重复密码不对");
			mav.setViewName("changePassword");
			return mav;
		}
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		if(userManager.authenticate(currentUser.getUsername(), oldPassword) == null){
			mav.addObject("errorMessage", "旧密码不对");
			mav.setViewName("changePassword");
			return mav;
		}
		
		User user = userManager.changePassword(currentUser.getId(), newPassword);
		request.getSession().setAttribute("currentUser", user);
		mav.setViewName("/index");
		
		return mav;
	}
}
