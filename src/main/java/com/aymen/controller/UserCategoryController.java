package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Staff;
import com.aymen.entity.UserCategory;
import com.aymen.service.UserCategoryService;

@Controller
@RequestMapping(value = "/usercategory")
public class UserCategoryController {
	@Autowired
	UserCategoryService userCatSVC;

	private static final Logger logger = LoggerFactory.getLogger(UserCategoryController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String init(@ModelAttribute("maStaff") Staff staff, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", staff);

		model.addAttribute("cmdDivision", new Staff());
		model.addAttribute("listDivision", this.userCatSVC.listSvcUserCat());
		return "setup/usercategory";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadCategory", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<UserCategory> getData() {
		return this.userCatSVC.listSvcUserCat();
	}

}
