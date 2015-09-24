package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Division;
import com.aymen.entity.Staff;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/usercreation")
public class UserCreationController {

	@Autowired
	UserCreationService userCreationsSVC;

	private static final Logger logger = LoggerFactory.getLogger(UserCreationController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String init(@ModelAttribute("maStaff") Staff staff, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", staff);

		model.addAttribute("cmdUserCreation", new Staff());
		model.addAttribute("listDivision", this.userCreationsSVC.listSvcStaff());
		return "setup/usercreation";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loaduser", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Staff> getData() {
		return this.userCreationsSVC.listSvcStaff();
	}

	// Create User or staff accounts - save and update
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String addDivision(@ModelAttribute("maStaff") Staff staff, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			logger.error("addPerson", result.getAllErrors());
			System.out.println("addPerson  " + result.getAllErrors());
			return "error/error";
		}
		System.out.println(staff.getStfId());

		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfName", staff.getStfName());
		model.addAttribute("stfUserId", staff.getStfUserId());
		model.addAttribute("stfPassword", staff.getStfName());
		model.addAttribute("stfEmail", staff.getStfEmail());
		model.addAttribute("stfMobile", staff.getStfMobile());
		model.addAttribute("stfNote", staff.getStfNote());
		model.addAttribute("stfActive", staff.getStfActive());

		System.out.println("Category Id" + staff.getUserCategory().getCatId());
		System.out.println("Dv Id" + staff.getDivision().getDivId());

		model.addAttribute("userCategory", staff.getUserCategory().getCatId());
		model.addAttribute("division", staff.getDivision().getDivId());

		if (staff.getStfId() == null) {
			this.userCreationsSVC.createSvcStaff(staff);
		} else {
			this.userCreationsSVC.updateSvcStaff(staff);
		}

		model.addAttribute("cmdDivision", new Division());
		// model.addAttribute("listDivision",
		// this.divisionSvc.listSvcDivision());

		return "setup/division";
	}

}
