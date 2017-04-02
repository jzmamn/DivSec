package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.NotificationDao;
import com.aymen.entity.Notification;

@Repository
@Transactional
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	NotificationDao ntDao;

	@Override
	public List<Notification> listSvcGender() {

		return this.ntDao.listNotification();
	}

}
