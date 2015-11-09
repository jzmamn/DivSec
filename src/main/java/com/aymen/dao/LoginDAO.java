package com.aymen.dao;

import com.aymen.entity.Staff;

public interface LoginDAO {
	public Staff findByUserName(String username);
}
