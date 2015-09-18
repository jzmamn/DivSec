package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.UserCategoryDAO;
import com.aymen.entity.UserCategory;

@Service
@Transactional
public class UserCategoryServiceImpl implements UserCategoryService {

	@Autowired
	UserCategoryDAO userCatDAO;

	@Override
	public void createSvcUserCat(UserCategory userCat) {
		this.userCatDAO.createUserCat(userCat);

	}

	@Override
	public void updateSvcUserCat(UserCategory userCat) {
		this.userCatDAO.updateUserCat(userCat);
	}

	@Override
	public List<UserCategory> listSvcUserCat() {
		return this.userCatDAO.listUserCat();
	}

	@Override
	public UserCategory getSvcUserCatById(int id) {
		// TODO Auto-generated method stub
		return this.userCatDAO.getUserCatById(id);
	}

	@Override
	public void deleteSvcUserCat(int id) {
		this.userCatDAO.deleteUserCat(id);

	}

}
