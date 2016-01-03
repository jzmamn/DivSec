package com.aymen.service;

import java.util.List;

import com.aymen.entity.Request;

public interface RequestService {

	public void createSvcRequest(Request req);

	public void updateSvcRequest(Request req);

	public List<Request> listSvcRequest();

	public Request getSvcRequestById(int id);

	public void deleteSvcRequest(int id);

}
