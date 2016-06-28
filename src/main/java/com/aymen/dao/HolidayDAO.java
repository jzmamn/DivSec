package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Holiday;

public interface HolidayDAO {
	public void createHoliday(Holiday holiday);

	public void updateHoiday(Holiday holiday);

	public List<Holiday> listHoliday();

	public List<Holiday> listActiveHoliday();

	public Holiday getHolidayById(int holId);

	
}
