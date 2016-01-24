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

import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/divperstatus")
public class RptDivPerStatusController {

	private static final Logger logger = LoggerFactory.getLogger(RptDivPerStatusController.class);

	@Autowired
	RequestService reqSvc;

	@Autowired
	UserCreationService ucs;

	// This method is called just before the division.jsp file is loading on the
	// browser.
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome home! The client locale is {}.");
		model.addAttribute("user", getPrincipal());
		return "reports/process/rpt_reques_div_period_status";
	}

	// display the count in the batch
	@RequestMapping(value = "/filterby/{divId}/{month}/{year}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> getDivPeriodStatus(@PathVariable("divId") int divId,
			@PathVariable("month") int month, @PathVariable("year") int year) {

		return this.reqSvc.getDivPeriodStatus(divId, month, year);
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

}
