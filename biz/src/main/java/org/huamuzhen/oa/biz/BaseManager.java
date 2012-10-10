package org.huamuzhen.oa.biz;

import java.io.Serializable;
import java.util.List;

import org.huamuzhen.oa.domain.dao.JpaDAO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

public class BaseManager<T, ID extends Serializable> {

    protected JpaDAO<T, ID> dao;

    public JpaDAO<T, ID> getDao() {
        return dao;
    }

    public void setDao(JpaDAO<T, ID> dao) {
        this.dao = dao;
    }
    
    public long count() {
        return dao.count();
    }

    public void delete(ID arg0) {
        dao.delete(arg0);
    }

    public void delete(Iterable<? extends T> arg0) {
        dao.delete(arg0);
    }

    public void delete(T arg0) {
        dao.delete(arg0);
    }

    public void deleteAll() {
        dao.deleteAll();
    }

    public void deleteInBatch(Iterable<T> arg0) {
        dao.deleteInBatch(arg0);
    }

    public boolean exists(ID arg0) {
        return dao.exists(arg0);
    }

    public List<T> findAll() {
        return dao.findAll();
    }

    public Page<T> findAll(Pageable arg0) {
        return dao.findAll(arg0);
    }

    public List<T> findAll(Sort arg0) {
        return dao.findAll(arg0);
    }

    public T findOne(ID arg0) {
        return dao.findOne(arg0);
    }

    public void flush() {
        dao.flush();
    }

/*    public List<T> save(Iterable<? extends T> arg0) {
        return dao.save(arg0);
    }*/

    public T save(T arg0) {

        return dao.save(arg0);
    }

    public T saveAndFlush(T arg0) {
        return dao.saveAndFlush(arg0);
    }


}
