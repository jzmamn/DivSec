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

import com.aymen.entity.Subject;
import com.aymen.service.SubjectService;

@Controller
@RequestMapping(value = "/subject")
public class SubjectController {
	private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);

	@Autowired
	SubjectService subjectSvc;

	@RequestMapping(method = RequestMethod.GET)
	public String home(@ModelAttribute("maSubject") Subject subject, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", subject);
		model.addAttribute("cmdSubject", new Subject());
		return "setup/subject";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadsubject", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Subject> getData() {
		return this.subjectSvc.listSvcSubject();
	}

	// Create User or staff accounts - save and update
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody String addSubject(@ModelAttribute("maSubject") Subject subject, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			logger.error("addSubject", result.getAllErrors());
			System.out.println("addSubject  " + result.getAllErrors());
			return "error/error";
		}

		model.addAttribute("sbjId", subject.getSbjId());
		model.addAttribute("sbjCode", subject.getSbjCode());
		model.addAttribute("sbjName", subject.getSbjName());
		model.addAttribute("sbjActive", subject.getSbjActive());
		model.addAttribute("sbjDuration", subject.getSbjDuration());
		model.addAttribute("sbjCost", subject.getSbjCost());

		model.addAttribute("division", subject.getDivision().getDivId());

		try {
			if (subject.getSbjId() == null) {
				this.subjectSvc.createSvcSubject(subject);
				return "1";
			} else {
				this.subjectSvc.updateSvcSubject(subject);
				return "1";
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			// return "Save Failed ! " + "\n" + e.toString();
			logger.error(e.toString());
			return "Save Failed ! ";
		}

	}

	@RequestMapping("/delete/{id}")
	public @ResponseBody String deleteSubject(@ModelAttribute("maSubject") Subject subject, BindingResult result,
			@PathVariable("id") int id, Model model) {
		try {
			this.subjectSvc.deleteSvcSubject(id);
			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			logger.error(e.toString());
			return "Delete Failed ! " + "\n" + "Subject could not be deleted";
		}

	}

}
