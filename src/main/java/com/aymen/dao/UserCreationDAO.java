package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Staff;

public interface UserCreationDAO {
	public void createStaff(Staff staff);

	public void updateStaff(Staff staff);

	public List<Staff> listStaff();

	public Staff getStaffById(int id);

	public void deleteStaff(int id);
}