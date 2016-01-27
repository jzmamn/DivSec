package com.aymen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Request;
import com.aymen.service.RequestService;

@Controller
@RequestMapping(value = "/mail")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	RequestService reqSvc;

	@RequestMapping(method = RequestMethod.GET)
	public String loadSendEmail(ModelMap model) {
		return "procecess/requestprocess";
	}

	@RequestMapping(value = "/sendmail/{reqId}", method = RequestMethod.GET)
	public @ResponseBody Object doSendEmail(ModelMap model, @PathVariable("reqId") int reqId) {
		Request req = reqSvc.getSvcRequestById(reqId);

		String subjectName = req.getSubject().getSbjName();
		String subjectCode = req.getSubject().getSbjCode();
		String status = req.getRequestStatus().getRsName();
		String pubName = req.getPublicIndividual().getPiName();
		String emailAdd = req.getPublicIndividual().getPiEmail();

		if (emailAdd == null) {
			return "Email Address is not available";
		}

		// takes input from e-mail form
		String recipientAddress = emailAdd;
		String emailSubject = "Request Statuse - " + subjectName;
		String message = "Dear " + pubName + ",\n" + "The details of your request are as follows:\nRequest Id: " + reqId
				+ "\nSubject Code: " + subjectCode + "\nSubject Name: " + subjectName + "\nRequest Status: " + status
				+ "\nThis is an auto generated email. Please do not reply to this email.";

		// prints debug info
		System.out.println("To: " + recipientAddress);
		System.out.println("Subject: " + emailSubject);
		System.out.println("Message: " + message);

		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(emailSubject);
		email.setText(message);

		try {
			// sends the e-mail
			mailSender.send(email);
			return "Mail has been sent to " + pubName;
		} catch (MailException ex) {
			logger.error("Mail send error" + ex.toString());
			return ex.toString();

		}

	}

}
