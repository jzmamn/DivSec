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

import com.aymen.entity.Division;
import com.aymen.entity.Staff;
import com.aymen.service.DivisionService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/division")
public class DivisionController {

	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	@Autowired
	DivisionService divisionSvc;

	@Autowired
	UserCreationService ucs;

	// This method is called just before the division.jsp file is loading on the
	// browser.
	@RequestMapping(method = RequestMethod.GET)
	public String home(@ModelAttribute("maDivision") Division division, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", division);
		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfName", staff.getStfName());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		model.addAttribute("cmdDivision", new Division());
		return "setup/division";
	}

	// Save or Update division
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String addDivision(@ModelAttribute("maDivision") Division division, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			logger.error("addPerson", result.getAllErrors());
			return "error/error";
		}
		System.out.println(division.getDivId());

		model.addAttribute("id", division.getDivId());
		model.addAttribute("divName", division.getDivName());
		model.addAttribute("divActive", division.getDivActive());

		System.out.println(division.getDivName());
		System.out.println(division.getDivActive());
		logger.info("Division Name", division.getDivName());
		logger.info("Division Active", division.getDivActive());

		if (division.getDivId() == null) {
			this.divisionSvc.createSvcDivision(division);
		} else {
			this.divisionSvc.updateSvcDivision(division);
		}

		model.addAttribute("cmdDivision", new Division());
		model.addAttribute("listDivision", this.divisionSvc.listSvcDivision());
		return "setup/division";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/create1", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Division> getData() {
		return this.divisionSvc.listSvcDivision();
	}

	@RequestMapping(value = "/loadactivedivision", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Division> getActiveDivision() {
		return this.divisionSvc.listSvcActiveDivision();
	}

	// Delete a division using division id
	@RequestMapping("/delete/{id}")
	public @ResponseBody String deleteDivision(@ModelAttribute("maDivision") Division division, BindingResult result,
			@PathVariable("id") int id, Model model) {
		try {
			model.addAttribute("cmdDivision", new Division());
			this.divisionSvc.deleteSvcDivision(id);
			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "Delete Failed ! " + "\n" + e.toString();
		}

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
