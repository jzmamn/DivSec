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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.PublicIndividual;
import com.aymen.service.PublicDetailService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/rptpublic")
public class RptPublicController {

	private static final Logger logger = LoggerFactory.getLogger(RptPublicController.class);

	@Autowired
	PublicDetailService pds;

	@Autowired
	UserCreationService ucs;

	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome home! The client locale is {}.");
		model.addAttribute("user", getPrincipal());
		return "reports/process/rpt_public";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadpi", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<PublicIndividual> getListOfPI() {
		return this.pds.listSvcPublicIndividual();
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
