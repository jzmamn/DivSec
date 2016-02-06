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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Staff;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/rptrequesttrail")
public class RptRequestTrailController {

	private static final Logger logger = LoggerFactory.getLogger(RptRequestTrailController.class);

	@Autowired
	RequestService reqSvc;

	@Autowired
	UserCreationService ucs;

	// This method is called just before the division.jsp file is loading on the
	// browser.
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome home! The client locale is {}.");
		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		return "reports/trail/rpt_request_trail";
	}

	@RequestMapping(value = "/loadTrail/{reqId}/{sbjId}/{pubId}/{divId}/{statusId}/{staffId}/{fromDate}/{toDate}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> filterReport(@PathVariable("reqId") int reqId, @PathVariable("sbjId") int sbjId,
			@PathVariable("pubId") int pubId, @PathVariable("divId") int divId, @PathVariable("statusId") int statusId,
			@PathVariable("staffId") int staffId, @PathVariable("fromDate") String fromDate,
			@PathVariable("toDate") String toDate) {

		return this.reqSvc.getSvcRequestTrail(reqId, sbjId, pubId, divId, statusId, staffId, fromDate, toDate);

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
