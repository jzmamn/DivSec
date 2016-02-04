package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.RequestStatusDAO;
import com.aymen.entity.RequestStatus;

@Service
@Transactional
public class RequestStatusServiceImpl implements RequestStatusService {

	@Autowired
	RequestStatusDAO reqDao;

	@Override
	public void createSvcRequestStatus(RequestStatus reqStatus) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateSvcRequestStatus(RequestStatus reqStatus) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<RequestStatus> listSvcRequestStatus(String role) {
		return this.reqDao.listRequestStatus(role);
	}

	@Override
	public RequestStatus getSvcRequestStatus(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSvcRequestStatus(int id) {

	}

	@Override
	public String loadSvcReqStatus() {
		return reqDao.loadReqStatus();
	}

}
