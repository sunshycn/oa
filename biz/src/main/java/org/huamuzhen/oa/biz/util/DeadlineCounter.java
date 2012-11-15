package org.huamuzhen.oa.biz.util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class DeadlineCounter {
	
	public static Timestamp getDeadline(int deadlineDuration){
		if(deadlineDuration < 100){
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
			int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			int leftDays = deadlineDuration;
			int actualDuration = 0;
			int currentDay = dayOfWeek;
			while (leftDays > 0) {
				if (currentDay == 1) {// Sun.
					actualDuration++;
					currentDay = 2;
				} else if (currentDay == 7) {// Sat.
					actualDuration = actualDuration + 2;
					currentDay = 2;
				}
				actualDuration++;
				leftDays--;
				currentDay++;
			}
			return new Timestamp(System.currentTimeMillis() + 86400000*actualDuration);
		}else{
			return new Timestamp(System.currentTimeMillis() + 86400000*deadlineDuration);
		}
		
	
	}

}
