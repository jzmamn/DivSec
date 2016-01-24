package com.aymen.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.DashboardDAO;

@Service
@Transactional
public class DashboardServiceImpl implements DashboardService {

	private static final Logger logger = LoggerFactory.getLogger(DashboardServiceImpl.class);

	@Autowired
	DashboardDAO dshBoardDao;

	@Override
	public List<Object> populateSvcDonutByDivision(int divId) {
		return this.dshBoardDao.populateDonutByDivision(divId);
	}

	@Override
	public List<Object> populateSvcDonutByDivisionPeriod(int DivId, int month, int year) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> populateSvcTableDivision(int month) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> populateSvcTableMonthly(int year) {
		return this.dshBoardDao.populateTableMonthly(year);
	}

	@Override
	public List<Object> populateSvcTableAnnually() {
		return this.dshBoardDao.populateTableAnnually();
	}

	@Override
	public List<Object> populateSvcTableDivisionPeriod(int DivId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> plotSvcBarChartAnnual(int year) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> plotSvcBarChartCurrentYear() {
		return this.dshBoardDao.plotBarChartCurrentYear();
	}

	@Override
	public List<Object> populateSvcTableDivisionSummary() {
		return this.dshBoardDao.populateTableDivisionSummary();
	}

}
