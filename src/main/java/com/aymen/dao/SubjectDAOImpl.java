package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Subject;

@Repository
public class SubjectDAOImpl implements SubjectDAO {
	private static final Logger logger = LoggerFactory.getLogger(DvisionDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createSubject(Subject subject) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(subject);
			logger.debug("Subject saved successfully, Subject Details=" + subject.getSbjId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public void updateSubject(Subject subject) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(subject);
			logger.debug("Subject updated successfully, Subject Details=" + subject.getSbjId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public List<Subject> listSubject() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Subject> subjectList = session.createQuery(" from Subject").list();
		for (Subject s : subjectList) {
			logger.info("Person List::" + s);
		}
		return subjectList;
	}

	@Override
	public Subject getSubjectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSubject(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Subject subject = (Subject) session.load(Subject.class, new Integer(id));
			if (null != subject) {
				session.delete(subject);
			}
			logger.info("Subject deleted successfully, Subject details=" + subject.getSbjId());
		} catch (HibernateException e) {
			logger.info("deleteSubject", e.toString());
			System.out.println(e.toString());
			e.printStackTrace();
		}

	}

}
