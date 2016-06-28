package com.aymen.controller;

import com.aymen.component.DateComponent;
import com.aymen.entity.EmailLog;
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
import com.aymen.entity.Staff;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Controller
@RequestMapping(value = "/mail")
public class EmailController {

    private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    UserCreationService ucs;

    @Autowired
    DateComponent dateComp;

    @Autowired
    RequestService reqSvc;

    @RequestMapping(method = RequestMethod.GET)
    public String loadSendEmail(ModelMap model) {
        return "procecess/requestprocess";
    }

    @RequestMapping(value = "/sendmail/{reqId}", method = RequestMethod.GET)
    public @ResponseBody
    Object doSendEmail(ModelMap model, @PathVariable("reqId") int reqId) {
        Request req = reqSvc.getSvcRequestById(reqId);
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());

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
        String emailSubject = "Request Statuse of " + subjectName;
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

            EmailLog emailLog = new EmailLog();
            emailLog.setEmailDate(dateComp.getCurrentDate());
            emailLog.setEmailReqId(reqId);
            emailLog.setEmailUserId(staff.getStfId());
            reqSvc.SaveEmailLogSvc(emailLog);
            return "Mail has been sent";
        } catch (MailException ex) {
            logger.error("Mail send error" + ex.toString());
            return ex.toString();
        }

    }

    @RequestMapping(value = "/send-bulk-email", method = RequestMethod.GET)
    public @ResponseBody
    String doSendBulkEmail(ModelMap model) {
        List<Object> emailList = reqSvc.getBulkEmailContentSvc();
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        if (emailList.isEmpty()) {
            return "No Emails to be sent";
        }
        for (int i = 0; i < emailList.size(); i++) {
            System.out.println(emailList.get(i));
            Map mapEmail = (Map) emailList.get(i);

            String reqId = mapEmail.get("req_id").toString();
            String subjectName = mapEmail.get("sbj_name").toString();
            String subjectCode = mapEmail.get("sbj_code").toString();
            String status = mapEmail.get("rs_name").toString();
            String pubName = mapEmail.get("pi_name").toString();
            String emailAdd = mapEmail.get("pi_email").toString();

            String recipientAddress = emailAdd;
            String emailSubject = "Request Statuse of " + subjectName;
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
                EmailLog emailLog = new EmailLog();
                emailLog.setEmailDate(dateComp.getCurrentDate());
                emailLog.setEmailReqId(Integer.parseInt(mapEmail.get("req_id").toString()));
                emailLog.setEmailUserId(staff.getStfId());
                reqSvc.SaveEmailLogSvc(emailLog);
                return "Mail has been sent";
            } catch (MailException ex) {
                logger.error("Mail send error" + ex.toString());
                return ex.toString();
            }
        }
        return "";
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

    private String getUserRole() {
        String userRole = null;
        Object role = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        if (role instanceof UserDetails) {
            userRole = ((UserDetails) role).getAuthorities().toString();
        } else {
            userRole = role.toString();
        }

        userRole = userRole.replace("[", "");
        userRole = userRole.replace("]", "");
        return userRole;
    }

}
