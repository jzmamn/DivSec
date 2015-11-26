package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.PublicIndividual;

@Repository

public class PublicDetailDAOImpl implements PublicDetailDAO {

	private static final Logger logger = LoggerFactory.getLogger(PublicDetailDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createPublicIndividual(PublicIndividual pi) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(pi);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public void updatePublicIndividual(PublicIndividual pi) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(pi);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public List<PublicIndividual> listPublicIndividual() {

		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<PublicIndividual> listPI = session.createQuery(" from PublicIndividual").list();
		for (PublicIndividual d : listPI) {
			logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return listPI;
	}

	@Override
	public PublicIndividual getPublicIndividualById(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			PublicIndividual pi = (PublicIndividual) session.load(PublicIndividual.class, new Integer(id));
			logger.info("PublicIndividual Loaded Successfully");
			return pi;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		}

	}

	@Override
	public void deletePublicIndividual(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			PublicIndividual pi = (PublicIndividual) session.load(PublicIndividual.class, new Integer(id));
			if (null != pi) {
				session.delete(pi);
			}
			logger.info("PublicIndividual deleted successfully, person details=" + pi.getPiId());
		} catch (HibernateException e) {
			logger.info("deletePublicIndividual", e.toString());
			System.out.println(e.toString());
			e.printStackTrace();
		}

	}

}
