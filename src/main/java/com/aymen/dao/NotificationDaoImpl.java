package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Notification;

@Repository
public class NotificationDaoImpl implements NotificationDao {
	private static final Logger logger = LoggerFactory.getLogger(Notification.class);

	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Notification> listNotification() {
		Session session = sessionFactory.getCurrentSession();
		List<Notification> listNotification = session.createQuery(" from Notification").list();
		for (Notification d : listNotification) {
			logger.info("Gender List::" + d);
		}
		return listNotification;
	}

}
