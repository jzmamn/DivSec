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

	private static final Logger logger = LoggerFactory
			.getLogger(DivisionService.class);

	@Autowired
	private DivisionDAO divisionDAO;

	@Override
		public boolean createSvcDivision(Division division) {
		logger.info("createSvcDivision");
		try {
			this.divisionDAO.createDivision(division);
			logger.debug("service:");
			return true;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}

	}

	@Override
	@Transactional
	public boolean updateSvcDivision(Division master) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional
	public List<Division> listSvcDivision() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public Division getSvcMasterById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public boolean removeSvcDivision(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
