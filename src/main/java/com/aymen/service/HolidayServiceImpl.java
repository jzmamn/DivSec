/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aymen.service;

import com.aymen.dao.HolidayDAO;
import com.aymen.entity.Holiday;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    private HolidayDAO holidayDao;

    @Override
    public void createHolidaySvc(Holiday holiday) {
        this.holidayDao.createHoliday(holiday);
    }

    @Override
    public void updateHoidaySvc(Holiday holiday) {
        this.holidayDao.updateHoiday(holiday);
    }

    @Override
    public List<Holiday> listHolidaySvc() {
        return this.holidayDao.listHoliday();
    }

    @Override
    public List<Holiday> listActiveHolidaySvc() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Holiday getHolidayByIdSvc(int holId) {
        return this.holidayDao.getHolidayById(holId);
    }

}
