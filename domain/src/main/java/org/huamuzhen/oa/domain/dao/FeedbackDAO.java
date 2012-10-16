package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.Feedback;

public interface FeedbackDAO extends JpaDAO<Feedback, String> {
	
	public List<Feedback> findFeedbackByReportFormId(String reportFormId);

}
