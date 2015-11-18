package com.aymen.service;

import java.util.List;

import com.aymen.entity.Staff;

public interface UserCreationService {
	public void createSvcStaff(Staff staff);

	public void updateSvcStaff(Staff staff);

	public List<Staff> listSvcStaff();

	public Staff getSvcStaffById(int id);

	public Staff getSvcStaffByUserId(String userId);

	public void deleteSvcStaff(int id);

}
