package com.aymen.service;

import java.util.List;

import com.aymen.entity.Division;

public interface DivisionService {
	public void createSvcDivision(Division division);

	public void updateSvcDivision(Division division);

	public List<Division> listSvcDivision();

	public Division getSvcDivisionById(int id);

	public void deleteSvcDivision(int id);
}
