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

@Controller
@RequestMapping(value = "/rptrequestremider")
public class RptRequestRemiderController {

	private static final Logger logger = LoggerFactory.getLogger(RptRequestRemiderController.class);

	@Autowired
	RequestService reqSvc;

	// This method is called just before the division.jsp file is loading on the
	// browser.
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome home! The client locale is {}.");
		if (getPrincipal().equals("anonymousUser")) {
			logger.info("anonymousUser");
			return "errors_403";
		}

		model.addAttribute("user", getPrincipal());
		return "reports/process/rpt_request_reminder";
	}

	@RequestMapping(value = "/loadreminder/{reqId}/{fromDate}/{toDate}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> loadRequestRemider(@PathVariable("reqId") int reqId,
			@PathVariable("fromDate") String fromDate, @PathVariable("toDate") String toDate) {
		return this.reqSvc.getReminderRequestsSvc(reqId, fromDate, toDate);
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
