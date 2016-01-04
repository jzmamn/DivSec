package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.ProcessStage;
import com.aymen.service.ProcessStageService;

@Controller
@RequestMapping(value = "/processstg")
public class ProcessStageController {

	@Autowired
	ProcessStageService prcStgSvc;

	private static final Logger logger = LoggerFactory.getLogger(ProcessStageController.class);

	// @RequestMapping(method = RequestMethod.GET)
	// public String home(ModelMap model) {
	// logger.info("Welcome home! The client locale is {}.");
	// return "process/requestprocess";
	// }

	@RequestMapping(value = "/loadreqstage/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<ProcessStage> getData(@ModelAttribute("maReqStg") ProcessStage prcStg,
			BindingResult result, @PathVariable("id") int reqId, Model model) {
		return this.prcStgSvc.listSvcReqStgByReqId(reqId);
	}

}
