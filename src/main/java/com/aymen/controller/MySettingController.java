package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Request;
import com.aymen.entity.Staff;
import com.aymen.entity.UserCategory;
import com.aymen.service.UserCategoryService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/mysetup")
public class MySettingController {

    private static final Logger logger = LoggerFactory.getLogger(MySettingController.class);

    @Autowired
    UserCreationService userCreationsSVC;

    @Autowired
    UserCategoryService ucs;

    @RequestMapping(method = RequestMethod.GET)
    public String init(@ModelAttribute("maStaff") Staff staff, ModelMap model) {
        model.addAttribute("maRequest", new Request());

        Staff staff1 = userCreationsSVC.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff1.getStfId());
        model.addAttribute("stfDivId", staff1.getDivision().getDivId());
        model.addAttribute("stfDivName", staff1.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());

        return "setup/mysetting";
    }

    // Create User or staff accounts - save and update
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public @ResponseBody
    String addPerson(@ModelAttribute("maStaff") Staff staff, BindingResult result,
            ModelMap model) {
        if (result.hasErrors()) {
            logger.error("addPerson", result.getAllErrors());
            System.out.println("addPerson  " + result.getFieldError());
            return "error/error";
        }

        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfName", staff.getStfName());
        model.addAttribute("stfUserId", staff.getStfUserId());
        model.addAttribute("stfPassword", staff.getStfName());
        model.addAttribute("stfEmail", staff.getStfEmail());
        model.addAttribute("stfMobile", staff.getStfMobile());
        model.addAttribute("stfNote", staff.getStfNote());
        model.addAttribute("stfActive", staff.getStfActive());
        model.addAttribute("stfRole", staff.getStfRole());
        model.addAttribute("stfCategoryId", staff.getStfCategoryId());
        model.addAttribute("division", staff.getDivision().getDivId());

        try {
            if (staff.getStfId() == null) {
                this.userCreationsSVC.createSvcStaff(staff);
                this.userCreationsSVC.saveSvcRole(staff);
                return "1";
            } else {
                this.userCreationsSVC.updateSvcStaff(staff);
                this.userCreationsSVC.updateSvcRole(staff);
                return "1";
            }

        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
            // return "Save Failed ! " + "\n" + e.toString();
            logger.error(e.toString());
            return "Save Failed ! " + "\n" + "User id already exists";
        }

    }

    @RequestMapping(value = "/loadbyuserid/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    Staff getUserByUserId(@PathVariable("id") String userName, Model model) {
        return this.userCreationsSVC.getSvcStaffByUserId(userName);
    }

    @RequestMapping(value = "/loadbystfId/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> getUserByStfId(@PathVariable("id") int stfId, Model model) {
        return this.userCreationsSVC.listStaffById(stfId);
    }

    @ModelAttribute("roles")
    public List<UserCategory> initializeProfiles() {
        return ucs.listSvcUserCat();
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
