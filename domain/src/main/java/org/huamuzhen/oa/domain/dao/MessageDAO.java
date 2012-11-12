package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.Message;

public interface MessageDAO extends JpaDAO<Message, String> {
	
	public List<Message> findMessageByReceiverIdOrderByCreatedAtDesc(String receiverId);

}
