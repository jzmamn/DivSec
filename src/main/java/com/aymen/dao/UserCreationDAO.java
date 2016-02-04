package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Staff;
import com.aymen.entity.StaffRole;

public interface UserCreationDAO {
	public void createStaff(Staff staff);

	public void updateStaff(Staff staff);

	public List<Object> listStaff();

	public List<Object> listStaffById(int stfId);

	public Staff getStaffById(int id);

	public Staff getStaffByUserId(String userId);

	public List getStaffByUserIdWithoutPwd(String userId);

	public void deleteStaff(int id);

	public void saveRole(StaffRole stfRole);

	public void updateRole(StaffRole stfRole);

	public List<Object> listStaffForDropdown(); // this is for select2

}
