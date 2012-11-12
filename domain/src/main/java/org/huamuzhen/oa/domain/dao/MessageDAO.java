package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.Message;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface MessageDAO extends JpaDAO<Message, String> {
	
	@Transactional
	public List<Message> findMessageByReceiverIdOrderByCreatedAtDesc(@Param("receiverId")  String receiverId);

}
