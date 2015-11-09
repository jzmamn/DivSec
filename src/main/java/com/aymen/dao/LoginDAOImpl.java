package com.aymen.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Staff;

@Repository("loginDao")
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SessionFactory sessionFactory;

	Session session = null;
	Transaction tx = null;

	@Override
	public Staff findByUserName(String username) {
		Session session = this.sessionFactory.getCurrentSession();
		Staff user = (Staff) session.load(Staff.class, new String(username));
		return user;
	}

}
