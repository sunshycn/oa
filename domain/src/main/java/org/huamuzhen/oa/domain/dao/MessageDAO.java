package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.Message;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageDAO extends JpaDAO<Message, String> {
	
	public List<Message> findMessageByReceiverIdOrderByCreatedAtDesc(String receiverId);

}
