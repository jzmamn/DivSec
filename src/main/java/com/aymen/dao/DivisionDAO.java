package com.aymen.dao;

import java.util.List;
import com.aymen.entity.Division;

public interface DivisionDAO {
	public boolean createDivision(Division master);
    public boolean updateDivision(Division master);
    public List<Division> listDivision();
    public Division getMasterById(int id);
    public boolean removeDivision(int id);
}
