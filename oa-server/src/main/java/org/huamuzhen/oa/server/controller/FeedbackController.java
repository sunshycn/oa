package org.huamuzhen.oa.server.controller;

import javax.annotation.Resource;

import org.huamuzhen.oa.biz.FeedbackManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
	
	@Resource
	private FeedbackManager feedbackManager;

}
