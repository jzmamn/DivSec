package com.aymen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mail")
public class EmailController {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(method = RequestMethod.GET)
	public String loadSendEmail(ModelMap model) {
		return "procecess/requestprocess";
	}

	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public String doSendEmail(ModelMap model) {
		// takes input from e-mail form
		String recipientAddress = "jzmamn@gmail.com";
		String subject = "Test From DivSec";
		String message = "The God is the Gratest";

		// prints debug info
		System.out.println("To: " + recipientAddress);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);

		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);

		// sends the e-mail
		mailSender.send(email);

		// forwards to the view named "Result"
		return "errors_403";
	}

}
