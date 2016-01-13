package com.aymen.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.InstructionDAO;
import com.aymen.entity.Instructions;

@Service
@Transactional
public class InstructionServiceImpl implements InstructionDAO {

	private static final Logger logger = LoggerFactory.getLogger(InstructionServiceImpl.class);

	@Autowired
	private InstructionDAO instDao;

	@Override
	public void createInstructions(Instructions inst) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateInstructions(Instructions inst) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Instructions> listInstructions() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Instructions getInstructionsById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteInstructions(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Instructions> listInstByRequest(int reqId) {
		// TODO Auto-generated method stub
		return null;
	}

}
