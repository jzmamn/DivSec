package com.aymen.service;

import java.util.List;

import com.aymen.entity.Request;

public interface RequestService {

	public void createSvcRequest(Request req);

	public void updateSvcRequest(Request req);

	public List<Request> listSvcRequest();

	public Request getSvcRequestById(int id);

	public void updateSvcRequestStatus(int reqId, int statusId, boolean isVoid, String note);

	public void deleteSvcRequest(int id);

	public List<Object> listSvcBatchCount();

	public List<Request> getSvcReqByStatus(int statusId);

}
