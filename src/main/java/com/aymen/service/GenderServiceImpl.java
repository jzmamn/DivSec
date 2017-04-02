package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.GenderDao;
import com.aymen.entity.Gender;

@Service
@Transactional
public class GenderServiceImpl implements GenderService {

	@Autowired
	GenderDao genderDao;

	@Override
	public List<Gender> listSvcGender() {
		return this.genderDao.listGender();
	}

}
