package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.RequestStatus;

@Repository
public class RequestStatusDAOImpl implements RequestStatusDAO {
	private static final Logger logger = LoggerFactory.getLogger(DvisionDaoImpl.class);

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void createRequestStatus(RequestStatus reqStatus) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateRequestStatus(RequestStatus reqStatus) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<RequestStatus> listRequestStatus() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<RequestStatus> reqStatusList = session.createQuery(" from RequestStatus").list();
		for (RequestStatus d : reqStatusList) {
			logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return reqStatusList;
	}

	@Override
	public RequestStatus getRequestStatusById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteRequestStatus(int id) {
		// TODO Auto-generated method stub

	}

}
