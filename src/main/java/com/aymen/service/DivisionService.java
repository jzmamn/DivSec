package com.aymen.service;

import java.util.List;

import com.aymen.entity.Division;

public interface DivisionService {
	public void createSvcDivision(Division division);

	public void updateSvcDivision(Division division);

	public List<Division> listSvcDivision();

	public Division getSvcMasterById(int id);

	public void removeSvcDivision(int id);
}
