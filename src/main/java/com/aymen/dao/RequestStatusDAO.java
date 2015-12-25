package com.aymen.dao;

import java.util.List;

import com.aymen.entity.RequestStatus;

public interface RequestStatusDAO {
	public void createRequestStatus(RequestStatus reqStatus);

	public void updateRequestStatus(RequestStatus reqStatus);

	public List<RequestStatus> listRequestStatus();

	public RequestStatus getRequestStatusById(int id);

	public void deleteRequestStatus(int id);
}
