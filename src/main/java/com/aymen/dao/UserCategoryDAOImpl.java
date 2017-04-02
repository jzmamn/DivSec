package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.UserCategory;

@Repository
public class UserCategoryDAOImpl implements UserCategoryDAO {

	private static final Logger logger = LoggerFactory.getLogger(UserCategoryDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createUserCat(UserCategory userCat) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(userCat);

			logger.debug("Staff saved successfully, Staff Details=" + userCat);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public void updateUserCat(UserCategory userCat) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(userCat);
			logger.debug("Person saved successfully, Person Details=" + userCat);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public List<UserCategory> listUserCat() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<UserCategory> userCatList = session.createQuery(" from UserCategory").list();
		for (UserCategory userCat : userCatList) {
			logger.info("Staff List:" + userCat);
			// System.out.println(d);
		}
		return userCatList;
	}

	@Override
	public UserCategory getUserCatById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		UserCategory userCat = (UserCategory) session.load(UserCategory.class, new Integer(id));
		logger.info("Staff loaded successfully, Staff details=" + userCat);
		return userCat;
	}

	@Override
	public void deleteUserCat(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			UserCategory userCat = (UserCategory) session.load(UserCategory.class, new Integer(id));
			if (null != userCat) {
				session.delete(userCat);
			}
			logger.info("Staff deleted successfully, person details=" + userCat);
		} catch (HibernateException e) {
			logger.info("deleteStaff", e.toString());
			System.out.println(e.toString());
		}

	}

}
