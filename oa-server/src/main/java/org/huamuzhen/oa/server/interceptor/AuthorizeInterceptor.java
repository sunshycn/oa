package org.huamuzhen.oa.server.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huamuzhen.oa.domain.entity.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorizeInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	
		User user = (User)request.getSession().getAttribute("currentUser");
		if(user == null){
			response.getWriter().write("失去和服务器联系，请重新登录");
			response.getWriter().write("<br/>");
			response.getWriter().write("<a href="+request.getContextPath()+">返回首页</a><br/>");
			return false;
		}else{
			return super.preHandle(request, response, handler);
		}
		
	}
	

}
