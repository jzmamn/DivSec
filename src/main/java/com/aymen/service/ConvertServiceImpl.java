package com.aymen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.entity.UserCategory;

@Service
@Transactional
public class ConvertServiceImpl implements Converter<Object, UserCategory> {
	@Autowired
	UserCategoryService ucs;

	@Override
	public UserCategory convert(Object element) {
		Integer id = Integer.parseInt((String) element);
		UserCategory cat = ucs.getSvcUserCatById(id);
		System.out.println("Profile : " + cat);
		return cat;
	}

}
