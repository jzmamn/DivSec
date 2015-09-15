package com.aymen.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Staff;

@Repository
public class UserCreationDAOImpl implements UserCreationDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserCreationDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createUser(Staff staff) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(staff);

			logger.debug("Staff saved successfully, Staff Details=" + staff);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public void updateUser(Staff staff) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(staff);
			logger.debug("Person saved successfully, Person Details=" + staff);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public List<Staff> listStaff() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Staff> staffList = session.createQuery(" from staff").list();
		for (Staff staff : staffList) {
			logger.info("Staff List:" + staff);
			// System.out.println(d);
		}
		return staffList;

	}

	@Override
	public Staff getStaffById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Staff staff = (Staff) session.load(Staff.class, new Integer(id));
		logger.info("Staff loaded successfully, Staff details=" + staff);
		return staff;
	}

	@Override
	public void deleteStaff(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Staff staff = (Staff) session.load(Staff.class, new Integer(id));
			if (null != staff) {
				session.delete(staff);
			}
			logger.info("Staff deleted successfully, person details=" + staff);
		} catch (HibernateException e) {
			logger.info("deleteStaff", e.toString());
			System.out.println(e.toString());
		}

	}

}
