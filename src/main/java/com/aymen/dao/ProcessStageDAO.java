package com.aymen.dao;

import java.util.List;

import com.aymen.entity.ProcessStage;
import com.aymen.entity.Staff;

public interface ProcessStageDAO {

	public void createReqStg(ProcessStage processStg);

	public void updateReqStg(ProcessStage processStg);

	public List<ProcessStage> listReqStg();

	public ProcessStage getReqStgById(int id);

	public void deleteReqStg(int id);

	public List<ProcessStage> listReqStgByReqId(int reqId);

	public void updateStageStatus(int reqStageId, int reqStgStsId, String note, Staff staff);

	// For Request Stage Reports

	public List<Object> filterAllRequestStages();

	public List<Object> filterRequestStages(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
			String fromDate, String toDate);

	public List<Object> getRequestStageTrail(int reqId, int staffId, String fromDate, String toDate);

}
