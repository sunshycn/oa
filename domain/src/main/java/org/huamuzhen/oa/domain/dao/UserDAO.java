package org.huamuzhen.oa.domain.dao;

import org.huamuzhen.oa.domain.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaDAO<User, String> {


}
