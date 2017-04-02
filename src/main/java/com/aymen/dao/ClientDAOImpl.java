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
public class ClientDAOImpl implements ClientDAO {

    private static final Logger logger = LoggerFactory.getLogger(ClientDAOImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Object> listRequestNewAndOpened(int pubId) {
        String strQuery = "SELECT * FROM divsec.vw_request_list where req_status_id in (1,2) and req_public_id=" + pubId;
        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session.createSQLQuery(strQuery);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<Object> results = query.list();
        return results;
    }

    @Override
    public List<Object> listRequestApproval(int pubId) {
        String strQuery = "SELECT * FROM divsec.vw_request_list where req_status_id in (5,6) and req_public_id=" + pubId;
        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session.createSQLQuery(strQuery);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<Object> results = query.list();
        return results;
    }

//    @Override
//    public List<Object> listRequestOpened(int pubId) {
//        String strQuery = "SELECT * FROM vw_div_period_status";
//        Session session = this.sessionFactory.getCurrentSession();
//
//        SQLQuery query = session.createSQLQuery(strQuery);
//        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
//        List<Object> results = query.list();
//        return results;
//    }

    @Override
    public List<Object> listRequestCompleted(int pubId) {
        String strQuery = "SELECT * FROM divsec.vw_request_list where req_status_id =3 and req_public_id=" + pubId;
        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session.createSQLQuery(strQuery);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<Object> results = query.list();
        return results;
    }

    @Override
    public List<Object> listRequestClosed(int pubId) {
        String strQuery = "SELECT * FROM divsec.vw_request_list where req_status_id = 4 and req_public_id=" + pubId;
        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session.createSQLQuery(strQuery);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<Object> results = query.list();
        return results;
    }

    @Override
    public List<Object> listRequestRejected(int pubId) {
        String strQuery = "SELECT * FROM divsec.vw_request_list where req_status_id = 7 and req_public_id=" + pubId;
        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session.createSQLQuery(strQuery);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<Object> results = query.list();
        return results;
    }

}
