package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.UserCreationDAO;
import com.aymen.entity.Staff;

@Service
@Transactional
public class UserCreationServiceImpl implements UserCreationService {

	@Autowired
	private UserCreationDAO userCreationDAO;

	@Override
	public void createSvcStaff(Staff staff) {
		this.userCreationDAO.createStaff(staff);

	}

	@Override
	public void updateSvcStaff(Staff staff) {
		this.userCreationDAO.updateStaff(staff);

	}

	@Override
	public List<Staff> listSvcStaff() {

		return this.userCreationDAO.listStaff();
	}

	@Override
	public Staff getSvcStaffById(int id) {

		return this.userCreationDAO.getStaffById(id);
	}

	@Override
	public void deleteSvcStaff(int id) {
		this.userCreationDAO.deleteStaff(id);

	}

}
