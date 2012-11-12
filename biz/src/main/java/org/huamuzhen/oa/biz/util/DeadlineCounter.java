package org.huamuzhen.oa.biz.util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class DeadlineCounter {
	
	public static Timestamp getDeadline(int deadlineDuration){
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		int actualDuration;
		switch(dayOfWeek){
		   case 1:actualDuration = deadlineDuration+1;break;
		   case 2:actualDuration = deadlineDuration;break;
		   case 3:actualDuration = deadlineDuration;break;
		   case 4:actualDuration = deadlineDuration;break;
		   case 5:actualDuration = deadlineDuration+2;break;
		   case 6:actualDuration = deadlineDuration+2;break;
		   case 7:actualDuration = deadlineDuration+2;break;
		   default:actualDuration = deadlineDuration;
		   } 
		
		return new Timestamp(System.currentTimeMillis() + 86400000*actualDuration);
	}

}
