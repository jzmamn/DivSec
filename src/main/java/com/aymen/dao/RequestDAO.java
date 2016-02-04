package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Request;

public interface RequestDAO {

	public void createRequest(Request req);

	public void updateRequest(Request req);

	public List<Request> listSvcRequest();

	public List<Request> listSvcRequestByDivision(int divId);

	public Request getRequestById(int id);

	public void deleteRequest(int id);

	public Request getLastRequest();

	public void updateRequestStatus(int reqId, int statusId, boolean isVoid, String note);

	public List<Object> listBatchCount();

	public List<Object> listBatchCountByDivision(int divId);

	public List<Request> getReqByStatus(int statusId);

	public List<Request> getReqByStatusByDivision(int statusId, int divId);

	// SMS Area
	public List<Object> getSMSContent(int reqId);

	// For Request Reports
	public List<Request> filterAllRequest();

	public List<Request> filterRequest(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
			String fromDate, String toDate);

	public List<Object> getRequestTrail(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
			String fromDate, String toDate);

	public List<Object> getOverDueRequests(int reqId, String fromDate, String toDate);

	public List<Object> getDivPeriodStatus(int divId, int month, int year);

}
