package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Division;

@Repository
public class DvisionDaoImpl implements DivisionDAO {
	private static final Logger logger = LoggerFactory
			.getLogger(DivisionDAO.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean createDivision(Division division) {

		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(division);

			logger.debug("Person saved successfully, Person Details="
					+ division);
			return true;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}

	}

	@Override
	public boolean updateDivision(Division division) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Division> listDivision() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Division getMasterById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeDivision(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
