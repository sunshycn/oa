package org.huamuzhen.oa.biz;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.entity.ReportForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class QueryManager extends BaseManager<ReportForm, String> {
	
	@Resource
	private EntityManagerFactory entityManagerFactory;

	@Resource
	public void setDao(ReportFormDAO dao) {
		super.setDao(dao);
	}

	@Transactional
	public List<ReportForm>  queryForm(String param1, String value1, String param2,
			String value2, String param3, String value3, String status) {
		EntityManager em = entityManagerFactory.createEntityManager();
		
		StringBuilder value1SB = new StringBuilder().append("%").append(value1)
				.append("%");
		StringBuilder value2SB = new StringBuilder().append("%").append(value2)
				.append("%");
		StringBuilder value3SB = new StringBuilder().append("%").append(value3)
				.append("%");
		StringBuilder querySB = new StringBuilder()
				.append("FROM ReportForm WHERE ").append(param1)
				.append(" LIKE ?1 AND ").append(param2).append(" LIKE ?2 AND ")
				.append(param3).append(" LIKE ?3 ")
				.append(generateStatusQuery(status))
				.append(" ORDER BY createdAt DESC");
		Query query = em.createQuery(querySB.toString());
		query.setParameter(1, value1SB.toString());
		query.setParameter(2, value2SB.toString());
		query.setParameter(3, value3SB.toString());
		@SuppressWarnings("unchecked")
		List<ReportForm> queryResult = (List<ReportForm>) query.getResultList();
		em.close();

		return queryResult;
	}
	
	private String generateStatusQuery(String status){
		
		if(status.equals("dead")){
			return " AND status = 'DEAD' ";
		}else if(status.equals("passed")){
			return " AND status = 'PASSED' ";
		}else if(status.equals("processing")){
			return " AND status <> 'DEAD' AND status <> 'PASSED' ";
		}else{
			return " ";
		}
	}
	
}
