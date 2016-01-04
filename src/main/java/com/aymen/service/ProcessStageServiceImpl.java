package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.ProcessStageDAO;
import com.aymen.entity.ProcessStage;

@Service
@Transactional
public class ProcessStageServiceImpl implements ProcessStageService {

	@Autowired
	ProcessStageDAO prStgDao;

	@Override
	public void createSvcReqStg(ProcessStage processStg) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateSvcReqStg(ProcessStage processStg) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ProcessStage> listSvcReqStg() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProcessStage getSvcReqStgById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSvcReqStg(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ProcessStage> listSvcReqStgByReqId(int reqId) {
		return prStgDao.listReqStgByReqId(reqId);
	}

}
