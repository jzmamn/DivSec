package com.aymen.dao;

import java.util.List;

import com.aymen.entity.UserCategory;

public interface UserCategoryDAO {
	public void createUserCat(UserCategory userCat);

	public void updateUserCat(UserCategory userCat);

	public List<UserCategory> listUserCat();

	public UserCategory getUserCatById(int id);

	public void deleteUserCat(int id);
}
