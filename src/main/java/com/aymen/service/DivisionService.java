package com.aymen.service;

import java.util.List;

import com.aymen.entity.Division;

public interface DivisionService {
	public boolean createSvcDivision(Division division);
    public boolean updateSvcDivision(Division division);
    public List<Division> listSvcDivision();
    public Division getSvcMasterById(int id);
    public boolean removeSvcDivision(int id);
}
