package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Division;
import com.aymen.service.DivisionService;

@Controller
@RequestMapping(value = "/division")
public class DivisionController {

	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	@Autowired
	DivisionService divisionSvc;

	@RequestMapping(method = RequestMethod.GET)
	public String home(@ModelAttribute("maDivision") Division division, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", division);

		model.addAttribute("cmdDivision", new Division());
		model.addAttribute("listDivision", this.divisionSvc.listSvcDivision());
		return "setup/division";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String addDivision(@ModelAttribute("maDivision") Division division, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			logger.error("addPerson", result.getAllErrors());
			return "error/error";
		}

		System.out.println(division.getDivId());

		model.addAttribute("id", division.getDivId());
		model.addAttribute("divName", division.getDivName());
		model.addAttribute("divActive", division.getDivActive());

		System.out.println(division.getDivName());
		System.out.println(division.getDivActive());

		logger.info("Division Name", division.getDivName());
		logger.info("Division Active", division.getDivActive());

		if (division.getDivId() == null) {
			this.divisionSvc.createSvcDivision(division);
		} else {
			this.divisionSvc.updateSvcDivision(division);
		}

		model.addAttribute("cmdDivision", new Division());
		model.addAttribute("listDivision", this.divisionSvc.listSvcDivision());

		return "setup/division";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/create1", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Division> getData() {
		return this.divisionSvc.listSvcDivision();
	}

	@RequestMapping("/delete/{id}")
	public @ResponseBody String deleteDivision(@ModelAttribute("maDivision") Division division, BindingResult result,
			@PathVariable("id") int id, Model model) {
		try {
			model.addAttribute("cmdDivision", new Division());
			this.divisionSvc.deleteSvcDivision(id);
			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "Delete Failed ! " + "\n" + e.toString();
		}

	}

}
