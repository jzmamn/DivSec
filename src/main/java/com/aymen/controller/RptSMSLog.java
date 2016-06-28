package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Staff;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/rptsmslog")
public class RptSMSLog {

    private static final Logger logger = LoggerFactory.getLogger(RptSMSLog.class);

    @Autowired
    RequestService reqSvc;

    @Autowired
    UserCreationService ucs;

    // This method is called just before the division.jsp file is loading on the
    // browser.
    @RequestMapping(method = RequestMethod.GET)
    public String home(ModelMap model) {
        logger.info("Welcome home! The client locale is {}.");

        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser");
            return "errors_403";
        }

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfDivId", staff.getDivision().getDivId());
        model.addAttribute("stfDivName", staff.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());
        return "reports/trail/rpt_sms_log";
    }

    @RequestMapping(value = "/list-sms-log", method = RequestMethod.GET)
    public @ResponseBody
    List<Object> listSMSLog(ModelMap model) {
        return reqSvc.listSMSLogSvc();
    }

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    private String getUserRole() {
        String userRole = null;
        Object role = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        if (role instanceof UserDetails) {
            userRole = ((UserDetails) role).getAuthorities().toString();
        } else {
            userRole = role.toString();
        }

        userRole = userRole.replace("[", "");
        userRole = userRole.replace("]", "");
        return userRole;
    }

}
