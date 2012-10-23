package org.huamuzhen.oa.server.util;

import java.util.Comparator;

import org.huamuzhen.oa.domain.entity.Feedback;

public class FeedbackComparator implements Comparator<Feedback> {

	@Override
	public int compare(Feedback arg0, Feedback arg1) {
		return arg0.getOwner().compareTo(arg1.getOwner().toString());
	}


}
