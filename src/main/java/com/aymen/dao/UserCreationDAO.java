package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Staff;

public interface UserCreationDAO {
	public void createUser(Staff staff);

	public void updateUser(Staff staff);

	public List<Staff> listStaff();

	public Staff getStaffById(int id);

	public void deleteStaff(int id);
}
