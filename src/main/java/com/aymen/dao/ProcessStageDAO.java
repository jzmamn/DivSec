package com.aymen.dao;

import java.util.List;

import com.aymen.entity.ProcessStage;

public interface ProcessStageDAO {

	public void createReqStg(ProcessStage processStg);

	public void updateReqStg(ProcessStage processStg);

	public List<ProcessStage> listReqStg();

	public ProcessStage getReqStgById(int id);

	public void deleteReqStg(int id);

	public List<ProcessStage> listReqStgByReqId(int reqId);

}
