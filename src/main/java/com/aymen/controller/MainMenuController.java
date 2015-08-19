package com.aymen.controller;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/main-menu")
public class MainMenuController {
	private static final Logger logger = LoggerFactory.getLogger(MainMenuController.class);
	
	

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
	
	@RequestMapping(value = "/subject", method = RequestMethod.GET)
	public ModelAndView subject()  {
	    ModelAndView modelAndView = new ModelAndView("pages/subject");
	    return modelAndView;
	}
	
	@RequestMapping(value = "/sub-stages", method = RequestMethod.GET)
	public ModelAndView sbjStages()  {
	    ModelAndView modelAndView = new ModelAndView("pages/subject-stage");
	    return modelAndView;
	}
	
}
