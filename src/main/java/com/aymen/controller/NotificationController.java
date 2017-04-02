package com.aymen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Notification;
import com.aymen.service.NotificationService;

@Controller
@RequestMapping(value = "/notification")

public class NotificationController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(NotificationController.class);

	@Autowired
	NotificationService ntService;

	@RequestMapping(value = "/load", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Notification> getData() {
		return this.ntService.listSvcGender();
	}

}
