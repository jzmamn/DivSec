package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Gender;

@Repository
public class GenderDaoImpl implements GenderDao {

	private static final Logger logger = LoggerFactory.getLogger(GenderDaoImpl.class);

	@Autowired
	SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<Gender> listGender() {
		Session session = sessionFactory.getCurrentSession();
		List<Gender> genderList = session.createQuery(" from Gender").list();
		for (Gender d : genderList) {
			logger.info("Gender List::" + d);
		}
		return genderList;
	}

}
