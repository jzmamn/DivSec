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

import com.aymen.entity.Request;
import com.aymen.entity.Staff;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/reqprocess")
public class RequestController {
	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	@Autowired
	RequestService reqSvc;

	@Autowired
	UserCreationService ucs;

	// format date at the binding time
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@RequestMapping(method = RequestMethod.GET)
	public String home(@ModelAttribute("maRequest") Request req, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", req);

		model.addAttribute("maRequest", new Request());

		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());

		model.addAttribute("userName", getPrincipal());

		return "process/requestprocess";
	}

	// Save or Update Request
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String addRequest(@ModelAttribute("maRequest") Request req, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			logger.error("addRequest", result.getAllErrors());
			System.out.println("hi this is a good" + result.getAllErrors());
			return "error/error";
		}

		model.addAttribute("reqId", req.getReqId());
		model.addAttribute("division", req.getDivision().getDivId());
		model.addAttribute("publicIndividual", req.getPublicIndividual().getPiId());
		model.addAttribute("staff", req.getStaff().getStfId());
		model.addAttribute("subject", req.getSubject().getSbjId());
		model.addAttribute("reqEntDate", req.getReqEntDate());
		model.addAttribute("reqNote", req.getReqNote());
		model.addAttribute("reqFees", req.getReqFees());
		model.addAttribute("reqDurartion", req.getReqDurartion());
		model.addAttribute("reqStatusId", req.getRequestStatus().getRsId());
		model.addAttribute("reqIsRead", req.getReqIsRead());
		model.addAttribute("reqProcessed", req.getReqProcessed());
		model.addAttribute("reqIsVoid", req.getReqIsVoid());

		if (req.getReqId() == null) {

			this.reqSvc.createSvcRequest(req);

		} else {
			this.reqSvc.updateSvcRequest(req);
		}
		model.addAttribute("maRequest", new Request());
		return "process/requestprocess";
	}

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadrequest", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Request> getData() {
		return this.reqSvc.listSvcRequest();
	}

	// Delete a division using division id
	@RequestMapping("/delete/{id}")
	public @ResponseBody String deleteDivision(@ModelAttribute("maRequest") Request req, BindingResult result,
			@PathVariable("id") int id, Model model) {
		try {
			model.addAttribute("maRequest", new Request());
			this.reqSvc.deleteSvcRequest(id);
			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "Delete Failed ! " + "\n" + e.toString();
		}

	}

	// Update request after status changing
	@RequestMapping("/requestid/{requestId}/statusid/{statusId}/void/{void}/note/{note}")
	public @ResponseBody String updateReqStatus(@PathVariable("requestId") int reqId,
			@PathVariable("statusId") int reqStatusId, @PathVariable("void") boolean isVoid,
			@PathVariable("note") String note) {
		try {

			this.reqSvc.updateSvcRequestStatus(reqId, reqStatusId, isVoid, note);

			return "1";
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "Request Status Updated ! " + "\n" + e.toString();
		}

	}

	// display the count in the batch
	@RequestMapping(value = "/batchcount", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> getBatchCount() {
		return this.reqSvc.listSvcBatchCount();
	}

	// display request by status
	@RequestMapping(value = "/status/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Request> loadRequestByStaus(@PathVariable("id") int id) {
		return this.reqSvc.getSvcReqByStatus(id);
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
