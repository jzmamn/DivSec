package com.aymen.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.UserCreationDAO;
import com.aymen.entity.Staff;
import com.aymen.entity.StaffRole;

@Service("userDetailsService")

public class LoginServiceImpl implements UserDetailsService {
	// private static final Logger logger =
	// LoggerFactory.getLogger(UserDetailsService.class);

	@Autowired
	UserCreationDAO userCreationDAO;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		String userName = username;
		Staff staff = this.userCreationDAO.getStaffByUserId(userName);
		List<GrantedAuthority> authorities = buildUserAuthority(staff.getStaffRoles());
		return buildUserForAuthentication(staff, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<StaffRole> appUserRole) {
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		// Build user's authorities
		for (StaffRole userRole : appUserRole) {
			System.out.println("****" + userRole.getRoleName());
			setAuths.add(new SimpleGrantedAuthority(userRole.getRoleName()));
		}
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
		return Result;
	}

	private User buildUserForAuthentication(Staff user, List<GrantedAuthority> authorities) {
		return new User(user.getStfUserId(), user.getStfPassword(), true, true, true, true, authorities);
	}

}
