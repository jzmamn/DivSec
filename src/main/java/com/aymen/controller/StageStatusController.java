package com.aymen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.StageStatus;
import com.aymen.service.StageStatusService;

@Controller
@RequestMapping(value = "/stageStatus")
public class StageStatusController {

	@Autowired
	StageStatusService ssSvc;

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadStageStaus", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<StageStatus> getData() {
		return this.ssSvc.listSvcStageStatus();
	}

}
