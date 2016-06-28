/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aymen.service;

import com.aymen.dao.ClientDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientDAO clientDao;

    @Override
    public List<Object> listRequestNewAndOpenedSvc(int pubId) {
        return this.clientDao.listRequestNewAndOpened(pubId);
    }

    @Override
    public List<Object> listRequestApprovalSvc(int pubId) {
        return this.clientDao.listRequestApproval(pubId);
    }

    @Override
    public List<Object> listRequestCompletedSvc(int pubId) {
        return this.clientDao.listRequestCompleted(pubId);
    }

    @Override
    public List<Object> listRequestClosedSvc(int pubId) {
        return this.clientDao.listRequestClosed(pubId);
    }

    @Override
    public List<Object> listRequestRejectedSvc(int pubId) {
        return this.clientDao.listRequestRejected(pubId);
    }

}
