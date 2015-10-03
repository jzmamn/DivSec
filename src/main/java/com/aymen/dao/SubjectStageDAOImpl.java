package com.aymen.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.SubjecStage;

@Repository
public class SubjectStageDAOImpl implements SubjectStageDAO {
	private static final Logger logger = LoggerFactory.getLogger(SubjectStageDAO.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createSbjStg(SubjecStage division) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateSbjStg(SubjecStage division) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<SubjecStage> listSbjStg() {

		return null;
	}

	@Override
	public SubjecStage getSbjStgById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSbjStg(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SubjecStage> listSbjStgBySbjId(int sbjId) {
		String sql = "SELECT * FROM subjec_stage WHERE stg_subject_id = :Id ";
		Session session = sessionFactory.getCurrentSession();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(SubjecStage.class);
			query.setParameter("Id", sbjId);
			List<SubjecStage> lst = query.list();
			return lst;
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error(e.toString());
			return null;
		}

	}

}
