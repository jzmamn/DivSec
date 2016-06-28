/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aymen.service;

import com.aymen.entity.Holiday;
import java.util.List;

/**
 *
 * @author jezraf
 */
public interface HolidayService {

    public void createHolidaySvc(Holiday holiday);

    public void updateHoidaySvc(Holiday holiday);

    public List<Holiday> listHolidaySvc();

    public List<Holiday> listActiveHolidaySvc();

    public Holiday getHolidayByIdSvc(int holId);
}
