package com.aymen.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String goToMain(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "main";
	}

	/*
	@RequestMapping("/dashboard")
	public  String hello() {
		//String str = "This is aymen and rafatha";
		return "dashboard";

	} */
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard()  {
	    ModelAndView modelAndView = new ModelAndView("pages/dashboard");
	    return modelAndView;
	}

	@RequestMapping(value = "/button", method = RequestMethod.GET)
	public ModelAndView button()  {
	    ModelAndView modelAndView = new ModelAndView("pages/button");
	    return modelAndView;
	}
}
