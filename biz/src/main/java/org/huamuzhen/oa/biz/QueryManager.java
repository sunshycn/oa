package org.huamuzhen.oa.biz;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.huamuzhen.oa.domain.dao.ReportFormDAO;
import org.huamuzhen.oa.domain.entity.Pagination;
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
	@SuppressWarnings("unchecked")
	public List<ReportForm>  queryForm(String param1, String value1, String param2,
			String value2, String param3, String value3, String status, Pagination page) {
		EntityManager em = entityManagerFactory.createEntityManager();
		StringBuilder value1SB = new StringBuilder().append("%").append(value1)
				.append("%");
		StringBuilder value2SB = new StringBuilder().append("%").append(value2)
				.append("%");
		StringBuilder value3SB = new StringBuilder().append("%").append(value3)
				.append("%");
		Query query = em.createQuery(getQuery(param1, param2, param3, status, false).toString());
		query.setParameter(1, value1SB.toString());
		query.setParameter(2, value2SB.toString());
		query.setParameter(3, value3SB.toString());
		query.setFirstResult(page.getOffset());
		query.setMaxResults(page.getPageSize());
		List<ReportForm> queryResult = (List<ReportForm>) query.getResultList();
		
		if (page.getTotal() == 0) {
			//TODO It is better to create a single query to get the total count for performance issue.
			query = em.createQuery(getQuery(param1, param2, param3, status, true).toString());
			query.setParameter(1, value1SB.toString());
			query.setParameter(2, value2SB.toString());
			query.setParameter(3, value3SB.toString());
			page.setTotal(query.getResultList().size());
		}
		em.close();
		return queryResult;
	}
	
	private StringBuilder getQuery(String param1, String param2, String param3, 
			String status, boolean page) {
		StringBuilder querySB = new StringBuilder();
		if (page) {
//			querySB.append("select count(1) ");
		}
		querySB
		.append("FROM ReportForm WHERE ").append(param1)
		.append(" LIKE ?1 AND ").append(param2).append(" LIKE ?2 AND ")
		.append(param3).append(" LIKE ?3 ")
		.append(generateStatusQuery(status));
		if (!page) { 
			querySB.append(" ORDER BY createdAt DESC");
		}
		return querySB;
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
