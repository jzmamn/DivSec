package com.aymen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aymen.entity.Staff;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/usercreation")
public class UserCreationController {

	@Autowired
	UserCreationService userCreationsSVC;

	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String init(@ModelAttribute("maStaff") Staff staff, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", staff);

		model.addAttribute("cmdDivision", new Staff());
		model.addAttribute("listDivision", this.userCreationsSVC.listSvcStaff());
		return "setup/usercreation";
	}

}
