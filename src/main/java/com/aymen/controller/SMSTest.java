/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aymen.controller;

import com.aymen.clickatellsms.ATCommands;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import javax.comm.CommPortIdentifier;
import javax.comm.PortInUseException;
import javax.comm.SerialPort;
import javax.comm.UnsupportedCommOperationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author jezraf
 */
@Controller
@RequestMapping(value = "/sms-test")
public class SMSTest {

    static Enumeration portList;
    static CommPortIdentifier portId;
    static String messageString = "Hi this is aymen";
    static char ch = '"';
    static String dest = ch + "+94773166010" + ch;  // 10 Digit Mobile Number.
    static InputStream inputStream;
    static SerialPort serialPort;
    static OutputStream outputStream;

    @RequestMapping(value = "/send")
    public String sendSMS() {
        String line1 = "AT+CMGF=1\r\n";
        String line2 = "AT+CMGS=" + dest + "\r\n";
        String line3 = messageString + "\r\n";
        //String line1 = "AT+CREG=2";
        //String line2 = "AT+CGREG?";

        portList = CommPortIdentifier.getPortIdentifiers();
        while (portList.hasMoreElements()) {
            portId = (CommPortIdentifier) portList.nextElement();
            if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
                if (portId.getName().equals("COM4")) {
                    System.out.println("SMS Sending....Port Found");
                    try {
                        serialPort = (SerialPort) portId.open("SimpleWriteApp", 2000);
                        ATCommands wr = new ATCommands(serialPort);

                    } catch (PortInUseException e) {
                        System.out.println("Port In Use " + e);
                    }
                    try {
                        outputStream = serialPort.getOutputStream();
                    } catch (IOException e) {
                        System.out.println("Error writing to output stream " + e);
                    }
                    try {
                        serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
                    } catch (UnsupportedCommOperationException e) {
                    }
                    try {
                        outputStream.write(line1.getBytes());
                        outputStream.write(line1.getBytes());
                        outputStream.write(line2.getBytes());
                        outputStream.write(line3.getBytes());
                        outputStream.write(26);
                        outputStream.flush();
                    } catch (Exception e) {
                        System.out.println("Error writing message " + e);
                    }
                }
            }
        }
        return "";
    }

}
