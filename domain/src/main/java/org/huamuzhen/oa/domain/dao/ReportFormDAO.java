package org.huamuzhen.oa.domain.dao;

import java.util.List;

import org.huamuzhen.oa.domain.entity.ReportForm;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReportFormDAO extends JpaDAO<ReportForm, String> {
	
	@Query(value="SELECT r.formId FROM ReportForm r WHERE r.formId LIKE ':dateOfToday%-00' ORDER BY r.createdAt ASC")
	public List<String> findNewCreatedFormIdListOfToday(@Param("dateOfToday") String dateOfToday);

}
