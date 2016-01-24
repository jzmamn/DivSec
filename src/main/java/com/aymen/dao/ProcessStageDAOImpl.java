package com.aymen.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.ProcessStage;
import com.aymen.entity.StageStatus;

@Repository
public class ProcessStageDAOImpl implements ProcessStageDAO {
	private static final Logger logger = LoggerFactory.getLogger(SubjectStageDAO.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createReqStg(ProcessStage processStg) {
		try {
			Session session = sessionFactory.getCurrentSession();
			// session.persist(processStg);
			session.merge(processStg);

			logger.info("Requset Stage saved successfully=" + processStg.getRstId());
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error("Requset Stage saved failed=" + processStg.getRstId());
		}

	}

	@Override
	public void updateReqStg(ProcessStage processStg) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ProcessStage> listReqStg() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<ProcessStage> reqStgList = session.createQuery(" from ProcessStage").list();
		for (ProcessStage d : reqStgList) {
			// logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return reqStgList;
	}

	@Override
	public ProcessStage getReqStgById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReqStg(int id) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProcessStage> listReqStgByReqId(int reqId) {
		String sql = "SELECT * FROM process_stage WHERE rst_pr_id = :Id ";
		Session session = sessionFactory.getCurrentSession();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(ProcessStage.class);
			query.setParameter("Id", reqId);
			List<ProcessStage> lst = query.list();
			return lst;
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error(e.toString());
			return null;
		}

	}

	@Override
	public void updateStageStatus(int reqStageId, int reqStgStsId, String note) {
		try {
			Session session = sessionFactory.getCurrentSession();

			ProcessStage prcStage = (ProcessStage) session.load(ProcessStage.class, new Integer(reqStageId));
			StageStatus stgSts = new StageStatus();

			stgSts.setSsId(reqStgStsId);
			prcStage.setStageStatus(stgSts);

			prcStage.setRstNote(note);

			session.update(prcStage);
			logger.info("Request Updated successfully, Request Details=" + prcStage.getRstId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> filterRequestStages(int reqId, int sbjId, int pubId, int divId, int statusId, String fromDate,
			String toDate) {

		String strQuery = "";
		String strQuery1 = "SELECT *  FROM  request r";
		strQuery1 = strQuery1 + " left JOIN `process_stage` s ON r.req_id = s.rst_pr_id";
		strQuery1 = strQuery1 + " left JOIN `subject` sb ON r.req_subject_id = sb.sbj_id";
		strQuery1 = strQuery1 + " left JOIN `subjec_stage` sg ON sg.stg_id = s.rst_stg_id";
		// strQuery = strQuery + " left JOIN `staff` sf ON r.req_user_id =
		// sf.stf_id";
		strQuery1 = strQuery1 + " left JOIN `staff` sf1 ON s.rst_user_id = sf1.stf_id";
		strQuery1 = strQuery1 + " left JOIN `Public_individual` p ON r.req_public_id = p.pi_id";
		strQuery1 = strQuery1 + " left JOIN `division` d ON r.req_division_id = d.div_id";
		strQuery1 = strQuery1 + " left JOIN `request_status` rs ON r.req_status_id = rs.rs_id ";
		strQuery1 = strQuery1 + " left JOIN `stage_status` ss ON  s.rst_stage_status_id = ss.ss_id";
		strQuery1 = strQuery1 + " WHERE";

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
	public List<Object> filterAllRequestStages() {
		String strQuery = "SELECT * FROM request r ";
		strQuery = strQuery + " left JOIN `process_stage` s ON r.req_id = s.rst_pr_id";
		strQuery = strQuery + " left JOIN `subject` sb ON r.req_subject_id = sb.sbj_id";
		strQuery = strQuery + " left JOIN `subjec_stage` sg ON sg.stg_id = s.rst_stg_id";
		// strQuery = strQuery + " left JOIN `staff` sf ON r.req_user_id =
		// sf.stf_id";
		strQuery = strQuery + " left JOIN `staff` sf1 ON s.rst_user_id = sf1.stf_id";
		strQuery = strQuery + " left JOIN `Public_individual` p ON r.req_public_id = p.pi_id";
		strQuery = strQuery + " left JOIN `division` d ON r.req_division_id = d.div_id";
		strQuery = strQuery + " left JOIN `request_status` rs ON r.req_status_id = rs.rs_id ";
		strQuery = strQuery + " left JOIN `stage_status` ss ON  s.rst_stage_status_id = ss.ss_id";
		strQuery = strQuery + " ORDER BY req_id";

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getRequestStageTrail(int reqId, String fromDate, String toDate) {
		String strQuery = "";
		String strQuery1 = "SELECT * FROM vw_req_stg_trail Where";
		String strQuery2 = "";
		String strQuery3 = " ORDER BY rst_id, rst_pr_id";

		if (reqId == 0 && fromDate.equals("0") && toDate.equals("0")) {
			if (reqId > 0) {
				strQuery2 = " rst_pr_id= " + reqId + " AND";
			}

			if (!fromDate.equals("0") && !toDate.equals("0")) {
				strQuery2 = " DATE_FORMAT(rst_txn_date, '%Y-%m-%d') BETWEEN  '" + fromDate + "' AND '" + toDate
						+ "' AND";
			}
		}

		if (strQuery2.length() > 0) {
			strQuery2 = strQuery2.substring(0, strQuery2.length() - 4);
			strQuery = strQuery1 + strQuery2 + strQuery3;
		} else {
			strQuery = strQuery1.substring(0, strQuery1.length() - 6) + strQuery3;
		}

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

}
