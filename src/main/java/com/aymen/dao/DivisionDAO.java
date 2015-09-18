package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Division;

public interface DivisionDAO {
	public void createDivision(Division division);

	public void updateDivision(Division division);

	public List<Division> listDivision();

	public Division getDivisionById(int id);

	public void deleteDivision(int id);
}
