package com.aymen.dao;

import java.util.List;

public interface DashboardDAO {

	public List<Object> populateDonutByDivision(int DivId);

	public List<Object> populateDonutByDivisionPeriod(int DivId, int month, int year);

	public List<Object> populateTableDivisionSummary();

	public List<Object> populateTableDivision(int month);

	public List<Object> populateTableMonthly(int year);

	public List<Object> populateTableLastModified();

	public List<Object> populateTableAnnually();

	public List<Object> populateTableDivisionPeriod(int DivId);

	public List<Object> plotBarChartCurrentYear();

	public List<Object> plotBarChartAnnual(int year);

	// --------------- Start Hod area ---------------

	public List<Object> populateTableMonthlyDivision(int year, int divId);

	public List<Object> populateTableAnnuallyDivision(int year, int divId);

	public List<Object> plotBarChartDivsionAnnual(int year, int divId);

	// --------------- End Hod area ---------------

}
