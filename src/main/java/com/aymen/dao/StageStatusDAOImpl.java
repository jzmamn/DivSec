package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.StageStatus;

@Repository
public class StageStatusDAOImpl implements StageStatusDAO {

	private static final Logger logger = LoggerFactory.getLogger(DvisionDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createStageStatus(StageStatus stgStatus) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateStageStatus(StageStatus stgStatus) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<StageStatus> listStageStatus() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<StageStatus> stgStatusList = session.createQuery(" from StageStatus").list();
		for (StageStatus d : stgStatusList) {
			logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return stgStatusList;
	}

	@Override
	public StageStatus getStageStatusById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteStageStatus(int id) {
		// TODO Auto-generated method stub

	}

}
