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

import com.aymen.entity.Staff;
import com.aymen.entity.SubjecStage;
import com.aymen.service.SubjectStageService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/sbjstages")
public class SbjStageController {

	private static final Logger logger = LoggerFactory.getLogger(SbjStageController.class);

	@Autowired
	SubjectStageService sbjStgSvc;

	@Autowired
	UserCreationService ucs;

	@RequestMapping(method = RequestMethod.GET)
	public String home(@ModelAttribute("maSbjStg") SubjecStage sbjStg, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", sbjStg);
		if (getPrincipal().equals("anonymousUser")) {
			logger.info("anonymousUser");
			return "errors_403";
		}

		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		model.addAttribute("masbjStg", new SubjecStage());
		return "setup/subjectstages";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody String addSbjStg(@ModelAttribute("maSbjStg") SubjecStage sbjStg, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("binding error " + result.getFieldErrors("txtSbjId"));
			logger.error("addSbjStg", result.getAllErrors());
			return "error/error";
		}

		System.out.println("Subject Id" + sbjStg.getSubject().getSbjId());
		System.out.println("Stage id " + sbjStg.getStgId());

		model.addAttribute("stgId", sbjStg.getStgId());
		model.addAttribute("subject", sbjStg.getSubject().getSbjId());
		model.addAttribute("stgName", sbjStg.getStgName());
		model.addAttribute("stgActive", sbjStg.getStgActive());
		model.addAttribute("stgCost", sbjStg.getStgCost());

		System.out.println("Stage id= " + sbjStg.getStgId());

		System.out.println(sbjStg.getStgName());
		System.out.println(sbjStg.getSubject().getSbjId());

		try {
			if (sbjStg.getStgId() == null) {
				this.sbjStgSvc.createSvcSbjStg(sbjStg);
				return "1";
			} else {
				this.sbjStgSvc.updateSvcSbjStg(sbjStg);
				return "1";
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			logger.error(e.toString());
			return "Save Failed ! " + "\n" + "Subject Stage id already exists";
		}

	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadsbjstage/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<SubjecStage> getData(@ModelAttribute("maSbjStg") SubjecStage sbjStg, BindingResult result,
			@PathVariable("id") int id, Model model) {
		return this.sbjStgSvc.listSvcSbjStgBySbjId(id);
	}

	@RequestMapping("/delete/{id}")
	public @ResponseBody String deleteSbjStg(@ModelAttribute("maSbjStg") SubjecStage sbjStg, BindingResult result,
			@PathVariable("id") int id, Model model) {
		try {
			model.addAttribute("cmdSubjecStage", new SubjecStage());
			this.sbjStgSvc.deleteSvcSbjStg(id);
			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "Delete Failed ! " + "\n" + e.toString();
		}
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

	private String getUserRole() {
		String userRole = null;
		Object role = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

		if (role instanceof UserDetails) {
			userRole = ((UserDetails) role).getAuthorities().toString();
		} else {
			userRole = role.toString();
		}

		userRole = userRole.replace("[", "");
		userRole = userRole.replace("]", "");
		return userRole;
	}
}
