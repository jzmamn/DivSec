package com.aymen.service;

import java.util.List;

import com.aymen.entity.StageStatus;

public interface StageStatusService {

	public void createSvcStageStatus(StageStatus division);

	public void updateSvcStageStatus(StageStatus division);

	public List<StageStatus> listSvcStageStatus();

	public StageStatus getSvcStageStatusById(int id);

	public void deleteSvcStageStatus(int id);
}
