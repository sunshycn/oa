package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.Feedback;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface FeedbackDAO extends JpaDAO<Feedback, String> {
	
	@Transactional
	public List<Feedback> findFeedbackByReportFormId(String reportFormId);
	
	@Transactional
	public List<Feedback> findFeedbackByReportFormIdAndOwner(String reportFormId,String owner);
	
	@Transactional
	public List<Feedback> findFeedbackByResponseOrgUnitId(String responseOrgUnitId);
	
	@Transactional
	public List<Feedback> findFeedbackByResponseOrgUnitIdAndReportFormId(String responseOrgUnitId, String reportFormId);

}
