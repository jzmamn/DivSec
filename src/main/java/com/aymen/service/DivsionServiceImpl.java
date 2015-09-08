package com.aymen.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.DivisionDAO;
import com.aymen.entity.Division;

@Service
@Transactional
public class DivsionServiceImpl implements DivisionService {

	private static final Logger logger = LoggerFactory.getLogger(DivisionService.class);

	@Autowired
	private DivisionDAO divisionDAO;

	@Override
	public void createSvcDivision(Division division) {
		this.divisionDAO.createDivision(division);

	}

	@Override
	public void updateSvcDivision(Division division) {
		this.divisionDAO.updateDivision(division);

	}

	@Override
	public List<Division> listSvcDivision() {
		return divisionDAO.listDivision();
	}

	@Override
	public Division getSvcMasterById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeSvcDivision(int id) {
		// TODO Auto-generated method stub

	}

}
