package com.aymen.controller;

import com.aymen.sms.ATCommands;
import com.aymen.clickatellsms.ClickatellHttp;
import com.aymen.component.DateComponent;
import com.aymen.entity.SmsLog;
import com.aymen.entity.Staff;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import javax.comm.CommPortIdentifier;
import javax.comm.PortInUseException;
import javax.comm.SerialPort;
import javax.comm.UnsupportedCommOperationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author jezraf
 */
@Controller
@RequestMapping(value = "/bulk-sms")
public class SMSController {

    @Autowired
    RequestService reqSvc;

    @Autowired
    UserCreationService ucs;

    @Autowired
    DateComponent dateComp;

    private static final Logger logger = LoggerFactory.getLogger(SMSController.class);

    String smsRespons;
    double charges;
    String status;

    public static String USERNAME = "jzmamn",
            APIID = "3583362",
            PASSWORD = "QLOWTWTDbHbVGA",
            APIKEY = "YOUR_KEY";

    String PORTNO = "COM4";
    Enumeration portList;
    CommPortIdentifier portId;
    char ch = '"';
    InputStream inputStream;
    SerialPort serialPort;
    OutputStream outputStream;

    @RequestMapping(value = "/send-sms-gsm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String SendBulkSMSGSM() {
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());

        try {
            List<Object> list = reqSvc.getBulkSMSContentSvc();

            if (list.isEmpty()) {
                return "No newly completd message is available to send bulk sms";
            }

            for (int i = 0; i < list.size(); i++) {
                Map mapSMS = (Map) list.get(i);

                System.out.println(mapSMS.toString());
                System.out.println(mapSMS.get("req_id"));

                int requesId = Integer.parseInt(mapSMS.get("req_id").toString());
                System.out.println(requesId);
                String phonNo = ch + "+94" + mapSMS.get("pi_mobile_phone").toString() + ch;
                String subjectName = mapSMS.get("sbj_name").toString();
                String reqStatus = mapSMS.get("rs_name").toString();
                String smsContent = "Dear Customer, the status of your request (Request id -  " + requesId + ") for " + subjectName + " is " + reqStatus + ".";

                String line1 = "AT+CMGF=1\r\n";
                String line2 = "AT+CMGS=" + phonNo + "\r\n";
                String line3 = smsContent + "\r\n";
                //String line1 = "AT+CREG=2";
                //String line2 = "AT+CGREG?";

                portList = CommPortIdentifier.getPortIdentifiers();
                while (portList.hasMoreElements()) {
                    portId = (CommPortIdentifier) portList.nextElement();
                    if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
                        if (portId.getName().equals(PORTNO)) {
                            System.out.println("SMS Sending....Port Found");
                            try {
                                if (serialPort != null) {
                                    serialPort.close();
                                }
                                serialPort = (SerialPort) portId.open("DivSec", 2000);
                                ATCommands wr = new ATCommands(serialPort);

                            } catch (PortInUseException e) {
                                System.out.println("Port In Use " + e);
                                return "Port In Use " + e;
                            }
                            try {
                                outputStream = serialPort.getOutputStream();
                            } catch (IOException e) {
                                System.out.println("Error writing to output stream " + e);
                            }
                            try {
                                serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
                            } catch (UnsupportedCommOperationException e) {
                                System.out.println("Unsupported CommOperation Exception " + e);
                                return "Unsupported CommOperation Exception " + e;
                            }
                            try {
                                outputStream.write(line1.getBytes());
                                outputStream.write(line1.getBytes());
                                outputStream.write(line2.getBytes());
                                outputStream.write(line3.getBytes());
                                outputStream.write(26);

                                outputStream.flush();
                                if (serialPort != null) {
                                    serialPort.close();
                                }

                            } catch (Exception e) {
                                System.out.println("Error writing message " + e);
                                return "Error writing message " + e;
                            }
                        }
                    }
                }

                SmsLog smsLog = new SmsLog();
                smsLog.setSmsReqId(Integer.parseInt(mapSMS.get("req_id").toString()));
                smsLog.setSmsDate(dateComp.getCurrentDate());
                smsLog.setSmsCharges(charges);
                smsLog.setSmsResponse(smsRespons);
                smsLog.setSmsStatus(status);
                smsLog.setSmsUserId(staff.getStfId());
                reqSvc.SaveSMSLogSvc(smsLog);

            }
            return "Successfully Sent";
        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
            return e.toString();
        }

    }

    @RequestMapping(value = "/send-sms-gsm/{reqId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String sendSMSForARequest(@PathVariable("reqId") int reqId) {
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());

        try {
            List<Object> list = this.reqSvc.getSvcSMSContent(reqId);

            for (int i = 0; i < list.size(); i++) {
                Map mapSMS = (Map) list.get(i);
                int requesId = Integer.parseInt(mapSMS.get("req_id").toString());
                String phonNo = ch + "+94" + mapSMS.get("pi_mobile_phone").toString() + ch;
                String subjectName = mapSMS.get("sbj_name").toString();
                String reqStatus = mapSMS.get("rs_name").toString();
                String smsContent = "Dear Customer, the status of your request (Request id -  " + requesId + ") for " + subjectName + " is " + reqStatus + ".";

                String line1 = "AT+CMGF=1\r\n";
                String line2 = "AT+CMGS=" + phonNo + "\r\n";
                String line3 = smsContent + "\r\n";
                //String line1 = "AT+CREG=2";
                //String line2 = "AT+CGREG?";

                portList = CommPortIdentifier.getPortIdentifiers();
                while (portList.hasMoreElements()) {
                    portId = (CommPortIdentifier) portList.nextElement();
                    if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
                        if (portId.getName().equals(PORTNO)) {
                            System.out.println("SMS Sending....Port Found");
                            try {

                                if (serialPort != null) {
                                    serialPort.close();
                                }

                                serialPort = (SerialPort) portId.open("SimpleWriteApp", 2000);
                                ATCommands wr = new ATCommands(serialPort);

                            } catch (PortInUseException e) {
                                System.out.println("Port In Use " + e);
                                return "Port In Use " + e;
                            }
                            try {
                                outputStream = serialPort.getOutputStream();
                            } catch (IOException e) {
                                System.out.println("Error writing to output stream " + e);
                            }
                            try {
                                serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
                            } catch (UnsupportedCommOperationException e) {
                                System.out.println("Unsupported CommOperation Exception " + e);
                                return "Unsupported CommOperation Exception " + e;
                            }
                            try {
                                outputStream.write(line1.getBytes());
                                outputStream.write(line1.getBytes());
                                outputStream.write(line2.getBytes());
                                outputStream.write(line3.getBytes());
                                outputStream.write(26);
                                outputStream.flush();
                                if (serialPort != null) {
                                    serialPort.close();
                                }
                            } catch (Exception e) {
                                System.out.println("Error writing message " + e);
                                return "Error writing message " + e.toString();
                            }
                        }
                    }
                }

                SmsLog smsLog = new SmsLog();
                smsLog.setSmsReqId(Integer.parseInt(mapSMS.get("req_id").toString()));
                smsLog.setSmsDate(dateComp.getCurrentDate());
                smsLog.setSmsCharges(charges);
                smsLog.setSmsResponse(smsRespons);
                smsLog.setSmsStatus(status);
                smsLog.setSmsUserId(staff.getStfId());
                reqSvc.SaveSMSLogSvc(smsLog);

            }
            return "Successfully Sent";
        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.toString());
            return e.toString();
        }
    }

    @RequestMapping(value = "/send-sms", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String SendBulkSMSHttp() {
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        logger.info("STARTING WITH TESTING HTTP:");
        System.out.println("STARTING WITH TESTING HTTP:");

        // Create New object (Assign auth straight away.):
        ClickatellHttp click = new ClickatellHttp(USERNAME, APIID, PASSWORD);

        // Using click, test auth:
        System.out.println("TESTING GET AUTH");
        try {
            if (click.testAuth()) {
                System.out.println("Authentication was successful");
            } else {
                logger.error("Your authentication details are not correct");
                System.out.println("Your authentication details are not correct");
            }
        } catch (UnknownHostException e) {
            logger.error("Host could not be found");
            System.out.println("Host could not be found");
        }

        // Assuming the auth was successful, lets send one message, to one
        // recipient:
        System.out.println("\nTESTING GET BALANCE");
        logger.info("TESTING GET BALANCE");
        try {
            double response = click.getBalance();
            System.out.println(response);

        } catch (UnknownHostException e) {
            logger.error("Host could not be found");
            System.out.println("Host could not be found");
        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
        }

        // Assuming the auth was successful, lets send one message, to one
        // recipient:
        System.out.println("\nTESTING SEND SINGLE MESSAGE");
        try {

            List<Object> list = reqSvc.getBulkSMSContentSvc();

            if (list.isEmpty()) {
                return "No newly completd message is available to send bulk sms";
            }

            for (int i = 0; i < list.size(); i++) {
                Map mapSMS = (Map) list.get(i);

                System.out.println(mapSMS.toString());
                System.out.println(mapSMS.get("req_id"));

                int requesId = Integer.parseInt(mapSMS.get("req_id").toString());
                String phonNo = "+94" + mapSMS.get("pi_mobile_phone").toString();
                String subjectName = mapSMS.get("sbj_name").toString();
                String reqStatus = mapSMS.get("rs_name").toString();
                String smsContent = "Dear Customer, the status of your request (Request id -  " + requesId + ") for " + subjectName + " is " + reqStatus + ".";

                System.out.println("\nTHE MESSAGE SENT " + smsContent);
                System.out.println("\n================================================");

                ClickatellHttp.Message response = click.sendMessage(phonNo, smsContent);
                System.out.println(response);
                smsRespons = response.toString();
                if (response.error != null) {
                    System.out.println(response.error);
                } else {

                    System.out.println("\nTESTING GET STATUS:");
                    System.out.println(click.getMessageStatus(response.message_id));
                    System.out.println("\nTESTING STOP:");
                    System.out.println(click.stopMessage(response.message_id));
                    System.out.println("\nTESTING GET CHARGE:");
                    ClickatellHttp.Message replies = click
                            .getMessageCharge(response.message_id);
                    charges = Double.parseDouble(replies.charge);
                    System.out.println("Charge: " + replies.charge);
                    System.out.println("Status: " + replies.status);

                    status = replies.status;
                }

                SmsLog smsLog = new SmsLog();
                smsLog.setSmsReqId(Integer.parseInt(mapSMS.get("req_id").toString()));
                smsLog.setSmsDate(dateComp.getCurrentDate());
                smsLog.setSmsCharges(charges);
                smsLog.setSmsResponse(smsRespons);
                smsLog.setSmsStatus(status);
                smsLog.setSmsUserId(staff.getStfId());
                reqSvc.SaveSMSLogSvc(smsLog);
            }
            //return smsRespons;
            return "Successfully Sent";

        } catch (UnknownHostException e) {
            logger.error("Host could not be found");
            System.out.println("Host could not be found");
            return "Host could not be found";
        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
            return e.getMessage();
        }

    }

    // Send SMS message for a request id
    @RequestMapping(value = "/send-sms/{reqId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String sendSMS(@PathVariable("reqId") int reqId) {

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        System.out.println("STARTING WITH TESTING HTTP:");

        // Create New object (Assign auth straight away.):
        ClickatellHttp click = new ClickatellHttp(USERNAME, APIID, PASSWORD);

        // Using click, test auth:
        System.out.println("TESTING GET AUTH");
        try {
            if (click.testAuth()) {
                System.out.println("Authentication was successful");
            } else {
                logger.error("Your authentication details are not correct");
                System.out.println("Your authentication details are not correct");
            }
        } catch (UnknownHostException e) {
            System.out.println("Host could not be found");
        }

        // Assuming the auth was successful, lets send one message, to one
        // recipient:
        System.out.println("\nTESTING GET BALANCE");
        try {
            double response = click.getBalance();
            System.out.println(response);

        } catch (UnknownHostException e) {
            System.out.println("Host could not be found");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        // Assuming the auth was successful, lets send one message, to one
        // recipient:
        System.out.println("\nTESTING SEND SINGLE MESSAGE");
        try {

            List<Object> list = this.reqSvc.getSvcSMSContent(reqId);

            for (int i = 0; i < list.size(); i++) {
                Map mapSMS = (Map) list.get(i);

                System.out.println(mapSMS.toString());
                System.out.println(mapSMS.get("req_id"));

                int requesId = Integer.parseInt(mapSMS.get("req_id").toString());
                String phonNo = "+94" + mapSMS.get("pi_mobile_phone").toString();
                String subjectName = mapSMS.get("sbj_name").toString();
                String reqStatus = mapSMS.get("rs_name").toString();
                String smsContent = "Dear Customer, the status of your request (Request id -  " + requesId + ") for " + subjectName + " is " + reqStatus + ".";

                System.out.println("\nTHE MESSAGE SENT " + smsContent);
                System.out.println("\n================================================");

                ClickatellHttp.Message response = click.sendMessage(phonNo, smsContent);
                System.out.println(response);
                smsRespons = response.toString();
                if (response.error != null) {
                    System.out.println(response.error);
                } else {

                    System.out.println("\nTESTING GET STATUS:");
                    System.out.println(click.getMessageStatus(response.message_id));
                    System.out.println("\nTESTING STOP:");
                    System.out.println(click.stopMessage(response.message_id));
                    System.out.println("\nTESTING GET CHARGE:");
                    ClickatellHttp.Message replies = click
                            .getMessageCharge(response.message_id);
                    charges = Double.parseDouble(replies.charge.toString());
                    System.out.println("Charge: " + replies.charge);
                    System.out.println("Status: " + replies.status);

                    status = replies.status;
                }

                SmsLog smsLog = new SmsLog();
                smsLog.setSmsReqId(Integer.parseInt(mapSMS.get("req_id").toString()));
                smsLog.setSmsDate(dateComp.getCurrentDate());
                smsLog.setSmsCharges(charges);
                smsLog.setSmsResponse(smsRespons);
                smsLog.setSmsStatus(status);
                smsLog.setSmsUserId(staff.getStfId());
                reqSvc.SaveSMSLogSvc(smsLog);
            }
            //return smsRespons;
            return "Successfully Sent";
        } catch (UnknownHostException e) {
            System.out.println("Host could not be found");
            return "Host could not be found";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return e.getMessage();
        }
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
