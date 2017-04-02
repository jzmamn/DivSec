package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.StageStatusDAO;
import com.aymen.entity.StageStatus;

@Service
@Transactional
public class StageStatusServiceImpl implements StageStatusService {

	@Autowired
	StageStatusDAO ssDao;

	@Override
	public void createSvcStageStatus(StageStatus division) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateSvcStageStatus(StageStatus division) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<StageStatus> listSvcStageStatus() {
		return this.ssDao.listStageStatus();
	}

	@Override
	public StageStatus getSvcStageStatusById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSvcStageStatus(int id) {
		// TODO Auto-generated method stub

	}

}
