package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.FeedbackDAO;
import org.huamuzhen.oa.domain.entity.Feedback;
import org.springframework.stereotype.Service;

@Service
public class FeedbackManager extends BaseManager<Feedback, String> {
	
	@Resource
	public void setDao(FeedbackDAO dao) {
		super.setDao(dao);
	}

}
