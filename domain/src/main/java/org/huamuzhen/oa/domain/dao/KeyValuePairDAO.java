package org.huamuzhen.oa.domain.dao;

import org.huamuzhen.oa.domain.entity.KeyValuePair;
import org.springframework.stereotype.Repository;

@Repository
public interface KeyValuePairDAO extends JpaDAO<KeyValuePair, String>{
	
	public KeyValuePair findKeyValuePairByKey(String key);

}
