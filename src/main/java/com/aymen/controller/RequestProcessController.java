package com.aymen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/reqprocess")
public class RequestProcessController {
	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	// @Autowired
	// DivisionService divisionSvc;

	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		logger.info("Welcome home! The client locale is {}.");
		return "process/requestprocess";
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
