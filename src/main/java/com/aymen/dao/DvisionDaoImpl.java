package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Division;

@Repository
public class DvisionDaoImpl implements DivisionDAO {
	private static final Logger logger = LoggerFactory.getLogger(DvisionDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createDivision(Division division) {

		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(division);

			logger.info("Division saved successfully, Person Details=" + division.getDivId());

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public void updateDivision(Division division) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(division);
			logger.info("Division Updated successfully, Division Details=" + division.getDivId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public List<Division> listDivision() {

		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Division> divisionList = session.createQuery(" from Division").list();
		for (Division d : divisionList) {
			logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return divisionList;
	}

	@Override
	public Division getDivisionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Division division = (Division) session.load(Division.class, new Integer(id));
		logger.info("Person loaded successfully, Person details=" + division);
		return division;
	}

	@Override
	public void deleteDivision(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Division division = (Division) session.load(Division.class, new Integer(id));
			if (null != division) {
				session.delete(division);
			}
			logger.info("Division deleted successfully, person details=" + division);
		} catch (HibernateException e) {
			logger.info("deleteDivision", e.toString());
			System.out.println(e.toString());
			e.printStackTrace();
		}

	}

}
