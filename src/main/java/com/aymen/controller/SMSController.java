package com.aymen.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;

@Controller
@RequestMapping(value = "/sms")
public class SMSController {

	private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);
	public static final String ACCOUNT_SID = "ACc3a4202d9fad6a644b3b29f9ab32b5ab";
	public static final String AUTH_TOKEN = "4e1a8e15849dda1376c71951e2d4a838";

	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model) {
		logger.info("Welcome home! The client locale is {}.");
		return "setup/division";
	}

	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public String sendSMS(ModelMap model) throws TwilioRestException {

		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

		// Build a filter for the MessageList
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("Body", "This is you Jezeem Aymen from twilio"));
		params.add(new BasicNameValuePair("To", "0094773743424"));
		params.add(new BasicNameValuePair("From", "+18635880446"));

		MessageFactory messageFactory = client.getAccount().getMessageFactory();
		Message message = messageFactory.create(params);
		System.out.println(message.getSid());

		return "setup/division";
	}

}
