package com.aymen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aymen.entity.Division;
import com.aymen.service.DivisionService;

@Controller
@RequestMapping(value = "/division")
public class DivisionController {

	private static final Logger logger = LoggerFactory
			.getLogger(DivisionController.class);

	@Autowired
	DivisionService divisionSvc;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(@ModelAttribute("maDivision") Division division,
			ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", division);
		model.addAttribute("cmdDivision", new Division());
		return new ModelAndView("setup/division");
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView addPerson(
			@ModelAttribute("maDivision") Division division,
			BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			System.out.println("========================================="
					+ result.getAllErrors());
			logger.error("Id.", result.getAllErrors());
			return new ModelAndView("error/error", "", result);
		}

		model.addAttribute("divName", division.getDivName());
		model.addAttribute("divActive", division.getDivActive());

		System.out.println(division.getDivName());
		System.out.println(division.getDivActive());

		if (division.getDivId() == null) {
			this.divisionSvc.createSvcDivision(division);

		} else {
			this.divisionSvc.updateSvcDivision(division);
		}

		model.addAttribute("cmdDivision", new Division());

		return new ModelAndView("setup/division");
	}

}
