package com.aymen.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.RequestStatus;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository
public class RequestStatusDAOImpl implements RequestStatusDAO {

    private static final Logger logger = LoggerFactory.getLogger(DvisionDaoImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void createRequestStatus(RequestStatus reqStatus) {
        // TODO Auto-generated method stub

    }

    @Override
    public void updateRequestStatus(RequestStatus reqStatus) {
        // TODO Auto-generated method stub

    }

    @SuppressWarnings({"unused", "unchecked"})
    @Override
    public List<RequestStatus> listRequestStatus(String role) {
        Session session = this.sessionFactory.getCurrentSession();
        String qryRole = "";
        if (role.equals("ROLE_ADMIN")) {
            qryRole = " from RequestStatus Where rs_Id NOT IN (1)";
        } else if (role.equals("ROLE_DS")) {
            qryRole = " from RequestStatus Where rs_Id NOT IN (1)";
        } else if (role.equals("ROLE_HOD")) {
            qryRole = " from RequestStatus Where rs_Id NOT IN (1)";
        } else {
            qryRole = " from RequestStatus Where rs_Id NOT IN (1,6,7)";
        }

        List<RequestStatus> reqStatusList = session.createQuery(qryRole).list();
        for (RequestStatus d : reqStatusList) {
            logger.info("Person List::" + d);
            // System.out.println(d);
        }
        return reqStatusList;
    }

    @Override
    public RequestStatus getRequestStatusById(int id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void deleteRequestStatus(int id) {
        // TODO Auto-generated method stub

    }

    @SuppressWarnings("unchecked")
    @Override
    public String loadReqStatus() {
        String strQry = "select rs_id id, rs_name `text` from request_status";
        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session.createSQLQuery(strQry);
        query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);

        List<Object> lst = query.list();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();
        try {
            mapper.writeValue(out, lst);
            System.out.println(out.toString());
            return out.toString();
        } catch (JsonGenerationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "JsonGenerationException" + e.toString();
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "JsonMappingException" + e.toString();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "IOException" + e.toString();
        }

    }

    @Override
    public List<RequestStatus> listRequestStatusForApproval() {
        Session session = this.sessionFactory.getCurrentSession();

        String qryRole = " from RequestStatus Where rs_Id  IN (5,6,7) ";

        List<RequestStatus> reqStatusList = session.createQuery(qryRole).list();
        for (RequestStatus d : reqStatusList) {
            logger.info("Person List::" + d);
            // System.out.println(d);
        }
        return reqStatusList;
    }

}
