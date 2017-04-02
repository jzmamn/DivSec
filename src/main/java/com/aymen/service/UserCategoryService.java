package com.aymen.service;

import java.util.List;

import com.aymen.entity.UserCategory;

public interface UserCategoryService {
	public void createSvcUserCat(UserCategory userCat);

	public void updateSvcUserCat(UserCategory userCat);

	public List<UserCategory> listSvcUserCat();

	public UserCategory getSvcUserCatById(int id);

	public void deleteSvcUserCat(int id);
}
