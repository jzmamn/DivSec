package com.aymen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	// @RequestMapping(value = "/loadStatus", method = RequestMethod.GET,
	// produces = MediaType.APPLICATION_JSON_VALUE)
	// public @ResponseBody List<RequestStatus> getData() {
	// return this.rss.listSvcRequestStatus();
	// }

	// This method sends JSON response to the client (REST)
	@RequestMapping(value = "/loadStatus/{role}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<RequestStatus> getDataByRole(@PathVariable("role") String role) {
		return this.rss.listSvcRequestStatus(role);
	}

        //Request status for Approval
        @RequestMapping(value = "/req_status_approval", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<RequestStatus> getReqStatusApproval() {
		return this.rss.listRequestStatusForApprovalSvc();
	}

        
	// Load Request status at filter
	@RequestMapping(value = "/load-req-status", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String loadReqStatus() {
		return this.rss.loadSvcReqStatus();
	}
}
