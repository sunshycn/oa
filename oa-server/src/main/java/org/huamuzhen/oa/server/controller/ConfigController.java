package org.huamuzhen.oa.server.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.KeyValuePairManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("config")
public class ConfigController {
	
	@Resource
	private KeyValuePairManager keyValuePairManager;
	
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView("applicationConfig");
		Map<String,String> paramsMap = keyValuePairManager.getParamsMap();
		mav.addObject("paramsMap",paramsMap);
		return mav;
	}
	
	@RequestMapping(value="save")
	public String save(HttpServletRequest request){
		String deadlineDuration = request.getParameter("deadlineDuration");	
		keyValuePairManager.saveKeyValuePair("deadlineDuration", deadlineDuration);
		return "redirect:/config";
	}

}
