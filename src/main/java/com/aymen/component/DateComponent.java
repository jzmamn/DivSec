/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aymen.component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Component;

/**
 *
 * @author jezraf
 */
@Component
public class DateComponent {

    public Date getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String dateInString = sdf.format(new Date());
        Date txnDate;
        try {
            txnDate = sdf.parse(dateInString);
            return txnDate;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }

    }
}
