package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Request;

public interface RequestDAO {

	public void createRequest(Request req);

	public void updateRequest(Request req);

	public List<Request> listSvcRequest();

	public Request getRequestById(int id);

	public void deleteRequest(int id);

	public Request getLastRequest();

	public void updateRequestStatus(int reqId, int statusId);
}
