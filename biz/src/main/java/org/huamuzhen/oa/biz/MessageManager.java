package org.huamuzhen.oa.biz;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.MessageDAO;
import org.huamuzhen.oa.domain.entity.Message;

public class MessageManager extends BaseManager<Message, String> {
	
	@Resource
	public void setDao(MessageDAO dao) {
		super.setDao(dao);
	}

}
