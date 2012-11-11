package org.huamuzhen.oa.domain.dao;

import org.huamuzhen.oa.domain.entity.KeyValuePair;

public interface KeyValuePairDAO extends JpaDAO<KeyValuePair, String>{
	
	public KeyValuePair findKeyValuePairByKey(String key);

}
