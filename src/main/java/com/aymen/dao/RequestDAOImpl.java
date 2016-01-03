package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Division;
import com.aymen.entity.Request;

@Repository
public class RequestDAOImpl implements RequestDAO {

	private static final Logger logger = LoggerFactory.getLogger(RequestDAOImpl.class);

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void createRequest(Request req) {

		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(req);

			logger.info("Division saved successfully, Person Details=" + req.getReqId());

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public void updateRequest(Request req) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(req);
			logger.info("Division Updated successfully, Division Details=" + req.getReqId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public List<Request> listSvcRequest() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Request> reqList = session.createQuery(" from Request").list();
		for (Request d : reqList) {
			logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return reqList;
	}

	@Override
	public Request getRequestById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Request req = (Request) session.load(Division.class, new Integer(id));
		logger.info("Person loaded successfully, Person details=" + req);
		return req;
	}

	@Override
	public void deleteRequest(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Request req = (Request) session.load(Request.class, new Integer(id));
			if (null != req) {
				session.delete(req);
			}
			logger.info("Request deleted successfully, request details=" + req);
		} catch (HibernateException e) {
			logger.info("deleteDivision", e.toString());
			System.out.println(e.toString());
			e.printStackTrace();
		}

	}

}
