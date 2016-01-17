package com.aymen.service;

import java.util.List;

import com.aymen.entity.ProcessStage;

public interface ProcessStageService {
	public void createSvcReqStg(ProcessStage processStg);

	public void updateSvcReqStg(ProcessStage processStg);

	public List<ProcessStage> listSvcReqStg();

	public ProcessStage getSvcReqStgById(int id);

	public void deleteSvcReqStg(int id);

	public List<ProcessStage> listSvcReqStgByReqId(int reqId);

	public void updateSvcStageStatus(int reqStageId, int reqStgStsId, String note);

	// For Request Report

	public List<Object> filterSvcRequestStage(int rqId, int sbId, int pbId, int dvId, int stsId, String fromDate,
			String toDate);

	public List<Object> filterSvcAllRequestStage();

}
