package com.aymen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/mainmenu")
public class MainMenuController {
	private static final Logger logger = LoggerFactory
			.getLogger(MainMenuController.class);

	ModelAndView mavMenu;

	@RequestMapping(value = "/main/{menuId}", method = RequestMethod.GET)
	public ModelAndView getProduct(@PathVariable("menuId") String menuId) {

		System.out.println("Product Id : " + menuId);

		Integer intMenuId = Integer.parseInt(menuId);

		switch (intMenuId) {

		case 1:
			mavMenu = new ModelAndView("main");
			break;

		case 52:
			mavMenu = new ModelAndView("/setup/subject");
			break;

		default:
			break;
		}

		return mavMenu;
	}

}
