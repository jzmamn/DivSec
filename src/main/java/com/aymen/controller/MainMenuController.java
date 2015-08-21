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

	String strMenu;

	@RequestMapping(value = "/main/{menuId}", method = RequestMethod.GET)
	public String getProduct(@PathVariable("menuId") String menuId) {

		System.out.println("Product Id : " + menuId);

		Integer intMenuId = Integer.parseInt(menuId);

		switch (intMenuId) {

		case 1:
			strMenu = "main";
			break;
			
		//FROM 50 TO 58 ADMIN PAGES
		case 50:
			strMenu = "setup/preference";
			break;

		case 51:
			strMenu = "setup/usercreation";
			break;

		case 52:
			strMenu = "setup/division";
			break;

		case 53:
			strMenu = "setup/subject";
			break;

		case 54:
			strMenu = "setup/subjectstages";
			break;
			
		case 55:
			strMenu = "setup/subjectstatus";
			break;

	

		case 56:
			strMenu = "setup/stagestatus";
			break;
			
		case 57:
			strMenu = "setup/email";
			break;
			
		case 58:
			strMenu = "setup/sms";
			break;

		default:
			strMenu = "main";
			break;
		}
		
		logger.info(strMenu);
		return strMenu;
	}

}
