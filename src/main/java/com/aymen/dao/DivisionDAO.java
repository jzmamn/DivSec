package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Division;

public interface DivisionDAO {
	public void createDivision(Division master);

	public void updateDivision(Division master);

	public List<Division> listDivision();

	public Division getDivisionById(int id);

	public void removeDivision(int id);
}
