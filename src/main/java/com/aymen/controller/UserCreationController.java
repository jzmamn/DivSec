package com.aymen.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
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

import com.aymen.entity.Staff;
import com.aymen.entity.UserCategory;
import com.aymen.service.UserCategoryService;
import com.aymen.service.UserCreationService;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/usercreation")
public class UserCreationController {

	@Autowired
	UserCreationService userCreationsSVC;

	@Autowired
	UserCategoryService ucats;

	private static final Logger logger = LoggerFactory.getLogger(UserCreationController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String init(@ModelAttribute("maStaff") Staff staff, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", staff);
		if (getPrincipal().equals("anonymousUser")) {
			logger.info("anonymousUser");
			return "errors_403";
		}

		Staff stf = userCreationsSVC.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", stf.getStfId());
		model.addAttribute("stfDivId", stf.getDivision().getDivId());
		model.addAttribute("stfDivName", stf.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		model.addAttribute("cmdUserCreation", new Staff());
		return "setup/usercreation";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loaduser", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> getData() {
		return this.userCreationsSVC.listSvcStaff();
	}

	// Create User or staff accounts - save and update
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody String addPerson(@ModelAttribute("maStaff") Staff staff, BindingResult result,
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
				// this.userCreationsSVC.updateSvcRole(staff);
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

	@RequestMapping("/delete/{id}")
	public @ResponseBody String deleteStaff(@ModelAttribute("maStaff") Staff staff, BindingResult result,
			@PathVariable("id") int id, Model model) {
		try {
			model.addAttribute("cmdDivision", new Staff());
			this.userCreationsSVC.deleteSvcStaff(id);
			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			logger.error(e.toString());
			return "Delete Failed ! " + "\n" + "Staff could not be deleted";
		}

	}

	@RequestMapping(value = "/loadbyuserid/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Staff getUserByUserId(@PathVariable("id") String userName, Model model) {
		return this.userCreationsSVC.getSvcStaffByUserId(userName);
	}

	@RequestMapping(value = "/load-staff-dropdown", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String getStaffDropdown(Model model)
			throws JsonGenerationException, JsonMappingException, IOException {

		List<Object> lst = this.userCreationsSVC.listStaffForDropdown();
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(out, lst);
		System.out.println(out.toString());
		return out.toString();
	}

	@ModelAttribute("roles")
	public List<UserCategory> initializeProfiles() {
		return ucats.listSvcUserCat();
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
