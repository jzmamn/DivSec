package com.aymen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Gender;
import com.aymen.service.GenderService;

@Controller
@RequestMapping(value = "/gender")
public class GenderController {

	@Autowired
	GenderService genderService;

	@RequestMapping(value = "/load", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Gender> getData() {
		return this.genderService.listSvcGender();
	}

}
