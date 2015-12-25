package com.aymen.service;

import java.util.List;

import com.aymen.entity.RequestStatus;

public interface RequestStatusService {
	public void createSvcRequestStatus(RequestStatus reqStatus);

	public void updateSvcRequestStatus(RequestStatus reqStatus);

	public List<RequestStatus> listSvcRequestStatus();

	public RequestStatus getSvcRequestStatus(int id);

	public void deleteSvcRequestStatus(int id);
}
