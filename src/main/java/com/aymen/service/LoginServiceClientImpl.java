package com.aymen.service;

import com.aymen.dao.PublicDetailDAO;
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

import com.aymen.entity.ClientRole;
import com.aymen.entity.PublicIndividual;

@Service()
public class LoginServiceClientImpl implements UserDetailsService {
    // private static final Logger logger =
    // LoggerFactory.getLogger(UserDetailsService.class);

    @Autowired
    PublicDetailDAO piDao;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
        String userName = username;
        PublicIndividual pi = this.piDao.getPublicByUserId(userName);
        List<GrantedAuthority> authorities = buildUserAuthority(pi.getClientRoles());
        return buildUserForAuthentication(pi, authorities);

    }

    private List<GrantedAuthority> buildUserAuthority(Set<ClientRole> appUserRole) {
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
        // Build user's authorities
        for (ClientRole userRole : appUserRole) {
            System.out.println("****" + userRole.getRoleRoleName());
            setAuths.add(new SimpleGrantedAuthority(userRole.getRoleRoleName()));
        }
        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
        return Result;
    }

    private User buildUserForAuthentication(PublicIndividual user, List<GrantedAuthority> authorities) {
        return new User(user.getPiIndUserId(), user.getPiUserPwd(), true, true, true, true, authorities);
    }

}
