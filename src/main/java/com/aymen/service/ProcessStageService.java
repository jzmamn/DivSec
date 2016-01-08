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

}
