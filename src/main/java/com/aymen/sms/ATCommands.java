package com.aymen.sms;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.TooManyListenersException;
import javax.comm.CommPortIdentifier;
import javax.comm.SerialPort;
import javax.comm.SerialPortEvent;
import javax.comm.SerialPortEventListener;

/**
 *
 * @author jezraf
 */
public class ATCommands implements Runnable, SerialPortEventListener {

    @Override
    public void run() {
    }

    static Enumeration portList;
    static CommPortIdentifier portId;
    static String messageString = "Hi this is aymen";
    static char ch = '"';
    static String dest = ch + "+94773166010" + ch;  // 10 Digit Mobile Number.
    static InputStream inputStream;

    static SerialPort serialPort;
    static OutputStream outputStream;

    @Override
    public void serialEvent(SerialPortEvent event) {
        switch (event.getEventType()) {
            case SerialPortEvent.BI:
            case SerialPortEvent.OE:
            case SerialPortEvent.FE:
            case SerialPortEvent.PE:
            case SerialPortEvent.CD:
            case SerialPortEvent.CTS:
            case SerialPortEvent.DSR:
            case SerialPortEvent.RI:
            case SerialPortEvent.OUTPUT_BUFFER_EMPTY:
                break;
            case SerialPortEvent.DATA_AVAILABLE: {

                BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                String line = "";
                try {
                    while ((line = reader.readLine()) != null) {
                        System.out.println(line);
                    }
                } catch (IOException e) {
                    System.err.println("Error while reading Port " + e);
                }
                break;

            }
        } //switch
    }

    public ATCommands(SerialPort serial) {
        try {
            inputStream = serial.getInputStream();
            try {
                serial.addEventListener((SerialPortEventListener) this);
            } catch (TooManyListenersException e) {
                System.out.println("Exception in Adding Listener" + e);
            }
            serial.notifyOnDataAvailable(true);

        } catch (Exception ex) {
            System.out.println("Exception in getting InputStream" + ex);
        }

    }

}
