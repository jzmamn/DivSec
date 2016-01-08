package com.aymen.dao;

import java.util.List;

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
		// TODO Auto-generated method stub
		return null;
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

}
