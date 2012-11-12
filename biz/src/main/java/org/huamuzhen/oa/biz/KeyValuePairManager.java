package org.huamuzhen.oa.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.KeyValuePairDAO;
import org.huamuzhen.oa.domain.entity.KeyValuePair;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class KeyValuePairManager extends BaseManager<KeyValuePair,String>{

	@Resource
	private KeyValuePairDAO keyValuePairDAO;
	
	private Map<String,String> paramsMap = new HashMap<String,String>();
	
	@Resource
	public void setDao(KeyValuePairDAO dao) {
		super.setDao(dao);
	}
	
	public KeyValuePairManager(){
		// default data
		paramsMap.put("deadlineDuration", "3");
	}
	
	@PostConstruct
	public void init() {
		
		// load data
		List<KeyValuePair> config = this.findAll();
		for (KeyValuePair keyValuePair : config) {
			paramsMap.put(keyValuePair.getKey(), keyValuePair.getValue());
		}
	}
	
	@Transactional
	public void saveKeyValuePair(String key, String value) {
		paramsMap.put(key, value);
		KeyValuePair keyValuePair = keyValuePairDAO.findKeyValuePairByKey(key);
		keyValuePair.setValue(value);
		this.save(keyValuePair);
	}

	public Map<String, String> getParamsMap() {
		return paramsMap;
	}

}
