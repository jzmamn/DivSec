package com.aymen.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDAOImpl implements DashboardDAO {

	private static final Logger logger = LoggerFactory.getLogger(DashboardDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> populateDonutByDivision(int divId) {
		String sql = "SELECT * FROM vw_donut_division WHERE divId = " + divId;
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@Override
	public List<Object> populateDonutByDivisionPeriod(int DivId, int month, int year) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> populateTableDivision(int month) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> populateTableMonthly(int year) {
		String sql = "SELECT * FROM vw_monthly_status  WHERE EntYear=" + year;
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> populateTableAnnually() {
		String sql = " select * from vw_annual_status ";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@Override
	public List<Object> populateTableDivisionPeriod(int DivId) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> plotBarChartAnnual(int year) {
		String sql = "SELECT * FROM vw_current_year_status  `EntYear` = " + year;

		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> plotBarChartCurrentYear() {
		String sql = "SELECT * FROM vw_current_year_status  where `EntYear` = date_format(now(),'%Y');";

		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> populateTableDivisionSummary() {
		String sql = " select * from vw_division_status ";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

}
