package com.aymen.service;

import java.util.List;

import com.aymen.entity.Staff;

public interface UserCreationService {
	public void createSvcStaff(Staff staff);

	public void updateSvcStaff(Staff staff);

	public List<Object> listSvcStaff();

	public List<Object> listStaffById(int stfId);

	public Staff getSvcStaffById(int id);

	public Staff getSvcStaffByUserId(String userId);

	public List getSvcStaffByUserIdWithoutPwd(String userId);

	public void deleteSvcStaff(int id);

	public void saveSvcRole(Staff stf);

	public void updateSvcRole(Staff stf);

	public List<Object> listStaffForDropdown(); // this is for select2
        
        public List<Object> getStaffByUserRoleSvc(String stfRole);

}
