package com.aymen.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.LoginDAO;
import com.aymen.entity.Staff;

@Service("loginService")
@Transactional

public class LoginServiceImpl implements UserDetailsService {
	@Autowired
	private LoginDAO loginDao;

	@SuppressWarnings("static-access")
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Staff staff = loginDao.findByUserName(userName);
		System.out.println("User : " + staff);
		if (staff == null) {
			System.out.println("staff not found");
			throw new UsernameNotFoundException("Username not found");
		}
		return new org.springframework.security.core.userdetails.User(staff.getStfUserId(), staff.getStfPassword(),
				staff.getStfActive().TRUE, true, true, true, getGrantedAuthorities(staff));
	}

	private List<GrantedAuthority> getGrantedAuthorities(Staff staff) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		return authorities;
	}
}
