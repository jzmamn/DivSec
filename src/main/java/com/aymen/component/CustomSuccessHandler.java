/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aymen.component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    protected String determineTargetUrl(Authentication authentication) {
        String url = "";

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        List<String> roles = new ArrayList<String>();

        for (GrantedAuthority a : authorities) {
            roles.add(a.getAuthority());
        }

        if (isAdmin(roles)) {
            url = "/admin";
        } else if (isDS(roles)) {
            url = "/ds";
        } else if (isHod(roles)) {
            url = "/hod";
        } else if (isStaff(roles)) {
            url = "/staff";
        } else if (isClient(roles)) {
            url = "/client";
        } else {
            url = "/Access_Denied";
        }

        return url;
    }

    private boolean isAdmin(List<String> roles) {
        if (roles.contains("ROLE_ADMIN")) {
            return true;
        }
        return false;
    }

    private boolean isDS(List<String> roles) {
        if (roles.contains("ROLE_DS")) {
            return true;
        }
        return false;
    }

    private boolean isHod(List<String> roles) {
        if (roles.contains("ROLE_HOD")) {
            return true;
        }
        return false;
    }

    private boolean isStaff(List<String> roles) {
        if (roles.contains("ROLE_STAFF")) {
            return true;
        }
        return false;
    }

    private boolean isClient(List<String> roles) {
        if (roles.contains("ROLE_CLIENT")) {
            return true;
        }
        return false;
    }

    @Override
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }

    @Override
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }

}
