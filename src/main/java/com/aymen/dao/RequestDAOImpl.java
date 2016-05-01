package com.aymen.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
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

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<Request> listSvcRequest() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Request> reqList = session.createQuery(" from Request").list();
		for (Request d : reqList) {
			// logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return reqList;
	}

	@SuppressWarnings("unused")
	@Override
	public List<Request> listSvcRequestByDivision(int divId) {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Request> reqList = session.createQuery(" from Request where req_division_id = " + divId).list();
		for (Request d : reqList) {
			// logger.info("Person List::" + d);
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
	public void updateRequestStatus(int reqId, int statusId, boolean isVoid, String note) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Request req = getRequestById(reqId);
			RequestStatus requestStatus = new RequestStatus();

			requestStatus.setRsId(statusId);
			req.setRequestStatus(requestStatus);

			req.setReqIsVoid(isVoid);
			req.setReqNote(note);

			System.out.println(req.getRequestStatus().getRsId());

			session.update(req);
			logger.info("Request Updated successfully, Request Details=" + req.getReqId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> listBatchCount() {
		String strQry = "select  rs.rs_id id, rs_name,count(req_id) `count` from `request` r "
				+ "right outer join  `request_status` rs on r.req_status_id= rs.rs_id  group by r.req_status_id, rs_name;";

		System.out.println(strQry);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQry);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();

		return results;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> getReqByStatus(int statusId) {
		String sql = "SELECT * FROM request WHERE req_status_id = :Id ";
		Session session = sessionFactory.getCurrentSession();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Request.class);
			query.setParameter("Id", statusId);
			List<Request> lst = query.list();
			return lst;
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error(e.toString());
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> getReqByStatusByDivision(int statusId, int divId) {
		String sql = "SELECT * FROM request WHERE req_status_id = :Id AND req_division_id = :divId ";
		Session session = sessionFactory.getCurrentSession();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Request.class);
			query.setParameter("Id", statusId);
			query.setParameter("divId", divId);
			List<Request> lst = query.list();
			return lst;
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error(e.toString());
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> filterRequest(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
			String fromDate, String toDate) {

		String strQuery = "";
		String strQuery1 = "SELECT *  FROM  request Where ";
		String strQuery2 = "";

		if (reqId > 0) {
			strQuery2 = " req_id= " + reqId + " AND";
		}

		if (sbjId > 0) {
			strQuery2 = " req_subject_id= " + sbjId + " AND";
		}

		if (pubId > 0) {
			strQuery2 = " req_public_id= " + pubId + " AND";
		}

		if (divId > 0) {
			strQuery2 = " req_division_id= " + divId + " AND";
		}

		if (statusId > 0) {
			strQuery2 = " req_status_id= " + statusId + " AND";
		}

		if (staffId > 0) {
			strQuery2 = " req_user_id= " + staffId + " AND";
		}

		if (!fromDate.equals("0") && !toDate.equals("0")) {
			strQuery2 = " DATE_FORMAT(req_ent_date, '%Y-%m-%d') BETWEEN  '" + fromDate + "' AND '" + toDate + "' AND";
		}

		if (strQuery2.length() > 0) {
			strQuery2 = strQuery2.substring(0, strQuery2.length() - 4);
			strQuery = strQuery1 + strQuery2;

		} else {
			strQuery = strQuery1.substring(0, strQuery1.length() - 6);

		}

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQuery);
		query.addEntity(Request.class);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Request> results = query.list();

		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Request> filterAllRequest() {
		String strQuery = "SELECT *  FROM  request";
		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQuery);
		query.addEntity(Request.class);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Request> results = query.list();

		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getRequestTrail(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
			String fromDate, String toDate) {

		String strQuery = "";
		String strQuery1 = "SELECT * FROM vw_request_trail Where";
		String strQuery2 = "";

		if (reqId > 0) {
			strQuery2 = " req_id= " + reqId + " AND";
		}

		if (sbjId > 0) {
			strQuery2 = " req_subject_id= " + sbjId + " AND";
		}

		if (pubId > 0) {
			strQuery2 = " req_public_id= " + pubId + " AND";
		}

		if (divId > 0) {
			strQuery2 = " req_division_id= " + divId + " AND";
		}

		if (statusId > 0) {
			strQuery2 = " req_status_id= " + statusId + " AND";
		}

		if (staffId > 0) {
			strQuery2 = " req_user_id= " + staffId + " AND";
		}

		if (!fromDate.equals("0") && !toDate.equals("0")) {
			strQuery2 = " DATE_FORMAT(req_ent_date, '%Y-%m-%d') BETWEEN  '" + fromDate + "' AND '" + toDate + "' AND";
		}

		if (strQuery2.length() > 0) {
			strQuery2 = strQuery2.substring(0, strQuery2.length() - 4);
			strQuery = strQuery1 + strQuery2;
		} else {
			strQuery = strQuery1.substring(0, strQuery1.length() - 6);
		}

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getOverDueRequests(int reqId, String fromDate, String toDate) {
		String strQuery = "";
		String strQuery1 = "SELECT * FROM vw_req_overdue Where";
		String strQuery2 = "";

		if (reqId == 0 && fromDate.equals("0") && toDate.equals("0")) {
			if (reqId > 0) {
				strQuery2 = " req_id= " + reqId + " AND";
			}

			if (!fromDate.equals("0") && !toDate.equals("0")) {
				strQuery2 = " DATE_FORMAT(req_ent_date, '%Y-%m-%d') BETWEEN  '" + fromDate + "' AND '" + toDate
						+ "' AND";
			}
		}

		if (strQuery2.length() > 0) {
			strQuery2 = strQuery2.substring(0, strQuery2.length() - 4);
			strQuery = strQuery1 + strQuery2;
		} else {
			strQuery = strQuery1.substring(0, strQuery1.length() - 6);
		}

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getDivPeriodStatus(int divId, int month, int year) {
		String strQuery = "SELECT * FROM vw_div_period_status";
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	// SMS
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getSMSContent(int reqId) {
		String strQuery = "select  req_id, sbj_name, rs_name,pi_mobile_phone,req_public_id,pi_name,pi_email from vw_request_list where req_id="
				+ reqId;
		Session session = this.sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> listBatchCountByDivision(int divId) {
		String strQry = "select  rs.rs_id id,req_division_id, rs_name,count(req_id) `count` from `request` r "
				+ " right outer join  `request_status` rs on r.req_status_id= rs.rs_id" + " where req_division_id="
				+ divId + " group by rs.rs_id ,req_division_id, rs_name";

		System.out.println(strQry);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQry);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();

		return results;
	}

}
