package com.aymen.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aymen.entity.Division;

@Controller
@RequestMapping(value = "/mainmenu")
public class MainMenuController {
	private static final Logger logger = LoggerFactory
			.getLogger(MainMenuController.class);

	String strMenu;

	// @RequestMapping(value = "/division", method = RequestMethod.GET)
	// public ModelAndView home(@ModelAttribute("init") Division master,
	// ModelMap model) {
	// logger.info("Welcome home! The client locale is {}.", master);
	// model.addAttribute("master", new Division());
	// return new ModelAndView("setup/division");
	// }

	@RequestMapping(value = "/main/{menuId}", method = RequestMethod.GET)
	public String getProduct(@PathVariable("menuId") String menuId,
			HttpServletResponse response) throws Exception {

		System.out.println("Product Id : " + menuId);

		Integer intMenuId = Integer.parseInt(menuId);

		switch (intMenuId) {

		case 1:
			strMenu = "main";
			break;

		// From 40 to 44 Process
		case 40:
			strMenu = "process/public";
			break;

		case 41:
			strMenu = "process/usercreation";
			break;

		case 42:
			strMenu = "process/division";
			break;

		case 43:
			strMenu = "process/subject";
			break;

		case 44:
			strMenu = "process/subjectstages";

			// FROM 50 TO 58 ADMIN PAGES which comes under the setup
		case 50:
			strMenu = "setup/preference";
			break;

		case 51:
			strMenu = "setup/usercreation";
			break;

		case 52:
			//strMenu = "setup/division";

			response.sendRedirect("division");

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

		case 59:
			strMenu = "setup/usercategory";
			break;

		default:
			strMenu = "main";
			break;
		}

		logger.info(strMenu);
		return strMenu;
	}

}
