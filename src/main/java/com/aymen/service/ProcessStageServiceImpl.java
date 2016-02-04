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
		return prStgDao.listReqStg();
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

	@Override
	public void updateSvcStageStatus(int reqStageId, int reqStgStsId, String note) {
		prStgDao.updateStageStatus(reqStageId, reqStgStsId, note);

	}

	@Override
	public List<Object> filterSvcRequestStage(int rqId, int sbId, int pbId, int dvId, int stsId, int staffid,
			String fromDate, String toDate) {
		return this.prStgDao.filterRequestStages(rqId, sbId, pbId, dvId, stsId, staffid, fromDate, toDate);
	}

	@Override
	public List<Object> filterSvcAllRequestStage() {
		return this.prStgDao.filterAllRequestStages();
	}

	@Override
	public List<Object> getSvcRequestStageTrail(int reqId, int staffId, String fromDate, String toDate) {
		return this.prStgDao.getRequestStageTrail(reqId, staffId, fromDate, toDate);
	}

}
