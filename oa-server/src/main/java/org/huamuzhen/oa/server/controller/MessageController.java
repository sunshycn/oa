package org.huamuzhen.oa.server.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.huamuzhen.oa.biz.MessageManager;
import org.huamuzhen.oa.domain.entity.Message;
import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Resource
	MessageManager messageManager;
	
	@RequestMapping(value = { "", "/" })
	public ModelAndView index(HttpSession session){
		ModelAndView mav = new ModelAndView("message");
		List<Message> messageList = messageManager.findMessageByReceiverIdOrderByCreatedAtDesc(((User)session.getAttribute("currentUser")).getId());
		mav.addObject("messageList", messageList);
		return mav;
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public String delete(@PathVariable String id){
		messageManager.delete(id);
		return "redirect:/message";
	}

}
