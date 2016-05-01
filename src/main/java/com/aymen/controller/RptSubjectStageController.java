package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.SubjecStage;
import com.aymen.service.SubjectStageService;

@Controller
@RequestMapping(value = "/rptsubjectstage")
public class RptSubjectStageController {

	private static final Logger logger = LoggerFactory.getLogger(RptRequestController.class);

	@Autowired
	SubjectStageService sbjStgSvc;

	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome home! The client locale is {}.");

		if (getPrincipal().equals("anonymousUser")) {
			logger.info("anonymousUser");
			return "errors_403";
		}

		model.addAttribute("user", getPrincipal());
		return "reports/list/rpt_subject_stage";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadallsbjstage", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<SubjecStage> loadStage(Model model) {
		return this.sbjStgSvc.listSvcSbjStg();
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadsbjstage/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<SubjecStage> getData(@ModelAttribute("maSbjStg") SubjecStage sbjStg, BindingResult result,
			@PathVariable("id") int id, Model model) {
		return this.sbjStgSvc.listSvcSbjStgBySbjId(id);
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
