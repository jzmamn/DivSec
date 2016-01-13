package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
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
	public void createSbjStg(SubjecStage stg) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(stg);
			logger.info("Subject Stage saved successfully=" + stg.getStgId());
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error("Subject Stage saved failed=" + stg.getStgId());
		}
	}

	@Override
	public void updateSbjStg(SubjecStage stg) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(stg);
			logger.info("Subject Stage update successfully=" + stg.getStgId());
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error("Subject Stage updated failed=" + stg.getStgId());
		}
	}

	@Override
	public List<SubjecStage> listSbjStg() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<SubjecStage> subjectStgList = session.createQuery(" from SubjecStage").list();
		for (SubjecStage s : subjectStgList) {
			logger.info("SubjectStage List::" + s);
		}
		return subjectStgList;
	}

	@Override
	public SubjecStage getSbjStgById(int id) {
		return null;
	}

	@Override
	public void deleteSbjStg(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			SubjecStage stg = (SubjecStage) session.load(SubjecStage.class, new Integer(id));

			if (null != stg) {
				session.delete(stg);
			}

			logger.info("Division deleted successfully, person details=" + stg);
		} catch (HibernateException e) {
			logger.error("deleteDivision", e.toString());
			System.out.println(e.toString());
			e.printStackTrace();
		}
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
