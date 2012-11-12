package org.huamuzhen.oa.domain.dao;

import org.huamuzhen.oa.domain.entity.KeyValuePair;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface KeyValuePairDAO extends JpaDAO<KeyValuePair, String>{
	
	@Transactional
	public KeyValuePair findKeyValuePairByKey(String key);

}
