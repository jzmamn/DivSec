package com.aymen.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Instructions;
import com.aymen.entity.Staff;
import com.aymen.service.InstructionService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/instruction")
public class InstructionController {
	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	@Autowired
	InstructionService instSvc;

	@Autowired
	UserCreationService ucs;

	// format date at the binding time
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome Instructioln Controller");

		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());

		return "process/requestprocess";
	}

	// Save or Update Request
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String addRequest(@ModelAttribute("maInstruction") Instructions inst, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			logger.error("addRequest", result.getAllErrors());
			System.out.println("hi this is a good" + result.getAllErrors());
			return "error/error";
		}

		model.addAttribute("insId", inst.getInsId());
		model.addAttribute("request", inst.getRequest().getReqId());
		model.addAttribute("insInstruction", inst.getInsInstruction());
		model.addAttribute("insDate", inst.getInsDate());
		model.addAttribute("insIsRead", inst.getInsIsRead());
		model.addAttribute("insStfId", inst.getInsStfId());

		if (inst.getInsId() == null) {

			this.instSvc.createSvcInstruction(inst);

		} else {
			this.instSvc.updateSvcInstruction(inst);
		}
		model.addAttribute("maInstruction", new Instructions());
		return "process/requestprocess";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadsbjstage/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Instructions> getData(@ModelAttribute("maInstruction") Instructions inst,
			BindingResult result, @PathVariable("id") int id, Model model) {
		return this.instSvc.listSvcInstByRequest(id);
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
