package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.RequestDAO;
import com.aymen.entity.Request;

@Service
@Transactional
public class RequestServiceImpl implements RequestService {

	@Autowired
	RequestDAO reqDao;

	@Override
	public void createSvcRequest(Request req) {
		req.setReqIsRead(false);
		req.setReqProcessed(false);
		this.reqDao.createRequest(req);
	}

	@Override
	public void updateSvcRequest(Request req) {
		this.reqDao.updateRequest(req);
	}

	@Override
	public List<Request> listSvcRequest() {
		return this.reqDao.listSvcRequest();
	}

	@Override
	public Request getSvcRequestById(int id) {
		return this.reqDao.getRequestById(id);
	}

	@Override
	public void deleteSvcRequest(int id) {
		this.reqDao.deleteRequest(id);
	}

}
