package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.ProcessStage;

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

	@Override
	public List<ProcessStage> listReqStgBySbjId(int reqId) {
		// TODO Auto-generated method stub
		return null;
	}

}
