package org.huamuzhen.oa.domain.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface JpaDAO<T, ID extends Serializable> extends JpaRepository<T, ID> {

}
