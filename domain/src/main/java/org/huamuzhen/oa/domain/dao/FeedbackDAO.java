package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.Feedback;
import org.springframework.stereotype.Repository;

@Repository
public interface FeedbackDAO extends JpaDAO<Feedback, String> {
	
	public List<Feedback> findFeedbackByReportFormId(String reportFormId);
	
	public List<Feedback> findFeedbackByResponseOrgUnitId(String responseOrgUnitId);
	
	public List<Feedback> findFeedbackByResponseOrgUnitIdAndReportFormId(String responseOrgUnitId, String reportFormId);

}
