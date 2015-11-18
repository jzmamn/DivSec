package com.aymen.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
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
	public void createStaff(Staff staff) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(staff);
			logger.debug("Staff saved successfully, Staff Details=" + staff.getStfId());
		} catch (Exception e) {
			System.out.println("DAO" + e.toString());
		}

	}

	@Override
	public void updateStaff(Staff staff) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(staff);
			logger.debug("Staff saved successfully, Staff Details=" + staff.getStfId());

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public List<Staff> listStaff() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Staff> staffList = session.createQuery(" from Staff").list();
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
		logger.info("Staff loaded successfully, Staff details=" + staff.getStfId());
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
			logger.info("Staff deleted successfully, person details=" + staff.getStfId());
		} catch (HibernateException e) {
			logger.info("deleteStaff", e.toString());
			System.out.println(e.toString());
		}

	}

	@SuppressWarnings("rawtypes")
	@Override
	public Staff getStaffByUserId(String userId) {

		try {
			System.out.println(userId);
			String qry = "SELECT * FROM staff WHERE stf_user_id = :Id";
			System.out.println(qry);
			Staff staff = null;

			Session session = this.sessionFactory.getCurrentSession();
			SQLQuery query = (SQLQuery) session.createSQLQuery(qry);
			query.addEntity(Staff.class);
			query.setParameter("Id", userId);
			List results = query.list();

			if (results == null || results.isEmpty()) {
				return null;
			}

			for (Iterator iterator = results.iterator(); iterator.hasNext();) {
				staff = new Staff();
				staff = (Staff) iterator.next();
				System.out.print(" Category size: " + staff.getUserCategories().size());

			}

			logger.debug("Staff by username", staff.getStfName());
			return staff;
		} catch (HibernateException e) {

			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		}

	}

}
