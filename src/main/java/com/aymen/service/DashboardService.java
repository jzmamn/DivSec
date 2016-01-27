package com.aymen.service;

import java.util.List;

public interface DashboardService {
	public List<Object> populateSvcDonutByDivision(int DivId);

	public List<Object> populateSvcDonutByDivisionPeriod(int DivId, int month, int year);

	public List<Object> populateSvcTableDivision(int month);

	public List<Object> populateSvcTableMonthly(int year);

	public List<Object> populateSvcTableLastModified();

	public List<Object> populateSvcTableDivisionSummary();

	public List<Object> populateSvcTableAnnually();

	public List<Object> populateSvcTableDivisionPeriod(int DivId);

	public List<Object> plotSvcBarChartCurrentYear();

	public List<Object> plotSvcBarChartAnnual(int year);

	// --------------- End Hod area ---------------
	public List<Object> populateSvcTableMonthlyDivision(int year, int divId);

	public List<Object> populateSvcTableAnnuallyDivision(int year, int divId);

	public List<Object> plotSvcBarChartDivsionAnnual(int year, int divId);
	// --------------- End Hod area ---------------
}
