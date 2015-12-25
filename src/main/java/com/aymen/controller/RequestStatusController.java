package com.aymen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.RequestStatus;
import com.aymen.service.RequestStatusService;

@Controller
@RequestMapping(value = "/requestStatus")
public class RequestStatusController {

	@Autowired
	RequestStatusService rss;

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadStatus", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<RequestStatus> getData() {
		return this.rss.listSvcRequestStatus();
	}
}
