package com.aymen.clickatellsms;

import java.net.UnknownHostException;

/**
 * @date Dec 2, 2014
 * @author Dominic Schaff <dominic.schaff@gmail.com>
 */
public class Runner {

    public static String USERNAME = "jzmamn",
            APIID = "3583362",
            PASSWORD = "QLOWTWTDbHbVGA",
            APIKEY = "YOUR_KEY";

    public static void main(String[] args) {
        TestHttp();

    }

    public static void TestHttp() {
        System.out.println("STARTING WITH TESTING HTTP:");

        // Create New object (Assign auth straight away.):
        ClickatellHttp click = new ClickatellHttp(USERNAME, APIID, PASSWORD);

        // Using click, test auth:
        System.out.println("TESTING GET AUTH");
        try {
            if (click.testAuth()) {
                System.out.println("Authentication was successful");
            } else {
                System.out
                        .println("Your authentication details are not correct");
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
            ClickatellHttp.Message response = click.sendMessage("27821234567",
                    "Hello, this is a test message!");
            System.out.println(response);
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
                System.out.println("Charge: " + replies.charge);
                System.out.println("Status: " + replies.status);
            }
        } catch (UnknownHostException e) {
            System.out.println("Host could not be found");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        // Lets send one message to multiple people:
        System.out.println("\nTESTING SEND MULTIPLE NUMBERS ONE MESSAGE");
        try {
            ClickatellHttp.Message replies[] = click.sendMessage(new String[]{
                "27821234567", "27829876543"}, "Test message");
            for (ClickatellHttp.Message s : replies) {
                System.out.println(s);
            }
        } catch (UnknownHostException e) {
            System.out.println("Host could not be found");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        // Lets do a coverage test:
        System.out.println("\nTESTING COVERAGE");
        try {
            double reply = click.getCoverage("27820909090");
            if (reply < 0) {
                System.out.println("Route coverage failed");
            } else {
                System.out
                        .println("Route coverage succeded, message could cost:"
                                + reply);
            }
        } catch (UnknownHostException e) {
            System.out.println("Host could not be found");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
