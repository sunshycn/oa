package org.huamuzhen.oa.domain.util;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.id.UUIDGenerator;

public class IdGenerator implements IdentifierGenerator {

	private UUIDGenerator delegate = UUIDGenerator
			.buildSessionFactoryUniqueIdentifierGenerator();

	public Serializable generate(SessionImplementor session, Object object)
			throws HibernateException {
		String uuid = delegate.generate(session, object).toString();
		return uuid.toString().replace("-", "");
	}

}
