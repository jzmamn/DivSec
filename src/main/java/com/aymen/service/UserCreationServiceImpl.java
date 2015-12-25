package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
		staff.setStfPassword(encrypPassword(staff.getStfPassword()));
		this.userCreationDAO.createStaff(staff);
	}

	@Override
	public void updateSvcStaff(Staff staff) {
		staff.setStfPassword(encrypPassword(staff.getStfPassword()));
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

	@Override
	public Staff getSvcStaffByUserId(String userId) {
		return this.userCreationDAO.getStaffByUserId(userId);
	}

	@Override
	public List getSvcStaffByUserIdWithoutPwd(String userId) {
		return this.userCreationDAO.getStaffByUserIdWithoutPwd(userId);
	}

	/**
	 * Password encryption using BCrypt
	 */
	private String encrypPassword(String pwd) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(pwd);
		return hashedPassword;
	}

}
