package org.huamuzhen.oa.server.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.huamuzhen.oa.domain.dao.ReportFormDAO;



public class FormIdGenerator {
	
	private static FormIdGenerator generator = new FormIdGenerator();
	
	@Resource
	private ReportFormDAO reportFormDAO;
	
	public String generate(String previousFormId){
		
		String currentSuffix= previousFormId.substring(13);
		Integer nextSuffix = Integer.parseInt(currentSuffix) + 1;
		if(nextSuffix < 10){
			return "0" + nextSuffix;
		}else{
			return nextSuffix.toString();
		}
	}
	
	public String generate(){
		
		String dateOfToday = new SimpleDateFormat("yyyyMMdd")
				.format(new Date());
		List<String> newCreatedFormIdListOfToday = this.reportFormDAO
				.findNewCreatedFormIdListOfToday(dateOfToday);
		if (newCreatedFormIdListOfToday.size() == 0) {
			return dateOfToday + "0000-00";
		}
		String latestFormIdOfToday = newCreatedFormIdListOfToday.get(0);

		Integer count = Integer.parseInt(latestFormIdOfToday.substring(8, 12)) + 1;
		if (count < 10) {
			return dateOfToday + "000" + count + "-00";
		} else if (count < 100) {
			return dateOfToday + "00" + count + "-00";
		} else if (count < 1000) {
			return dateOfToday + "0" + count + "-00";
		} else {
			return dateOfToday + count.toString() + "-00";
		}

	}
	
	
	public static FormIdGenerator getInstance(){
		return generator;
	}

}
