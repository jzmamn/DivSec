package com.aymen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Holiday;
import com.aymen.entity.Request;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Order;

@Repository
public class HolidayDaoImpl implements HolidayDAO {

    private static final Logger logger = LoggerFactory.getLogger(HolidayDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void createHoliday(Holiday holiday) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(holiday);

        logger.info("Holiday saved successfully, Holiday Details=" + holiday.getHolId());
    }

    @Override
    public void updateHoiday(Holiday holiday) {
        Session session = sessionFactory.getCurrentSession();
        session.update(holiday);
        logger.info("Holiday Updated successfully, Holiday Details=" + holiday.getHolId());
    }

    @Override
    public List<Holiday> listHoliday() {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Holiday.class);
        crit.addOrder(Order.desc("holDate"));
        return (List<Holiday>) crit.list();
    }

    @Override
    public List<Holiday> listActiveHoliday() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Holiday getHolidayById(int holId) {
        Session session = this.sessionFactory.getCurrentSession();
        Holiday holiday = (Holiday) session.load(Holiday.class, holId);
        logger.info("Person loaded successfully, Person details=" + holiday.getHolId());
        return holiday;
    }

    @Override
    public List<Object> listHolidayForCalender() {
        String strQry = "select * from vw_holiday_cal";
        System.out.println(strQry);
        Session session = this.sessionFactory.getCurrentSession();
        SQLQuery query = session.createSQLQuery(strQry);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<Object> results = query.list();
        return results;
    }

}
