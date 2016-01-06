package com.aymen.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Request;
import com.aymen.entity.RequestStatus;

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

			logger.info("Request saved successfully, Person Details=" + req.getReqId());

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public void updateRequest(Request req) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(req);
			logger.info("Request Updated successfully, Request Details=" + req.getReqId());
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
		Request req = (Request) session.load(Request.class, new Integer(id));
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
			logger.info("deleteRequest", e.toString());
			System.out.println(e.toString());
			e.printStackTrace();
		}

	}

	@SuppressWarnings("rawtypes")
	@Override
	public Request getLastRequest() {
		try {

			String qry = "SELECT * FROM request ORDER BY req_id DESC LIMIT 1;";
			System.out.println("Query" + qry);
			Request lastReq = null;
			Session session = this.sessionFactory.getCurrentSession();
			SQLQuery query = (SQLQuery) session.createSQLQuery(qry);
			query.addEntity(Request.class);

			List results = query.list();

			for (Iterator iterator = results.iterator(); iterator.hasNext();) {
				lastReq = new Request();
				lastReq = (Request) iterator.next();
			}

			logger.debug("This is the last request the request id" + lastReq.getReqId());
			return lastReq;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		}
	}

	@Override
	public void updateRequestStatus(int reqId, int statusId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Request req = getRequestById(reqId);
			RequestStatus requestStatus = new RequestStatus();
			requestStatus.setRsId(statusId);
			req.setRequestStatus(requestStatus);

			System.out.println(req.getRequestStatus().getRsId());

			session.update(req);
			logger.info("Request Updated successfully, Request Details=" + req.getReqId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
