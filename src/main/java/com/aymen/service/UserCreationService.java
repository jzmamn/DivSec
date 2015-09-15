package com.aymen.service;

import java.util.List;

import com.aymen.entity.Staff;

public interface UserCreationService {
	public void createSvcUser(Staff staff);

	public void updateSvcUser(Staff staff);

	public List<Staff> listSvcStaff();

	public Staff getSvcStaffById(int id);

	public void deleteSvcStaff(int id);

}
