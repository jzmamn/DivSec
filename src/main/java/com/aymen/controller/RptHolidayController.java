package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Division;
import com.aymen.entity.Holiday;
import com.aymen.entity.Staff;
import com.aymen.service.HolidayService;
import com.aymen.service.UserCreationService;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Controller
@RequestMapping(value = "/rpt_holiday")
public class RptHolidayController {

    private static final Logger logger = LoggerFactory.getLogger(RptHolidayController.class);

    @Autowired
    HolidayService holidaySvc;

    @Autowired
    UserCreationService ucs;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    // This method is called just before the division.jsp file is loading on the
    // browser.
    @RequestMapping(method = RequestMethod.GET)
    public String home(@ModelAttribute("maHoliday") Holiday holiday, ModelMap model) {
        logger.info("Welcome home! The client locale is {}.", holiday);
        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser", holiday);
            return "errors_403";
        }

       
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfName", staff.getStfName());
        model.addAttribute("stfDivId", staff.getDivision().getDivId());
        model.addAttribute("stfDivName", staff.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());
        model.addAttribute("cmdDivision", new Division());
        return "reports/list/rpt_holiday";
    }

 
    // This method sends JSON response to the client (REST)
    @RequestMapping(value = "/loadholiday", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Holiday> getData() {
        return this.holidaySvc.listHolidaySvc();
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
